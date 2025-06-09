//
//  AppDelegate.m
//  Today
//
//  Created by ENB Mac Mini M1 on 04/06/25.
//

@import UIKit;

#import "AppDelegate.h"
#import "SplashViewController.h"

@interface AppDelegate ()

@property (readwrite, nonatomic) NSPersistentContainer *persistentContainer;
@property (readwrite, nonatomic) UIWindow *appWindow;
@property (readwrite, nonatomic) UINavigationController *appNavigationController;
@property (readwrite, nonatomic) NSString *testString;

@end

@implementation AppDelegate

+ (instancetype)shared {
    static AppDelegate *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppDelegate alloc] init];
        // Do any other initialisation stuff here
    });

    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];

    if (self) {
        // Do any other initialisation stuff here
    }

    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.appWindow.rootViewController = self.appNavigationController;
    [self.appWindow makeKeyAndVisible];

    return YES;
}

- (UIWindow *)appWindow {
    if (!_appWindow) {
        _appWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }

    return _appWindow;
}

- (UINavigationController *)appNavigationController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SplashStoryboard" bundle:nil];
    SplashViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"SplashViewController"];

    if (!_appNavigationController) {
        _appNavigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    }

    return _appNavigationController;
}

#pragma mark - Core Data stack

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (!_persistentContainer) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Today"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                    /*
                       Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                       Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }

    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;

    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
