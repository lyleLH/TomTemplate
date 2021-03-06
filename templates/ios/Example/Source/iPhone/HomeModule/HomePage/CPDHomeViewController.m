//
//  CPDHomeViewController.m
//  PROJECT
//
//  Created by Tom.Liu on 2021/2/23.
//  Copyright © 2021 PROJECT_OWNER. All rights reserved.
//

#import "CPDHomeViewController.h"
#import "CPDTestViewController.h"
@interface CPDHomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *pushPageButton;

@end

@implementation CPDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}


- (IBAction)pushToNextPage:(id)sender {
    CPDTestViewController * vc = [[CPDTestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setPushPageButton:(UIButton *)pushPageButton
{
    
    [pushPageButton setFrame:CGRectMake(25, ([UIScreen mainScreen].bounds.size.height - 44)/2.0, [UIScreen mainScreen].bounds.size.width - 25*2, 44)];
    [pushPageButton setTitle:@"Push (测试导航栏设置)" forState:UIControlStateNormal];
    [pushPageButton setTitleColor:[UIColor yk_themeColor] forState:UIControlStateNormal];
    [pushPageButton setBackgroundColor:[UIColor yk_lightBlueBgColor]];
    
    _pushPageButton = pushPageButton;
}
@end
