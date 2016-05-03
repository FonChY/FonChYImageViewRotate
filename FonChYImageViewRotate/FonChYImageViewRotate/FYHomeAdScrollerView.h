//
//  FYHomeAdScrollerView.h
//  PerfectBuyText
//
//  Created by FonChY on 16/4/29.
//  Copyright © 2016年 ChinaPan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, UIPageControlShowStyle)
{
    UIPageControlShowStyleNone,//default
    UIPageControlShowStyleLeft,
    UIPageControlShowStyleCenter,
    UIPageControlShowStyleRight,
};

typedef NS_ENUM(NSUInteger, AdTitleShowStyle)
{
    AdTitleShowStyleNone,
    AdTitleShowStyleLeft,
    AdTitleShowStyleCenter,
    AdTitleShowStyleRight,
};
@interface FYHomeAdScrollerView : UIScrollView<UIScrollViewDelegate>
/**
 *  页码
 */
@property (retain,nonatomic) UIPageControl * pageControl;
/**
 *  图片数组
 */
@property (retain,nonatomic,readwrite) NSArray * imageNameArray;
/**
 *  标题数组
 */
@property (retain,nonatomic,readwrite) NSArray * adTitleArray;
/**
 *  页码样式
 */
@property (assign,nonatomic,readwrite) UIPageControlShowStyle  PageControlShowStyle;
/**
 *  标题样式
 */
@property (assign,nonatomic,readwrite) AdTitleShowStyle  adTitleStyle;

@property (nonatomic, assign) BOOL isInternet;

@end
