//
//  SplashViewController.m
//  Today
//
//  Created by ENB Mac Mini M1 on 04/06/25.
//

#import "AppDelegate.h"
#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)sayHello {
    NSLog(@"Hello, from %@", self.description);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSArray *ctrl = [[AppDelegate shared].appNavigationController viewControllers];
            NSLog(@"In stack controllers: %@", ctrl);
            
            NSPersistentContainer *container = [[AppDelegate shared] persistentContainer];
            NSLog(@"Container: %@", container);
        });
    });
}

/*
 #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
