//
//  NPThemeTableProtocol.h
//  NewsPacker
//
//  Created by Akira Matsuda on 2013/10/16.
//  Copyright (c) 2013年 Akira Matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol NPThemeTableViewProtocol <NSObject>
@optional

+ (UITableViewCellSeparatorStyle)separatorStyle;
+ (UIScrollViewIndicatorStyle)scrollIndicatorStyle;

+ (UIFont *)tableViewCellTextLabelFont;
+ (UIColor *)tableViewCellTextLabelShadowColor;
+ (CGSize)tableViewCellTextLabelShadowOffset;

+ (UIFont *)tableViewCellDetailTextLabelFont;
+ (UIColor *)tableViewCellDetailTextLabelShadowColor;
+ (CGSize)tableViewCellDetailTextLabelShadowOffset;

@required
+ (UIColor *)tableViewBackgroundColor;
+ (UIColor *)tableViewCellBackgroundColor;
+ (UIColor *)tableViewCellTextLabelTextColor;
+ (UIColor *)tableViewCellDetailTextLabelTextColor;

@end

