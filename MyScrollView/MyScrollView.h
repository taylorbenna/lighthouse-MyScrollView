//
//  MyScrollView.h
//  MyScrollView
//
//  Created by Taylor Benna on 2016-05-16.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIView

@property (nonatomic) CGSize contentSize;
@property (nonatomic) UIPanGestureRecognizer *panGest;

@end
