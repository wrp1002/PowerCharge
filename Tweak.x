#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <rootless.h>
#import "libcolorpicker.h"
#import "Debug.h"


@protocol BSInvalidatable;
@class CSMagSafeAccessory, SBHomeScreenWindow, SBIconContentView, UIView, SBHomeScreenBackdropViewBase, SBWindow, SBWallpaperEffectView, NSMapTable, UIForceStageInteractionProgress, BCBatteryDeviceController, SBFZStackParticipant, SBHUDController, SBVolumeControl, NSMutableDictionary, SBDismissOnlyAlertItem, SBAppSwitcherSettings, NSMutableSet, ATXAppDirectoryClient, ACCConnectionInfo, BSAbsoluteMachTimer, SBFMotionAlarmController, SWWakingTimer, SBWindowScene, SBIconController, NSString;

@interface SBUIController : NSObject {

	SBHomeScreenWindow* _window;
	SBIconContentView* _iconsView;
	UIView* _contentView;
	SBHomeScreenBackdropViewBase* _homeScreenBackdropView;
	SBWindow* _homeScreenDimmingWindow;
	SBWallpaperEffectView* _reachabilityWallpaperEffectView;
	NSMapTable* _statusBarAssertionsByWindowScene;
	UIForceStageInteractionProgress* _homeButtonForceProgress;
	BCBatteryDeviceController* _batteryDeviceController;
	unsigned _lastVolumeDownToControl : 1;
	unsigned _isBatteryCharging : 1;
	unsigned _isFullyCharged : 1;
	unsigned _isBatteryCritical : 1;
	unsigned _isOnAC : 1;
	unsigned _isConnectedToExternalChargingAccessory : 1;
	unsigned _isConnectedToPoweredExternalChargingAccessory : 1;
	unsigned _isConnectedToUnsupportedChargingAccessory : 1;
	unsigned _isConnectedToChargeIncapablePowerSource : 1;
	unsigned _wasConnectedToWirelessChargingAccessory : 1;
	unsigned _isConnectedToWirelessInternalCharger : 1;
	unsigned _isConnectedToWirelessInternalChargingAccessory : 1;
	unsigned _isConnectedToWirelessInternalAccessory : 1;
	unsigned _isConnectedToWindowedAccessory : 1;
	CGRect _visibleScreenCoordinatesForWindowedAccessory;
	id<BSInvalidatable> _suspendProximityForAttachedWindowedAccessoryAssertion;
	SBFZStackParticipant* _zStackParticipant;
	unsigned _isConnectedToQiPower : 1;
	SBHUDController* _HUDController;
	SBVolumeControl* _volumeControl;
	float _batteryCapacity;
	BOOL _supportsDetailedBatteryCapacity;
	BOOL _disableAppSwitchForcePressDueToHomeButtonForce;
	int _powerStateUpdateToken;
	NSMutableDictionary* _powerSourceHasChimed;
	int _batteryLoggingStartCapacity;
	SBDismissOnlyAlertItem* _unsupportedChargerAlert;
	SBAppSwitcherSettings* _switcherSettings;
	NSMutableSet* _contentRequiringReasons;
	ATXAppDirectoryClient* _appDirectoryClient;
	BOOL _disallowsPointerInteraction;
	id<BSInvalidatable> _wallpaperRasterizationAssertion;
	int _firmwareUpdateStateToken;
	ACCConnectionInfo* _accessoryConnectionInfo;
	BSAbsoluteMachTimer* _accessoryAttachmentAnimationBlockingTimer;
	SBFMotionAlarmController* _motionAlarmController;
	BOOL _disableChimeForWirelessCharging;
	BOOL _disableScreenWakeForWirelessCharging;
	SWWakingTimer* _debounceWirelessChargingTimer;
	BOOL _isAccessoryAnimationAllowed;
	CSMagSafeAccessory* _lastAttachedAccessory;
	CSMagSafeAccessory* _lastDetachedAccessory;
	NSMutableDictionary* _accessoriesAttachedByUUID;
	NSMutableDictionary* _accessoriesSuppressedByUUID;
	BOOL _chargingChimeEnabled;
	SBWindowScene* _windowScene;
	SBIconController* _iconController;
}
@property (nonatomic,readonly) SBIconController * iconController;                                                                                    //@synthesize iconController=_iconController - In the implementation block
@property (assign,nonatomic) BOOL chargingChimeEnabled;                                                                                              //@synthesize chargingChimeEnabled=_chargingChimeEnabled - In the implementation block
@property (assign,nonatomic) BOOL homeScreenAutorotatesEvenWhenIconIsDragging;
@property (readonly) unsigned long long hash;
@property (readonly) Class superclass;
@property (copy,readonly) NSString * description;
@property (copy,readonly) NSString * debugDescription;
@property (getter=isOnAC,nonatomic,readonly) BOOL onAC;
@property (getter=isConnectedToExternalChargingSource,nonatomic,readonly) BOOL connectedToExternalChargingSource;
@property (getter=isConnectedToWirelessInternalCharger,nonatomic,readonly) BOOL connectedToWirelessInternalCharger;
@property (getter=isConnectedToWirelessInternalChargingAccessory,nonatomic,readonly) BOOL connectedToWirelessInternalChargingAccessory;
@property (getter=isConnectedToQiPower,nonatomic,readonly) BOOL connectedToQiPower;
@property (nonatomic,readonly) CSMagSafeAccessory * lastAttachedAccessory;
@property (nonatomic,readonly) CSMagSafeAccessory * lastDetachedAccessory;
@property (nonatomic,readonly) BOOL isAccessoryAnimationAllowed;
+(id)sharedInstance;
+(CGRect)statusBarFrameForSnapshotFrame:(CGRect)arg1 remainderFrame:(CGRect*)arg2 orientation:(long long)arg3 statusBarStyleRequest:(id)arg4 hidden:(BOOL)arg5 ;
+(CGRect)statusBarFrameForSnapshotFrame:(CGRect)arg1 orientation:(long long)arg2 statusBarStyleRequest:(id)arg3 hidden:(BOOL)arg4 ;
+(id)_effectiveStatusBarSettingsForSnapshot:(id)arg1 sceneHandle:(id)arg2 ;
+(id)sharedInstanceIfExists;
+(CGRect)statusBarFrameForDeviceApplicationSceneHandle:(id)arg1 displayConfiguration:(id)arg2 interfaceOrientation:(long long)arg3 statusBarStyleRequest:(id)arg4 withinBounds:(CGRect)arg5 inReferenceSpace:(BOOL)arg6 ;
+(id)zoomViewForDeviceApplicationSceneHandle:(id)arg1 displayConfiguration:(id)arg2 interfaceOrientation:(long long)arg3 snapshot:(id)arg4 snapshotSize:(CGSize)arg5 statusBarDescriptor:(id)arg6 decodeImage:(BOOL)arg7 hasOrientationMismatchForClassicApp:(BOOL)arg8 customContainerBounds:(CGRect)arg9 ;
-(void)accessoryEndpointDetached:(id)arg1 forConnection:(id)arg2 ;
-(void)connectedDevicesDidChange:(id)arg1 ;
-(void)accessoryEndpointAttached:(id)arg1 transportType:(int)arg2 protocol:(int)arg3 properties:(id)arg4 forConnection:(id)arg5 ;
-(void)zStackParticipantDidChange:(id)arg1 ;
-(void)cancelInProcessAnimations;
-(void)cancelVolumeEvent;
-(BOOL)homeScreenAutorotatesEvenWhenIconIsDragging;
-(void)ACPowerChanged;
-(void)setAllowIconRotation:(BOOL)arg1 forReason:(id)arg2 ;
-(void)nudgeIconInterfaceOrientation:(long long)arg1 duration:(double)arg2 ;
-(void)setHomeScreenAutorotatesEvenWhenIconIsDragging:(BOOL)arg1 ;
-(void)setHomeScreenScale:(double)arg1 behaviorMode:(long long)arg2 completion:(/*^block*/id)arg3 ;
-(void)handleDidEndReachabilityAnimation;
-(long long)interfaceOrientationForWallpaperController:(id)arg1 ;
-(void)disableAnimationForNextIconRotation;
-(void)accessoryEndpointInfoPropertyChanged:(id)arg1 properties:(id)arg2 forConnection:(id)arg3 ;
-(id)window;
-(void)endRequiringLiveBackdropViewForReason:(id)arg1 ;
-(void)didDetectDeviceMotion;
-(BOOL)isConnectedToChargeIncapablePowerSource;
-(void)beginRequiringLiveBackdropViewForReason:(id)arg1 ;
-(BOOL)isHeadsetBatteryCharging;
-(void)suppressChimeForConnectedPowerSources;
-(BOOL)chargingChimeEnabled;
-(void)beginRequiringBackdropViewForReason:(id)arg1 ;
-(void)_removeSuppressedAccessory:(id)arg1 ;
-(void)setHomeScreenAlpha:(double)arg1 behaviorMode:(long long)arg2 completion:(/*^block*/id)arg3 ;
-(void)endRequiringBackdropViewForReason:(id)arg1 ;
-(void)setWindowScene:(SBWindowScene *)arg1 ;
-(void)statusBarOverridesDidChange:(id)arg1 ;
-(void)interactionProgressDidUpdate:(id)arg1 ;
-(void)_playAccessoryChimeIfAppropriateForAccessory:(id)arg1 attaching:(BOOL)arg2 withDelay:(double)arg3 ;
-(void)restoreContentWithOptions:(unsigned long long)arg1 ;
-(void)windowedAccessoryPresented;
-(void)removeDetachedAccessory:(id)arg1 ;
-(void)zStackParticipant:(id)arg1 updatePreferences:(id)arg2 ;
-(void)_disableWirelessChargingChimeAndScreenWakeForDuration:(double)arg1 ;
-(void)interactionProgress:(id)arg1 didEnd:(BOOL)arg2 ;
-(void)setLastDetachedAccessory:(CSMagSafeAccessory *)arg1 ;
-(void)handleVolumeButtonWithType:(long long)arg1 down:(BOOL)arg2 ;
-(id)_legibilitySettings;
-(void)storeAttachedAccessory:(id)arg1 ;
-(void)_setConnectedToWindowedAccessory:(BOOL)arg1 ;
-(void)beginRequiringContentForReason:(id)arg1 options:(unsigned long long)arg2 ;
-(id)workflowClientFromWebClip:(id)arg1 appToLaunch:(id)arg2 ;
-(int)batteryCapacityAsPercentage;
-(BOOL)handleHomeButtonDoublePressDown;
-(BOOL)isConnectedToQiPower;
-(BOOL)isHeadsetDocked;
-(void)restoreContentAndUnscatterIconsAnimated:(BOOL)arg1 withCompletion:(/*^block*/id)arg2 ;
-(void)windowedAccessoryDismissed;
-(id)init;
-(void)setHomeScreenBlurProgress:(double)arg1 behaviorMode:(long long)arg2 completion:(/*^block*/id)arg3 ;
-(void)_storeSuppressedAccessory:(id)arg1 ;
-(id)descriptionWithMultilinePrefix:(id)arg1 ;
-(BOOL)_blocksAnimationForAccessoryType:(long long)arg1 ;
-(id)contentView;
-(void)wallpaperDidChangeForVariant:(long long)arg1 ;
-(BOOL)_treatsAccessoryAsSupported:(id)arg1 ;
-(BOOL)isConnectedToWirelessInternalChargingAccessory;
-(void)_willRevealOrHideContentView;
-(void)setPointerInteractionsEnabled:(BOOL)arg1 ;
-(void)tearDownIconListAndBar;
-(void)activateApplication:(id)arg1 fromIcon:(id)arg2 location:(id)arg3 activationSettings:(id)arg4 actions:(id)arg5 ;
-(void)_setupHomeScreenDimmingWindow;
-(void)_accessoryEndpointAttached:(id)arg1 ;
-(void)_enumeratePowerSourcesWithBlock:(/*^block*/id)arg1 ;
-(void)possiblyWakeForPowerStatusChangeWithUnlockSource:(int)arg1 ;
-(BOOL)_shouldShowAnimationForAccessory:(id)arg1 ;
-(void)setHomeScreenDimmingAlpha:(double)arg1 behaviorMode:(long long)arg2 completion:(/*^block*/id)arg3 ;
-(CGRect)visibleScreenCoordinatesForWindowedAccessory;
-(void)homeScreenBackdropView:(id)arg1 opaquenessDidChange:(BOOL)arg2 ;
-(void)playChargingChimeIfAppropriate;
-(void)_activateWorkspaceEntity:(id)arg1 fromIcon:(id)arg2 location:(id)arg3 validator:(/*^block*/id)arg4 ;
-(void)_switchToHomeScreenWallpaperAnimated:(BOOL)arg1 ;
-(BOOL)isFullyCharged;
-(void)dealloc;
-(void)_activateApplicationFromAccessibility:(id)arg1 ;
-(void)noteStatusBarHeightChanged:(id)arg1 ;
-(float)batteryCapacity;
-(id)succinctDescription;
-(void)_preferredContentSizeDidChange:(id)arg1 ;
-(void)endRequiringContentForReason:(id)arg1 ;
-(void)setLockScreenScale:(double)arg1 withDuration:(double)arg2 behaviorMode:(long long)arg3 completion:(/*^block*/id)arg4 ;
-(id)scalingView;
-(void)_disableWirelessChargingChimeAndScreenWakeForDuration:(double)arg1 withMotionAlarm:(BOOL)arg2 ;
-(BOOL)isBatteryCharging;
-(void)_updateRequireWallpaperRasterization;
-(void)_dismissAccessory:(id)arg1 playChime:(BOOL)arg2 ;
-(id)_currentHomeScreenLegibilitySettings;
-(BOOL)isConnectedToWirelessInternalCharger;
-(void)wallpaperLegibilitySettingsDidChange:(id)arg1 forVariant:(long long)arg2 ;
-(void)_setAccessoryAttachmentAnimationBlockingTimerWithDuration:(double)arg1 ;
-(void)_setDebounceWirelessChargingTimerWithDuration:(double)arg1 ;
-(void)restoreContentAndUnscatterIconsAnimated:(BOOL)arg1 ;
-(void)setHomeScreenBackdropBlurMaterialRecipeName:(id)arg1 behaviorMode:(long long)arg2 completion:(/*^block*/id)arg3 ;
-(void)_removeReachabilityEffectViewIfNecessary;
-(BOOL)hasVisibleAlertItemOrSheet:(out BOOL*)arg1 ;
-(BOOL)isConnectedToUnsupportedChargingAccessory;
-(void)setIsConnectedToUnsupportedChargingAccessory:(BOOL)arg1 ;
-(BOOL)isConnectedToWirelessInternalAccessory;
-(BOOL)_isConnectedToWirelessCharging;
-(void)_accessoryEndpointDetached:(id)arg1 ;
-(BOOL)handleHomeButtonSinglePressUpForWindowScene:(id)arg1 ;
-(BOOL)_isAppropriateToReactToAccessoryEvent;
-(void)_cancelDebounceWirelessChargingTimer;
-(id)succinctDescriptionBuilder;
-(BOOL)handleHomeButtonSinglePressUpForWindowScene:(id)arg1 withSourceType:(unsigned long long)arg2 ;
-(id)descriptionBuilderWithMultilinePrefix:(id)arg1 ;
-(void)_setupHomeScreenContentBackdropView;
-(unsigned char)headsetBatteryCapacity;
-(void)_hideKeyboard;
-(void)_closeOpenFolderIfNecessary;
-(void)beginRequiringContentForReason:(id)arg1 ;
-(BOOL)_shouldInitiateAnimationForAccessory:(id)arg1 ;
-(NSString *)description;
-(BOOL)_powerSourceWantsToPlayChime;
-(void)_updateLegibility;
-(BOOL)disableAppSwitchForcePressDueToHomeButtonForce;
-(BOOL)isConnectedToExternalChargingSource;
-(void)_accessibilityWillBeginAppSwitcherRevealAnimation;
-(void)restoreContent;
-(void)_resetWirelessChargingState;
-(long long)transitionSourceForIcon:(id)arg1 iconLocation:(id)arg2 ;
-(void)setChargingChimeEnabled:(BOOL)arg1 ;
-(void)_backgroundContrastDidChange:(id)arg1 ;
-(void)_reduceMotionStatusDidChange:(id)arg1 ;
-(BOOL)isOnAC;
-(void)_debounceWirelessChargingTimerFired;
-(void)_animationBlockingTimerFired;
-(BOOL)isIconListViewTornDown;
-(void)handleWillBeginReachabilityAnimation;
-(BOOL)dissmissAlertItemsAndSheetsIfPossible;
-(void)restoreContentAndUnscatterIconsAnimated:(BOOL)arg1 afterDelay:(double)arg2 withCompletion:(/*^block*/id)arg3 ;
-(void)settings:(id)arg1 changedValueForKey:(id)arg2 ;
-(void)setLastAttachedAccessory:(CSMagSafeAccessory *)arg1 ;
-(void)updateBatteryState:(id)arg1 ;
-(BOOL)supportsDetailedBatteryCapacity;
-(void)_deviceUILocked;
-(BOOL)isBackdropVisible;
-(BOOL)isAccessoryAnimationAllowed;
-(BOOL)isConnectedToWindowedAccessory;
-(void)updateStatusBarLegibilityForWindowScene:(id)arg1 ;
-(void)setIsAccessoryAnimationAllowed:(BOOL)arg1 ;
@end


#import <AudioToolbox/AudioToolbox.h>
static NSArray<NSString *> *chargingSounds = nil;
static NSMutableDictionary<NSString *, NSNumber *> *soundIDs = nil;

static void loadChargingSounds() {
    NSString *dir = ROOT_PATH_NS(@"/Library/PowerCharge/");
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

static void playChargingSound() {
    if (soundIDs.count == 0) loadChargingSounds();
    if (soundIDs.count == 0) return;

    NSArray *keys = soundIDs.allKeys;
    NSString *pick = keys[arc4random_uniform((uint32_t)keys.count)];
    SystemSoundID sid = [soundIDs[pick] unsignedIntValue];

    [Debug Log:[NSString stringWithFormat:@"Playing: %@", pick]];
    AudioServicesPlaySystemSound(sid);
}


%hook SBUIController

	- (void)playChargingChimeIfAppropriate {
		// suppress the default chime entirely
		[Debug Log:@"playChargingChimeIfAppropriate suppressed"];
	}

	- (void)updateBatteryState:(id)arg1 {
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



// ====================== Constructor ======================

%ctor {
	[Debug Log:@"================= init ======================="];


}

