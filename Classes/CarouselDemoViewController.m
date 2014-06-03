//
//  CarouselDemoViewController.m
//  CarouselDemo
//
//  Created by Eugene Scherba on 6/1/14.
//  Copyright 2014 Livefyre, Inc. All rights reserved.
//

#import "CarouselDemoViewController.h"

@interface CarouselDemoViewController ()

@property (nonatomic, strong) NSArray *imageViews;

@end

@implementation CarouselDemoViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (UIImageView*)imageViewWithName:(NSString*)name
{
    UIImageView *im1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
    im1.frame = CGRectMake(340, 500, 59.f, 59.f);
    [self.view addSubview:im1];
    return im1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageViews = @[[self imageViewWithName:@"pete"],
                        [self imageViewWithName:@"colleen"],
                        [self imageViewWithName:@"bruce"],
                        
                        [self imageViewWithName:@"bruce"],
                        [self imageViewWithName:@"colleen"],
                        [self imageViewWithName:@"pete"]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

-(void)moveView:(UIView*)view toPosition:(CGFloat)value yOffset:(CGFloat)yOffset
{
    CGFloat xOff = value - 0.5;
    
    CATransform3D trans = CATransform3DIdentity;
    trans.m34 = 1.0f / -1000.0f;
    
    trans = CATransform3DRotate(trans, degreesToRadians(xOff * -25.0f), 0.0f, 1.0f, 0.0f);
    trans = CATransform3DTranslate(trans, 0.0f, yOffset, 900.0f * fabs(xOff));
    [[view layer] setTransform:trans];
    
    CGPoint center = [view center];
    [view setCenter:CGPointMake(768.f * value, center.y)];
}

- (IBAction)sliderDidChange:(id)sender
{
    CGFloat value = [(UISlider*)sender value];
    [self moveView:[self.imageViews objectAtIndex:0] toPosition:value - 0.05 yOffset:-125.f];
    [self moveView:[self.imageViews objectAtIndex:1] toPosition:value - 0.05 yOffset:0.f];
    [self moveView:[self.imageViews objectAtIndex:2] toPosition:value - 0.05 yOffset:125.f];
    
    [self moveView:[self.imageViews objectAtIndex:3] toPosition:value + 0.05 yOffset:-125.f];
    [self moveView:[self.imageViews objectAtIndex:4] toPosition:value + 0.05 yOffset:0.f];
    [self moveView:[self.imageViews objectAtIndex:5] toPosition:value + 0.05 yOffset:125.f];
}

@end
