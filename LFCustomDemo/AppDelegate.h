//
//  AppDelegate.h
//  LFCustomDemo
//
//  Created by 扫仙科技 on 2018/10/12.
//  Copyright © 2018年 扫仙科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// 定义全局的tabbar
@property (nonatomic ,strong) LFTabBarController *tabBarController;


@end

