UINoticeSheet
=============

An UINoticeSheet for the iOS platform. Shows a noticesheet at top of screen.

#### How to

1. Copy the NoticeSheet folder to your project
2. #import "NoticeSheet.h"
3. Start displaying the sheets

````objective-c
- (IBAction)displaySample1:(id)sender
{
    [NoticeSheet showNotice:@"This is a notice sheet"];
}

- (IBAction)displaySample2:(id)sender
{
    [NoticeSheet showNotice:@"This is a notice sheet that you can press" selector:@selector(doSomething) target:self];
}

- (void) doSomething
{
    NSLog(@"Notice was pressed!");
}
````

#### Other ways of invoking a sheet


````objective-c
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
```` 
