//
//  LFNavigationController.m
//  LFCustomDemo
//
//  Created by 扫仙科技 on 2018/10/12.
//  Copyright © 2018年 扫仙科技. All rights reserved.
//

#import "LFNavigationController.h"

@interface LFNavigationController ()

@end

@implementation LFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 解决自定义返回按钮后滑动手势失效的问题
    self.interactivePopGestureRecognizer.delegate = nil;
    
}

+(void)initialize{
    [[UINavigationBar appearance] setBarTintColor:LFColor(153, 93, 176, 1.f)];
    [[UINavigationBar appearance] setBackgroundColor:LFColor(153, 93, 176, 1.f)];
    
    //修改标题的颜色字体大小
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

// 可以自定义交互动画
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count) {
        // 自定义返回按钮图片的样式
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateHighlighted];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        backButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        // 按钮内部的所有内容左对齐
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0); // 调整返回按钮的位置
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    // 解决iPhone X push页面时 tabar 上移的问题
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = kScreenHeight - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
    
}

-(void)back{
    [self popViewControllerAnimated:YES];
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
