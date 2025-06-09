//
//  AppDelegate.h
//  Today
//
//  Created by ENB Mac Mini M1 on 04/06/25.
//

@import UIKit;
@import CoreData;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, nonatomic) NSPersistentContainer *persistentContainer;
@property (readonly, nonatomic) UIWindow *appWindow;
@property (readonly, nonatomic) UINavigationController *appNavigationController;
@property (readonly, nonatomic) NSString *testString;

+ (instancetype)shared;
- (void)saveContext;

@end
