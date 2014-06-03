//
//  CarouselDemoAppDelegate.h
//  CarouselDemo
//
//  Created by Eugene Scherba on 6/1/14.
//  Copyright 2014 Livefyre, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CarouselDemoViewController;

@interface CarouselDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CarouselDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CarouselDemoViewController *viewController;

@end
