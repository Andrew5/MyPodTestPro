//
//  TestEvn.m
//  MyPodTestPro
//
//  Created by jabraknight on 2021/7/7.
//

#import "TestEvn.h"
///根据环境返回对应的url
#define GMM_Enviroment_URL(product,pre,uat)                     \
NSString *strHost = product;                                    \
GME_Enviroment enviroment = [GSwitchEnviroment enviromentType]; \
if ( GME_Enviroment_PRE == enviroment )                         \
{                                                               \
    strHost = pre;                                              \
}                                                               \
else if( GME_Enviroment_UAT == enviroment )                     \
{                                                               \
    strHost = uat;                                              \
}                                                               \
return strHost;

#define DEFAULT_URL [GSwitchEnviroment strDefaultHost]


@implementation TestEvn
- (void)startWithPrint{
//#ifdef PRO
//    NSLog(@"TestEvn正式");
//#else
//
//    NSLog(@"TestEvn测试");
//
//
//#endif
}
@end
