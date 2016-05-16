//
//  ViewController.m
//  MyScrollView
//
//  Created by Taylor Benna on 2016-05-16.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@property (nonatomic) MyScrollView *mainView;
@property (nonatomic) UIView *redView;
@property (nonatomic) UIView *greenView;
@property (nonatomic) UIView *blueView;
@property (nonatomic) UIView *yellowView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView = [[MyScrollView alloc] initWithFrame:self.view.frame];
    self.mainView.backgroundColor = [UIColor grayColor];
    
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100.0, 100.0)];
    self.redView.backgroundColor = [UIColor redColor];
    
    self.greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150.0, 200.0)];
    self.greenView.backgroundColor = [UIColor greenColor];

    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 150.0, 200.0)];
    self.blueView.backgroundColor = [UIColor blueColor];

    self.yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180.0, 150.0)];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    
    [self.mainView addSubview:self.redView];
    [self.mainView addSubview:self.greenView];
    [self.mainView addSubview:self.blueView];
    [self.mainView addSubview:self.yellowView];
    [self.view addSubview:self.mainView];
    
    self.mainView.contentSize = CGSizeMake(self.view.frame.size.width + 100, self.view.frame.size.height + 200);
    
    self.mainView.frame = CGRectMake(0, 0, self.mainView.contentSize.width, self.mainView.contentSize.height);
    
    self.mainView.panGest = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.mainView addGestureRecognizer:self.mainView.panGest];
}

-(void) handlePan:(UIPanGestureRecognizer *)gest {
    CGPoint translation = [gest translationInView:self.mainView];
    float newX = self.mainView.center.x + translation.x;
    float newY = self.mainView.center.y + translation.y;

    float xVal = self.mainView.frame.origin.x + translation.x + self.mainView.frame.size.width;
    
    if (xVal < self.view.frame.size.width || self.mainView.frame.origin.x + translation.x > 0) {
        newX = self.mainView.center.x;
    }
    
    float yVal = self.mainView.frame.origin.y + translation.y + self.mainView.frame.size.height;
    
    if (yVal < self.view.frame.size.height || self.mainView.frame.origin.y + translation.y > 0) {
        newY = self.mainView.center.y;
    }
    
    self.mainView.center = CGPointMake(newX, newY);
    
    [gest setTranslation:CGPointMake(0, 0) inView:self.mainView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //self.mainView.frame = CGRectMake(self.view.frame.origin.x,(self.view.frame.origin.y - 100),self.view.frame.size.width,self.view.frame.size.height);
}

@end
