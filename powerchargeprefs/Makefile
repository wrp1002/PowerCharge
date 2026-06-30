#THEOS_PACKAGE_SCHEME=rootless

ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
	ARCHS = arm64 arm64e
	TARGET = iphone:clang:15.5:15.0
else
	ARCHS = armv7 arm64 arm64e
	TARGET = iphone:clang:14.2:8.0
endif

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = PowerChargePrefs

PowerChargePrefs_FILES = PCPRootListController.m PCPSoundsListController.m
PowerChargePrefs_FRAMEWORKS = UIKit
PowerChargePrefs_PRIVATE_FRAMEWORKS = Preferences AudioToolbox
PowerChargePrefs_INSTALL_PATH = /Library/PreferenceBundles
PowerChargePrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
