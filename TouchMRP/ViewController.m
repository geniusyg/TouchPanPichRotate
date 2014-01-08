//
//  ViewController.m
//  TouchMRP
//
//  Created by yg on 14. 1. 9..
//  Copyright (c) 2014년 yg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    
    [self.image addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    
    [self.image addGestureRecognizer:pinch];
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
    
    [self.image addGestureRecognizer:rotate];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)gesture {
    self.image.transform = CGAffineTransformRotate(self.image.transform, gesture.rotation);
}
- (void)handlePinch:(UIPinchGestureRecognizer *)gesture {
    CGFloat scale = gesture.scale;
    self.image.transform = CGAffineTransformScale(self.image.transform, scale, scale);
    
    [gesture setScale:1.0];
}
- (IBAction)handlePan:(UIPanGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:self.view];
    self.image.center = point;
}


@end
