//
//  ViewController.m
//  UINoticeSheet
//
//  Created by Rasmus Styrk on 31/08/12.
//  Copyright (c) 2012 Rasmus Styrk. All rights reserved.
//

#import "ViewController.h"
#import "NoticeSheet.h"

@interface ViewController ()

@end

@implementation ViewController

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

@end
