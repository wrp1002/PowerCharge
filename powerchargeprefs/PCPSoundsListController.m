#import "PCPSoundsListController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <rootless.h>

#import "../common.h"


@implementation PCPSoundsListController

	- (void)previewSound:(PSSpecifier *)specifier {
		NSString *file = [specifier propertyForKey:@"soundFile"];
		NSString *path = [ROOT_PATH_NS(SOUNDS_DIR) stringByAppendingPathComponent:file];
		NSURL *url = [NSURL fileURLWithPath:path];
		SystemSoundID sid = 0;
		OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
		if (err == kAudioServicesNoError) {
			AudioServicesPlaySystemSound(sid);
		}
	}

	- (NSArray *)specifiers {
		if (_specifiers) return _specifiers;

		NSMutableArray *specifiers = [NSMutableArray array];

		PSSpecifier *group = [
			PSSpecifier preferenceSpecifierNamed:@"Tap a sound to preview it"
			target:self
			set:NULL
			get:NULL
			detail:nil
			cell:PSGroupCell
			edit:nil
		];
		[specifiers addObject:group];

		NSString *sounds_dir = ROOT_PATH_NS(SOUNDS_DIR);
		NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:sounds_dir error:nil];
		NSArray *soundFiles = [files filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSString *f, id _) {
			return [@[@"mp3", @"caf", @"wav"] containsObject:f.pathExtension.lowercaseString];
		}]];

		for (NSString *file in [soundFiles sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]) {
			PSSpecifier *toggle = [PSSpecifier preferenceSpecifierNamed:file
													 target:self
														set:@selector(setPreferenceValue:specifier:)
														get:@selector(readPreferenceValue:)
													 detail:nil
													   cell:PSSwitchCell
													   edit:nil];
			[toggle setProperty:file forKey:@"key"];
			[toggle setProperty:BUNDLE forKey:@"defaults"];
			[toggle setProperty:@YES forKey:@"default"];
			[toggle setProperty:@TWEAK_NOTIFY forKey:@"PostNotification"];
			[toggle setProperty:file forKey:@"soundFile"];
			toggle->action = @selector(previewSound:);
			[specifiers addObject:toggle];
		}

		_specifiers = specifiers;
		return _specifiers;
	}

	- (id)readPreferenceValue:(PSSpecifier *)specifier {
		NSString *file = [specifier propertyForKey:@"key"];
		NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:BUNDLE];
		if (![prefs objectForKey:file]) return @YES;
		return @([prefs boolForKey:file]);
	}

	- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
		NSString *file = [specifier propertyForKey:@"key"];
		NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:BUNDLE];
		[prefs setBool:[value boolValue] forKey:file];
		[prefs synchronize];
	}

@end
