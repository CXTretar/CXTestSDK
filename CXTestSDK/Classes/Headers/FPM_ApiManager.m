//
//  FPM_ApiManager.m
//  SJNet_FPM_SDK
//
//  Created by CXTretar on 2020/3/15.
//

#import "FPM_ApiManager.h"
#import "MBProgressHUD+FPMHUD.h"

@interface FPM_ApiManager ()


@end

@implementation FPM_ApiManager

+ (void)showWithView:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.6f];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = @"正在加载...";
    UIWindow* window = nil;
    
    if (@available(iOS 13.0, *))
    {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
        {
            if (windowScene.activationState == UISceneActivationStateForegroundActive)
            {
                window = windowScene.windows.firstObject;
                
                break;
            }
        }
    }else{
        window = [UIApplication sharedApplication].keyWindow;
    }
    
    NSLog(@"window %@--- view", window);
}


@end
