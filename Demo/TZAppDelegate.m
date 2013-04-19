#import "TZAppDelegate.h"
#import "TZViewController.h"

@implementation TZAppDelegate

- (BOOL) application: (UIApplication*) application didFinishLaunchingWithOptions: (NSDictionary*) launchOptions
{
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [_window setRootViewController:[[TZViewController alloc] init]];
    [_window makeKeyAndVisible];
    return YES;
}

@end
