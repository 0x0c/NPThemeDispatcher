//
//  NPThemeDispatcher.h
//  NewsPacker
//
//  Created by Akira Matsuda on 2013/10/16.
//  Copyright (c) 2013年 Akira Matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NPThemeProtocol.h"

@interface NPThemeDispatcher : NSObject

+ (id)currentTheme;
+ (void)setTheme:(Class)clazz;
+ (void)showAlert:(NSString *)title message:(NSString *)message selectedBlock:(void (^)(NSInteger index))selectedBlock  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)buttons;
+ (void)showActionSheet:(UIView *)view title:(NSString *)title selectedBlock:(void (^)(NSInteger index))selectedBlock cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)buttons;

@end

@protocol NPClassThemeDispatcherProtocol <NSObject>

+ (void)appendTheme;
@optional
+ (void)appendThemeWithIdentifier:(NSString *)identifier;

@end

@protocol NPInstanceThemeDispatcherProtocol <NSObject>

- (void)appendTheme;
@optional
- (void)appendThemeWithIdentifier:(NSString *)identifier;

@end

@interface UITableView (ThemeDispatcher)<NPClassThemeDispatcherProtocol, NPInstanceThemeDispatcherProtocol>

@end

@interface UITableViewCell (ThemeDispatcher)<NPInstanceThemeDispatcherProtocol>

@end

@interface UINavigationBar (ThemeDispatcher)<NPClassThemeDispatcherProtocol>

@end

@interface UIToolbar (ThemeDispatcher)<NPClassThemeDispatcherProtocol>

@end

@interface UIBarButtonItem (ThemeDispatcher)<NPClassThemeDispatcherProtocol>

@end
