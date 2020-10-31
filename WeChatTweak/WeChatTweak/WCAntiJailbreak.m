//
//  WCAntiJailbreak.m
//  WeChatTweak
//
//  Created by jiaxw on 2020/10/31.
//

#import <Foundation/Foundation.h>
#include <dlfcn.h>
#import <mach-o/dyld.h>
#import "fishhook.h"
#import "CaptainHook.h"

static NSArray *g_jailbreakFiles = NULL;

static char * libUIKitPath = "/System/Library/Frameworks/UIKit.framework/UIKit";

int replaced_dladdr(const void *addr, Dl_info *info);
const char* replaced_dyld_get_image_name(uint32_t idx);

#pragma mark - dyld image name

#pragma mark dladdr

typedef int (*dladdr_ptr_t)(const void *, Dl_info *);

static dladdr_ptr_t orig_dladdr = NULL;

int replaced_dladdr(const void *addr, Dl_info *info){
    int ret = orig_dladdr(addr, info);
    
    if (ret != 0 && info != NULL && info->dli_fname != NULL) {
        NSString *fname = [NSString stringWithUTF8String:info->dli_fname];
        if ([fname hasPrefix:@"/Library/MobileSubstrate/"]) {
            NSLog(@">>> replaced_dladdr fname: %@", fname);
            char * path = malloc(strlen(libUIKitPath) + 1); // memory leak
            strcpy(path, libUIKitPath);
            info->dli_fname = path;
        }
    }
    return ret;
}

#pragma mark _dyld_get_image_name

typedef const char* (*dyld_get_image_name_ptr_t)(uint32_t);

static dyld_get_image_name_ptr_t orig_dyld_get_image_name = NULL;

const char* replaced_dyld_get_image_name(uint32_t idx){
    const char *image_name = orig_dyld_get_image_name(idx);
    
    NSString *imageName = [NSString stringWithUTF8String: image_name];
    if ([imageName hasPrefix:@"/Library/MobileSubstrate/"]) {
        NSLog(@">>> _dyld_get_image_name fname: %@", imageName);
        char * path = malloc(strlen(libUIKitPath) + 1); // memory leak
        strcpy(path, libUIKitPath);
        image_name = path;
    }
    return image_name;
}

#pragma mark - Jailbreak

CHDeclareClass(JailBreakHelper)

CHClassMethod0(BOOL, JailBreakHelper, JailBroken){
    BOOL ret = CHSuper0(JailBreakHelper, JailBroken);
    NSLog(@">>> +[JailBreakHelper JailBroken] original return value: %@", @(ret));
    return NO;
}

CHMethod0(BOOL, JailBreakHelper, IsJailBreak){
    BOOL ret = CHSuper0(JailBreakHelper, IsJailBreak);
    NSLog(@">>> -[JailBreakHelper IsJailBreak] original return value: %@", @(ret));
    return NO;
}

CHDeclareClass(MidasIAPCommonUtility);

CHMethod0(BOOL, MidasIAPCommonUtility, isDeviceJailBroken){
    BOOL ret = CHSuper0(MidasIAPCommonUtility, isDeviceJailBroken);
    NSLog(@">>> -[MidasIAPCommonUtility isDeviceJailBroken] original return value: %@", @(ret));
    return NO;
}

CHDeclareClass(HLSchInfo);

CHClassMethod0(BOOL, HLSchInfo, isJailbroken){
    BOOL ret = CHSuper0(HLSchInfo,isJailbroken);
    NSLog(@">>> +[HLSchInfo isJailbroken] original return value: %@", @(ret));
    return NO;
}

CHDeclareClass(NSFileManager);

CHMethod1(BOOL, NSFileManager, fileExistsAtPath, NSString *, arg1){
    BOOL ret = CHSuper1(NSFileManager, fileExistsAtPath, arg1);

    if ([arg1 hasPrefix:@"/Library/MobileSubstrate/"]){
        NSLog(@">>> file: %@, exist: %@", arg1, @(ret));
        return NO;
    }

    if ([g_jailbreakFiles containsObject:arg1]){
        NSLog(@">>> file: %@, exist: %@", arg1, @(ret));
        return NO;
    }

    return ret;
}

CHConstructor{
    CHLoadLateClass(JailBreakHelper);
    CHHook0(JailBreakHelper,JailBroken);
    CHHook0(JailBreakHelper,IsJailBreak);
    
    CHLoadLateClass(MidasIAPCommonUtility);
    CHHook0(MidasIAPCommonUtility, isDeviceJailBroken);

    CHLoadLateClass(HLSchInfo);
    CHHook0(HLSchInfo, isJailbroken);
    
    CHLoadLateClass(NSFileManager);
    CHHook1(NSFileManager, fileExistsAtPath);
}

#pragma mark - WCDummyClass

@interface WCDummyClass : NSObject

@end

@implementation WCDummyClass

+ (void)load{
    g_jailbreakFiles = @[
      @"/Applications/Cydia.app",
      @"/Applications/FakeCarrier.app",
      @"/Applications/Icy.app",
      @"/Applications/IntelliScreen.app",
      @"/Applications/MxTube.app",
      @"/Applications/RockApp.app",
      @"/Applications/SBSetttings.app",
      @"/Applications/WinterBoard.app",
      @"/Applications/blackra1n.app",
      @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
      @"/Library/MobileSubstrate/MobileSubstrate.dylib",
      @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
      @"/System/Library/LaunchDaemons/com.saurik.Cy@dia.Startup.plist",
      @"/bin/bash",
      @"/bin/sh",
      @"/etc/apt",
      @"/etc/ssh/sshd_config",
      @"/private/var/stash",
      @"/private/var/tmp/cydia.log",
      @"/usr/bin/cycript",
      @"/usr/bin/ssh",
      @"/usr/bin/sshd",
      @"/usr/libexec/sftp-server",
      @"/usr/libexec/sftp-server",
      @"/usr/libexec/ssh-keysign",
      @"/usr/sbin/sshd",
      @"/var/cache/apt",
      @"/var/lib/cydia",
      @"/var/log/syslog",
      @"/var/tmp/cydia.log",
      @"/usr/sbin/frida-server",
    ];
    
    rebind_symbols((struct rebinding[1]){{"dladdr", replaced_dladdr, (void*)&orig_dladdr}},1);
    
    rebind_symbols((struct rebinding[1]){{"_dyld_get_image_name", replaced_dyld_get_image_name, (void*)&orig_dyld_get_image_name}},1);
}

@end
