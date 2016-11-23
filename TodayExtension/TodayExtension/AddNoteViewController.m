//
//  AddNoteViewController.m
//  TodayExtension
//
//  Created by 周永 on 16/11/20.
//  Copyright © 2016年 shuige. All rights reserved.
//

#import "AddNoteViewController.h"

@interface AddNoteViewController ()

@property (strong, nonatomic) IBOutlet UITextField *noteField;

@end

@implementation AddNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNewNote:(id)sender {
    
    if (_noteField.text.length > 0) {
        
        NSArray *myNote = [[[NSUserDefaults alloc] initWithSuiteName:@"group.todayextension.widget"] valueForKey:@"MyNote"];
        NSMutableArray *note = [NSMutableArray arrayWithArray:myNote];
        if (!note) {
            note = [NSMutableArray arrayWithCapacity:0];
        }
        [note insertObject:_noteField.text atIndex:0];
        [[[NSUserDefaults alloc] initWithSuiteName:@"group.todayextension.widget"] setValue:note forKey:@"MyNote"];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
