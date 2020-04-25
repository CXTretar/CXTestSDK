//
//  MBProgressHUD+FPMHUD.m
//  SJNet_FPM_SDK
//
//  Created by CXTretar on 2020/3/23.
//

#import "MBProgressHUD+FPMHUD.h"

@implementation MBProgressHUD (FPMHUD)

+ (MBProgressHUD*)createHUDWithMessage:(NSString*)message isWindow:(BOOL)isWindow {
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10.f;
    hud.label.text = message ? message : @"加载中...";
    hud.label.font = [UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    
    return hud;
}

+ (void)FPM_ShowTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer {
    MBProgressHUD *hud = [self createHUDWithMessage:message isWindow:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:aTimer];
}

+ (void)FPM_ShowLoading:(NSString*)message timer:(int)aTimer completion:(void(^)(void))completionBlock {
    UIView *view = (UIView*)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.6f];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:aTimer];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(aTimer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completionBlock) {
            completionBlock();
        }
    });
    
}

+ (void)FPM_ShowLoading:(NSString*)message {
    UIView *view = (UIView*)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.6f];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    
}

+ (void)FPM_ShowMessageInWindow:(NSString*)message {
    [self FPM_ShowTipMessage:message isWindow:true timer:2.0f];
}

+ (void)FPM_HideHUD {
    UIView  *window = (UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:window animated:YES];
    [self hideHUDForView:[self getCurrentUIVC].view animated:YES];
}


#pragma mark --- 获取当前Window试图---------
//获取当前屏幕显示的viewcontroller
+ (UIViewController*)getCurrentWindowVC {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到它
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    id nextResponder = nil;
    UIViewController *appRootVC = window.rootViewController;
    if ([appRootVC isKindOfClass:[UITabBarController class]]) {
        nextResponder = appRootVC;
    }else
        if (appRootVC.presentedViewController) {
            //1、通过present弹出VC，appRootVC.presentedViewController不为nil
            nextResponder = appRootVC.presentedViewController;
        }else
            if (appRootVC.childViewControllers>0) {
                nextResponder = appRootVC.childViewControllers[0];
            }else
            {
                //2、通过navigationcontroller弹出VC
                UIView *frontView = [[window subviews] objectAtIndex:0];
                nextResponder = [frontView nextResponder];
            }
    return nextResponder;
}

+ (UINavigationController *)getCurrentNaVC {
    UIViewController  *viewVC = (UIViewController*)[ self getCurrentWindowVC ];
    UINavigationController  *naVC;
    if ([viewVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController  *tabbar = (UITabBarController*)viewVC;
        naVC = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        if (naVC.presentedViewController) {
            while (naVC.presentedViewController) {
                naVC = (UINavigationController*)naVC.presentedViewController;
            }
        }
    }else
        if ([viewVC isKindOfClass:[UINavigationController class]]) {
            
            naVC  = (UINavigationController*)viewVC;
            if (naVC.presentedViewController) {
                while (naVC.presentedViewController) {
                    naVC = (UINavigationController*)naVC.presentedViewController;
                }
            }
        }else if ([viewVC isKindOfClass:[UIViewController class]]) {
            if (viewVC.navigationController) {
                return viewVC.navigationController;
            }
            return  (UINavigationController*)viewVC;
        }
    return naVC;
}

+ (UIViewController*)getCurrentUIVC {
    UIViewController   *cc;
    UINavigationController  *na = (UINavigationController*)[[self class] getCurrentNaVC];
    if ([na isKindOfClass:[UINavigationController class]]) {
        cc =  na.viewControllers.lastObject;
        
        if (cc.childViewControllers.count > 0) {
            
            cc = [[self class] getSubUIVCWithVC:cc];
        }
    }else {
        cc = (UIViewController*)na;
    }
    return cc;
}

+ (UIViewController *)getSubUIVCWithVC:(UIViewController*)vc {
    UIViewController *cc;
    cc =  vc.childViewControllers.lastObject;
    if (cc.childViewControllers>0) {
        
        [[self class] getSubUIVCWithVC:cc];
    }else {
        return cc;
    }
    return cc;
}



@end
