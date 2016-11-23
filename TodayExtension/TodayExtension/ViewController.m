//
//  ViewController.m
//  TodayExtension
//
//  Created by 周永 on 16/11/20.
//  Copyright © 2016年 shuige. All rights reserved.
//

#import "ViewController.h"
#import "NoteListDelegate.h"

@interface ViewController ()

{
    NoteListDelegate *tableDelegate;
}

@property (strong, nonatomic) IBOutlet UITableView *noteTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _noteTable.estimatedRowHeight = 44.0;
    tableDelegate = [[NoteListDelegate alloc] init];
    tableDelegate.vc = self;
    _noteTable.delegate = tableDelegate;
    _noteTable.dataSource = tableDelegate;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_noteTable reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
