//
//  ViewController.m
//  ASNSCalendar
//
//  Created by Mac on 2020/4/27.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/// 1.获取当前时间
- (IBAction)getCurrentDate {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMinute | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitSecond fromDate:[NSDate date]];
    
    NSString *currentDate = [NSString stringWithFormat:@"%ld年%ld月%ld日 %ld时%ld分%ld秒", components.year, (long)components.month, (long)components.day, (long)components.hour, (long)components.minute, components.second];
    
    NSLog(@"当前时间：%@", currentDate);
    self.titleLabel.text = currentDate;
    
}

/// 2.查看今天是在今年的第几周
- (IBAction)getCurrentWeek {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger week = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:[NSDate date]];
    
    NSString *currentWeek = [NSString stringWithFormat:@"今天是今年的第%ld周",(long)week];
    
    NSLog(@"%@", currentWeek);
    self.titleLabel.text = currentWeek;
}


/// 3.现在往后5天8小时
- (IBAction)getAfterDate {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = 0;
    components.day = 5;
    components.hour = 8;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    NSDate *nextDate = [calendar dateByAddingComponents:components toDate:currentDate options:NSCalendarMatchStrictly];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年MM月dd日 hh时mm分ss秒";
    NSString *result = [formatter stringFromDate:nextDate];
    
    NSLog(@"5天8小时后：%@", result);
    self.titleLabel.text = result;
}



@end
