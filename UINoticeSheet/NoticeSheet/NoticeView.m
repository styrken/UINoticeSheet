//
//  NoticeView.m
//  UINoticeSheet
//
//  Created by Rasmus Styrk on 9/2/12.
//  Copyright (c) 2012 Rasmus Styrk. All rights reserved.
//

#import "NoticeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation NoticeView
@synthesize title = _title;
@synthesize isTouched = _isTouched;

@synthesize selector = _selector;
@synthesize target = _target;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupSubviews];
        
        self.selector = nil;
        self.target = nil;
        self.isTouched = NO;
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if(!self.isTouched)
    {
        self.isTouched = YES;
    
        if(self.target != nil)
        {
            [self.target performSelector:self.selector];
        }
    }
    
    return [super hitTest:point withEvent:event];
}

- (void) setupSubviews
{
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        
    backgroundView.layer.shadowOffset = CGSizeMake(-1, -1);
    backgroundView.layer.shadowColor = [[UIColor blackColor] CGColor];
    backgroundView.layer.shadowOpacity = 0.5f;
    backgroundView.layer.masksToBounds = NO;
    
    CAGradientLayer *gradient = [CAGradientLayer layer];

    gradient.frame = backgroundView.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:222.0/255.0 green:207.0/255.0 blue:40.0/255.0 alpha:1.0] CGColor], (id)[[UIColor colorWithRed:237.0/255.0 green:228.0/255.0 blue:128.0/255.0 alpha:1.0] CGColor], nil];
    
    [backgroundView.layer addSublayer:gradient];

    CGRect labelFrame = self.bounds;
    labelFrame.origin.x = 10;
    
    UILabel *messageLabel = [[[UILabel alloc] initWithFrame:labelFrame] autorelease];
    
    messageLabel.numberOfLines = 0;
    messageLabel.lineBreakMode = UILineBreakModeWordWrap;
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.textColor = [UIColor whiteColor];
    
    messageLabel.layer.shadowOffset = CGSizeMake(-1, 1);
    messageLabel.layer.shadowColor = [[UIColor blackColor] CGColor];
    messageLabel.layer.shadowOpacity = 1;
    messageLabel.layer.shadowRadius = 0;
    messageLabel.layer.masksToBounds = NO;
      
    [backgroundView addSubview:messageLabel];
    self.title = messageLabel;
    [messageLabel release];
    
    [self addSubview:backgroundView];
    [backgroundView release];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
