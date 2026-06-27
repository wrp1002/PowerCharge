#import <Foundation/Foundation.h>
#import "PCPRootListController.h"
#import <AudioToolbox/AudioToolbox.h>

#import <rootless.h>
#import "common.h"


@implementation PCPRootListController

- (NSArray *)specifiers {
	if (!_specifiers)
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	return _specifiers;
}

-(void)OpenGithub {
	UIApplication *application = [UIApplication sharedApplication];
	NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://github.com/wrp1002/%@", TWEAK_NAME]];
	[application openURL:URL options:@{} completionHandler:^(BOOL success) {
		if (success) {
			//NSLog(@"Opened url");
		}
	}];
}

-(void)OpenPaypal {
	UIApplication *application = [UIApplication sharedApplication];
	NSURL *URL = [NSURL URLWithString:@"https://paypal.me/wrp1002"];
	[application openURL:URL options:@{} completionHandler:^(BOOL success) {
		if (success) {
			//NSLog(@"Opened url");
		}
	}];
}

-(void)OpenReddit {
	UIApplication *application = [UIApplication sharedApplication];
	NSURL *URL = [NSURL URLWithString:@"https://reddit.com/u/wes_hamster"];
	[application openURL:URL options:@{} completionHandler:^(BOOL success) {
		if (success) {
			//NSLog(@"Opened url");
		}
	}];
}

-(void)OpenEmail {
	UIApplication *application = [UIApplication sharedApplication];
	    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"mailto:wes.hamster@gmail.com?subject=%@", TWEAK_NAME]];
	[application openURL:URL options:@{} completionHandler:^(BOOL success) {
		if (success) {
			//NSLog(@"Opened url");
		}
	}];
}

-(void)Reset {
	NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:BUNDLE];
	NSArray *allKeys = [prefs dictionaryRepresentation].allKeys;

	for (NSString *key in allKeys)
		[prefs removeObjectForKey:key];

	[prefs synchronize];
	[self Respring];
}

-(void)Respring {
	// From Cephei since other methods I tried didn't work
	[[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FrontBoardServices.framework"] load];
	[[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SpringBoardServices.framework"] load];

	Class $FBSSystemService = NSClassFromString(@"FBSSystemService");
	Class $SBSRelaunchAction = NSClassFromString(@"SBSRelaunchAction");

	if ($FBSSystemService && $SBSRelaunchAction) {
		SBSRelaunchAction *restartAction = [$SBSRelaunchAction actionWithReason:@"RestartRenderServer" options:SBSRelaunchActionOptionsFadeToBlackTransition targetURL:nil];
		[[$FBSSystemService sharedService] sendActions:[NSSet setWithObject:restartAction] withResult:nil];
	}

}

@end