#import <UIKit/UIKit.h>
#import <substrate.h>
#include <mach-o/dyld.h>


#pragma mark sub_10004c724

int64_t (*orig_func)(int64_t,int64_t,int64_t,int64_t,int64_t,BOOL);

int64_t replaced_func(int64_t arg1,int64_t arg2,int64_t arg3, int64_t arg4, int64_t arg5, BOOL arg6);

int64_t replaced_func(int64_t arg1,int64_t arg2,int64_t arg3, int64_t arg4, int64_t arg5, BOOL arg6){
    NSLog(@">>> replaced function execute, code: %lld, arg2: %lld , arg3: %lld,", arg1, arg2, arg3);
    if (arg1 == 13307) {
        NSLog(@">>> 13307 message");
    }
    return orig_func(arg1, arg2, arg3, arg4, arg5, arg6);
}

#pragma mark - OC


BOOL (*original_didFinishLaunching)(id self, SEL _cmd, id application, id options);
BOOL replaced_didFinishLaunching(id self, SEL _cmd, id application, id options);


BOOL replaced_didFinishLaunching(id self, SEL _cmd, id application, id options){
    NSLog(@">>> app didFinishLaunchingWithOptions");
    return original_didFinishLaunching(self, _cmd, application, options);
}

#pragma mark - constructor

static __attribute__((constructor)) void cy_init(){
    MSHookMessageEx(NSClassFromString(@"MicroMessengerAppDelegate"), @selector(application:didFinishLaunchingWithOptions:), (IMP)&replaced_didFinishLaunching, (IMP*)&original_didFinishLaunching);
    
    __uint64_t slide = _dyld_get_image_vmaddr_slide(0);
    __uint64_t offset = 0x10004c724;
    __uint64_t symbolAddress = offset + slide;
    NSLog(@">>> image slide address: %#llx, sub symbol address: %#llx\n", slide,  symbolAddress);
        
    Dl_info info;
    dladdr((void *)symbolAddress, &info);
    NSLog(@">>> base address: %#llx, image file: %s", (long long)info.dli_fbase, info.dli_fname);
    
   MSHookFunction((void *)symbolAddress, (void *)&replaced_func, (void **)&orig_func);
}