//
//  NPThemeNavigationBarProtocol.h
//  NewsPacker
//
//  Created by Akira Matsuda on 2013/10/16.
//  Copyright (c) 2013年 Akira Matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol NPThemeNavigationBarProtocol <NSObject>

@required
+ (UIColor *)navigationBarTintColor;
+ (UIImage *)navigationBarBackgroundImage;
+ (UIBarStyle)navigationBarStyle;

@end
