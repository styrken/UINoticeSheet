//
//  NoticeView.h
//  UINoticeSheet
//
//  Created by Rasmus Styrk on 9/2/12.
//  Copyright (c) 2012 Rasmus Styrk. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * This class defines a view of how the notice should look like.
 * Simply change the views in setupSubviews if you want it to look differentely
 *
 */
@interface NoticeView : UIView

/**
 * A public title label for the view
 *
 */
@property (nonatomic, retain) UILabel *title;

/**
 * Helpers if you want a method to get called when the view is touched
 *
 */
@property (nonatomic, assign) SEL selector;
@property (nonatomic, assign) id target;
@property BOOL isTouched;

@end
