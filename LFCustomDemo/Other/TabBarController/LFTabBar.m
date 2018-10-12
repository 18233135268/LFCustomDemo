//
//  LFTabBar.m
//  LFCustomDemo
//
//  Created by 扫仙科技 on 2018/10/12.
//  Copyright © 2018年 扫仙科技. All rights reserved.
//

#import "LFTabBar.h"

static const NSInteger ITEMCOUNT = 5;
@interface LFTabBar()
@end
@implementation LFTabBar



-(instancetype)init{
    if (self = [super init]) {
        [self initSubViews];
    }
    return self;
}

-(void)initSubViews{
    // 分割线
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, -1, kScreenWidth, 1)];
    topView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:topView];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    button.bounds = CGRectMake(0, 0, 64*kScale, 64*kScale);
    self.centerBtn = button;
    [self addSubview:button];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.centerBtn.center = CGPointMake(self.width *0.5, self.height *0.1);
    int index = 0;
    CGFloat wid = self.width / ITEMCOUNT;
    for (UIView *sub in self.subviews) {
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            sub.x = index * wid;
            index++;
            // 中间按钮
            if (index == 2) {
                index ++;
            }
        }
    }
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.isHidden == NO) {
        
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        
        if ([self.centerBtn pointInside:newPoint withEvent:event]) {
            return self.centerBtn;
        }else{
            return [super hitTest:point withEvent:event];
        }
        
    }else{
        return [super hitTest:point withEvent:event];
    }
}
@end
