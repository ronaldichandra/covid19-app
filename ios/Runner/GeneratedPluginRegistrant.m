//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_web_browser/FlutterWebBrowserPlugin.h>)
#import <flutter_web_browser/FlutterWebBrowserPlugin.h>
#else
@import flutter_web_browser;
#endif

#if __has_include(<url_launcher_ios/FLTURLLauncherPlugin.h>)
#import <url_launcher_ios/FLTURLLauncherPlugin.h>
#else
@import url_launcher_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterWebBrowserPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterWebBrowserPlugin"]];
  [FLTURLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTURLLauncherPlugin"]];
}

@end
