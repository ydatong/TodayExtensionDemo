//
//  NoteListDelegate.h
//  TodayExtension
//
//  Created by 周永 on 16/11/20.
//  Copyright © 2016年 shuige. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NoteListDelegate : NSObject <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UIViewController *vc;

@end
