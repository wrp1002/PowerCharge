#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <rootless.h>
#import "libcolorpicker.h"
#import "Debug.h"

#import "Tweak.h"
#import "common.h"


// ====================== Preferences ======================

static bool enabled;
static NSArray *enabledSounds;


// ====================== Globals ======================
static NSArray<NSString *> *chargingSounds = nil;
static NSMutableDictionary<NSString *, NSNumber *> *soundIDs = nil;

static void loadChargingSounds() {
	NSString *dir = ROOT_PATH_NS(SOUNDS_DIR);
	NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dir error:nil];

	chargingSounds = [files filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSString *f, id _) {
		return [@[@"mp3", @"caf", @"wav"] containsObject:f.pathExtension.lowercaseString];
	}]];

	soundIDs = [NSMutableDictionary dictionary];

	for (NSString *file in chargingSounds) {
		NSString *path = [dir stringByAppendingPathComponent:file];
		NSURL *url = [NSURL fileURLWithPath:path];
		SystemSoundID sid = 0;
		OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
		if (err == kAudioServicesNoError) {
			soundIDs[file] = @(sid);
			[Debug Log:[NSString stringWithFormat:@"Loaded sound: %@", file]];
		} else {
			[Debug Log:[NSString stringWithFormat:@"Failed to load %@, OSStatus: %d", file, (int)err]];
		}
	}
}

static BOOL isSoundEnabled(NSString *filename) {
	NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:BUNDLE];
	// If key doesn't exist yet, returns NO from boolForKey — so default to YES
	return [prefs objectForKey:filename] ? [prefs boolForKey:filename] : YES;
}


static void playChargingSound() {
	if (soundIDs.count == 0) loadChargingSounds();
	if (soundIDs.count == 0) return;

	NSArray *enabledKeys = [soundIDs.allKeys filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSString *file, id _) {
		return isSoundEnabled(file);
	}]];

	if (enabledKeys.count == 0) {
		[Debug Log:@"No enabled sounds to play"];
		return;
	}

	NSString *pick = enabledKeys[arc4random_uniform((uint32_t)enabledKeys.count)];
	SystemSoundID sid = [soundIDs[pick] unsignedIntValue];

	[Debug Log:[NSString stringWithFormat:@"Playing: %@", pick]];
	AudioServicesPlaySystemSound(sid);
}

%hook SBUIController

	- (void)playChargingChimeIfAppropriate {
		if (!enabled) {
			%orig;
			return;
		}
		// suppress the default chime entirely
		[Debug Log:@"playChargingChimeIfAppropriate suppressed"];
	}

	- (void)updateBatteryState:(id)arg1 {
		if (!enabled) {
			%orig;
			return;
		}

		NSDictionary *dict = (NSDictionary *)arg1;
		BOOL wasConnected = [self isOnAC] || [self isConnectedToWirelessInternalCharger] || [self isConnectedToQiPower];

		%orig;

		BOOL isNowConnected = [dict[@"ExternalConnected"] boolValue];

		if (!wasConnected && isNowConnected) {
			[Debug Log:@"ExternalConnected transition, playing sound"];
			playChargingSound();
		}
	}
%end


static void loadPrefs() {
	NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:BUNDLE];
	enabled = [prefs boolForKey:@"kEnabled"];
	[Debug Log:[NSString stringWithFormat:@"enabled: %d", enabled]];
}



// ====================== Constructor ======================

%ctor {
	[Debug Log:@"================= init ======================="];

	NSDictionary *defaultPrefs = @{
		@"kEnabled": @YES,
		@"kEnabledSounds": @[],
	};

	NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:BUNDLE];
	[prefs registerDefaults:defaultPrefs];

	loadPrefs();
	loadChargingSounds();

	CFNotificationCenterAddObserver(
		CFNotificationCenterGetDarwinNotifyCenter(),
		NULL,
		(CFNotificationCallback)loadPrefs,
		CFSTR(TWEAK_NOTIFY),
		NULL,
		CFNotificationSuspensionBehaviorDeliverImmediately
	);
}

