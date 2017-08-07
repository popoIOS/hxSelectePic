//
//  PhotoViewController.m
//  微博照片选择
//
//  Created by ydz on 17/3/20.
//  Copyright © 2017年 洪欣. All rights reserved.
//

#import "PhotoViewController.h"
#import "HXPhotoViewController.h"
#import "HXPhotoView.h"
#import "CustomViewController.h"

@interface PhotoViewController ()<HXPhotoViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    CGFloat height;
}
@property (strong, nonatomic) IBOutlet UITableViewCell *cellPhoto;
@property (weak, nonatomic) IBOutlet UIView *viewPhoto;
@property (weak, nonatomic) IBOutlet UITableView *tablePhoto;
@property (strong, nonatomic) HXPhotoManager *manager;

@end

@implementation PhotoViewController

- (HXPhotoManager *)manager
{
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
        //        _manager.openCamera = NO;
        _manager.outerCamera = YES;
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;
    CGFloat width = self.view.frame.size.width;
    HXPhotoView *photoView = [HXPhotoView photoManager:self.manager];
    photoView.frame = CGRectMake(12, 100, width - 24, 0);
    photoView.delegate = self;
    photoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:photoView];
}

- (void)photoViewUpdateFrame:(CGRect)frame WithView:(UIView *)view
{
    height = frame.size.height;
    [self.tablePhoto reloadData];
    NSLog(@"%@",NSStringFromCGRect(frame));
}

- (void)photoViewChangeComplete:(NSArray *)allList Photos:(NSArray *)photos Videos:(NSArray *)videos Original:(BOOL)isOriginal
{
    NSLog(@"%ld - %ld - %ld",allList.count,photos.count,videos.count);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellPhoto;
}

- (IBAction)dismiss:(id)sender {
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    CustomViewController *cust = [[CustomViewController alloc]init];
    [self presentViewController:cust animated:YES completion:nil];
    
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
