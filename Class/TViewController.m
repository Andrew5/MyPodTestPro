//
//  TViewController.m
//  Pods
//
//  Created by jabraknight on 2021/7/14.
//

#import "TViewController.h"

@interface TViewController ()

@end

@implementation TViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"环境 %@",[self testI]);
    // Do any additional setup after loading the view.
}
- (NSString *)testI{
#ifdef DEV
    NSString * HostDomain     = @"DEV";// dev
#elif PRO
    NSString * HostDomain     = @"PRO";// dev
#elif UAT
    NSString * HostDomain     = @"UAT";// dev
#else
    NSString * HostDomain     = @"other";// dev
#endif
    NSString *log = @"";
    
#if (APP_CONFIG_FLAG == 0)
    log = @"生产环境";
#elif (APP_CONFIG_FLAG == 1)
    log = @"Debug环境";
#elif (APP_CONFIG_FLAG == 2)
    log = @"测试环境";
#endif
    
    NSLog(@"PodTest运行环境：%@",log);
    return log;
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
