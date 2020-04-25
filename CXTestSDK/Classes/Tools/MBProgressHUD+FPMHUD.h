//
//  MBProgressHUD+FPMHUD.h
//  SJNet_FPM_SDK
//
//  Created by CXTretar on 2020/3/23.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (FPMHUD)

+ (void)FPM_ShowMessageInWindow:(NSString*)message;
+ (void)FPM_ShowLoading:(NSString*)message;
+ (void)FPM_ShowLoading:(NSString*)message timer:(int)aTimer completion:(void(^)(void))completionBlock;
+ (void)FPM_HideHUD;

+ (UIViewController*)getCurrentWindowVC;

@end

