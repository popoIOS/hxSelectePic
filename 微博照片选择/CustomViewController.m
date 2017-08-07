//
//  CustomViewController.m
//  微博照片选择
//
//  Created by ydz on 17/3/20.
//  Copyright © 2017年 洪欣. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"tisi ";
    self.message = @"asdasdasda";
    UIAlertAction *alter = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//    self.preferredStyle = UIAlertControllerStyleAlert;
    [self addAction:alter];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
