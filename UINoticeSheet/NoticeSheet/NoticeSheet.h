//
//  NoticeSheet.h
//  UINoticeSheet
//
//  Created by Rasmus Styrk on 9/2/12.
//  Copyright (c) 2012 Rasmus Styrk. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * This class provides methods to display a notice view. If a view is already visible, the view is added to a queue and then displayed one at a time
 *
 *
 */
@interface NoticeSheet : NSObject

#pragma mark - Properties
/**
 * The sheet queue
 *
 */
@property (nonatomic, retain) NSMutableArray *sheetQueue;

/**
 * Defines the duration of the animation (how fast it should display)
 *
 */
@property float duration;

/**
 * Defines how long time the view should be visible before rolling back up
 *
 */
@property float delay;

/**
 * Sets the alpha of the display view
 *
 */
@property float alpha;

#pragma mark - Showing of views

/**
 * Shows a notice sheet with text as message. Uses the topmost view to display from.
 *
 * @param NSString The text to display
 */
+ (void) showNotice:(NSString*) text;

/**
 * Shows a notice sheet with a text as message in a specific view
 *
 * @param NSString The tex to tisplay
 * @param UIView the view the sheet should be displayed in
 */
+ (void) showNotice:(NSString*) text inView:(UIView*)view;

/**
 * Shows a notice sheet with text as message and when a user touches the view, selector will be fired on target. Uses the topmost view to display from.
 *
 * @param NSString The text to display
 * @param SEL The selector to call (the method on target)
 * @param id The target to call selector on
 */
+ (void) showNotice:(NSString *)text selector:(SEL)selector target:(id)target;

/**
 * Shows a notice sheet with text as message and when a user touches the view, selector will be fired on target
 * The notice will be shown in the view that is provided.
 *
 * @param NSString The text to display
 * @param SEL The selector to call (the method on target)
 * @param id The target to call selector on
 * @param UIView the view the sheet should be displayed in
 */
+ (void) showNotice:(NSString *)text selector:(SEL)selector target:(id)target inView:(UIView *)view;

@end
