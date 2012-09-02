//
//  NoticeSheet.m
//  UINoticeSheet
//
//  Created by Rasmus Styrk on 9/2/12.
//  Copyright (c) 2012 Rasmus Styrk. All rights reserved.
//

#import "NoticeSheet.h"
#import "NoticeView.h"
#import <QuartzCore/QuartzCore.h>

@interface NoticeSheet ()
@property BOOL sheetVisible;
@end

@implementation NoticeSheet
@synthesize duration = _duration;
@synthesize delay = _delay;
@synthesize alpha = _alpha;

@synthesize sheetQueue = _sheetQueue;
@synthesize sheetVisible = _sheetVisible;

#pragma mark - Init and default setup

+ (NoticeSheet *) defaultNotice
{
    static NoticeSheet* instance;
    
    if(instance == nil)
    {
        instance = [[self alloc] init];
    }
    
    return instance;
}

- (id) init
{
    self = [super init];
    
    if(self)
    {
        self.duration = .5f;
        self.delay = 2.0f;
        self.alpha = 1.0f;
        
        self.sheetQueue = [[NSMutableArray alloc] init];
        self.sheetVisible = NO;
    }
    
    return self;
}

- (void) dealloc
{
    [_sheetQueue release];
    
    [super dealloc];
}

#pragma mark - Creation of sheets

+ (void) showNotice:(NSString *)text selector:(SEL)selector target:(id)target inView:(UIView *)view
{
    NoticeSheet *defaultNotice = [NoticeSheet defaultNotice];
    
    CGRect frame = view.bounds;
    frame.size.height = 60;
    frame.origin.y = - 70;
    
    NoticeView *sheet = [[NoticeView alloc] initWithFrame: frame];
    sheet.title.text = text;
    sheet.selector = selector;
    sheet.target = target;
    
    [view addSubview:sheet];
    [sheet release];
    
    [defaultNotice displayNoticeView:sheet];
}

+ (void) showNotice:(NSString*) text inView:(UIView*)view
{
    [self showNotice:text selector:nil target:nil inView:view];
}

+ (void) showNotice:(NSString *)text selector:(SEL)selector target:(id)target
{
    UIWindow *topWindow = [[[UIApplication sharedApplication].windows sortedArrayUsingComparator:^NSComparisonResult(UIWindow *win1, UIWindow *win2) {
        return win1.windowLevel - win2.windowLevel;
    }] lastObject];
    
    UIView *topView = [[topWindow subviews] lastObject];
    
    [self showNotice:text selector:selector target:target inView:topView];
}

+ (void) showNotice:(NSString*) text
{
    UIWindow *topWindow = [[[UIApplication sharedApplication].windows sortedArrayUsingComparator:^NSComparisonResult(UIWindow *win1, UIWindow *win2) {
        return win1.windowLevel - win2.windowLevel;
    }] lastObject];
    
    UIView *topView = [[topWindow subviews] lastObject];
    
    [self showNotice:text inView:topView];
}

#pragma mark - Animation helpers

- (void) displayNoticeView:(UIView*) view
{
    [self.sheetQueue addObject:view];
    
    if(self.sheetVisible)
        return;
    
    self.sheetVisible = YES;
    
    [UIView animateWithDuration:self.duration animations:^ {
        CGRect newFrame = view.frame;
        newFrame.origin.y = 0;
        view.frame = newFrame;
        view.alpha = self.alpha;
    } completion:^ (BOOL finished)
    {
        if (finished)
        {
            [self dismissNoticeView:view];
        }
    }];
}

- (void) dismissNoticeView:(UIView*) view
{
    [UIView animateWithDuration:self.duration delay:self.delay options:UIViewAnimationOptionCurveEaseOut animations:^ {
        CGRect newFrame = view.frame;
        newFrame.origin.y = - view.frame.size.height;
        view.frame = newFrame;
    } completion:^ (BOOL finished) {
        if (finished)
        {
            [view removeFromSuperview];
            
            self.sheetVisible = NO;
            
            [self.sheetQueue removeObject:view];
            
            if(self.sheetQueue.count > 0)
            {
                UIView *nextSheet = (UIView*) [self.sheetQueue objectAtIndex:0];
                [self displayNoticeView:nextSheet];
            }
        }
    }];
}


@end
