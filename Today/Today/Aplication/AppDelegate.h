//
//  AppDelegate.h
//  Today
//
//  Created by ENB Mac Mini M1 on 02/05/25.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, readonly) UIWindow *window;

+ (instancetype)shared;

@end

