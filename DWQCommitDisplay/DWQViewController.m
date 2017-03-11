//
//  DWQViewController.m
//  DWQCommitDisplay
//
//  Created by 杜文全 on 16/11/11.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import "DWQViewController.h"
#import "DWQCommitController.h"
@interface DWQViewController ()

@end

@implementation DWQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"杜文全分享";
}
- (IBAction)ToCommit:(id)sender {
    DWQCommitController *dwqCommit=[[DWQCommitController alloc]init];
    
    [self.navigationController pushViewController:dwqCommit animated:YES];
    
    
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
