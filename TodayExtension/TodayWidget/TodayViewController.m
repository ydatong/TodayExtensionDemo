//
//  TodayViewController.m
//  TodayWidget
//
//  Created by 周永 on 16/11/20.
//  Copyright © 2016年 shuige. All rights reserved.
//

#import "TodayViewController.h"
#import "NoteListDelegate.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
{
    NoteListDelegate *tableDelegate;
}
@property (strong, nonatomic) IBOutlet UITableView *noteTable;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _noteTable.estimatedRowHeight = 44.0;
    tableDelegate = [[NoteListDelegate alloc] init];
    tableDelegate.vc = self;
    _noteTable.delegate = tableDelegate;
    _noteTable.dataSource = tableDelegate;
    
     self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
        self.preferredContentSize = CGSizeMake(0, 300);
    }else{
        self.preferredContentSize = maxSize;
    }
}

- (IBAction)addNote:(id)sender {
    
    [self.extensionContext openURL:[NSURL URLWithString:@"todaywidget://add"] completionHandler:nil];
}

@end
