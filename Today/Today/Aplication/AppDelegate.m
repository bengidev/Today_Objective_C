//
//  AppDelegate.m
//  Today
//
//  Created by ENB Mac Mini M1 on 02/05/25.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()
@property (nonatomic, readwrite) UIWindow *window;
@end

@implementation AppDelegate

+ (instancetype)shared {
  static AppDelegate *sharedInstance = nil;
  static dispatch_once_t onceToken;

  dispatch_once(&onceToken, ^{
    sharedInstance = [[AppDelegate alloc] init];
    // Do any other initialisation stuff here
      
      sharedInstance.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  });
    
  return sharedInstance;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"Tester from %@", [self class]);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
    NSLog(@"Storyboard: %@", storyboard);
    
    HomeViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    NSLog(@"Controller: %@", controller);
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    NSLog(@"Navigation Controller: %@", navigationController);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[self window] setRootViewController:navigationController];
    [[self window] makeKeyAndVisible];
    
    return YES;
}

@end
