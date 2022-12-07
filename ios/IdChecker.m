#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(IdChecker, NSObject)

// RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
//                  withResolver:(RCTPromiseResolveBlock)resolve
//                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(checkId:
//                  (RCTResponseSenderBlock)callback
//                  name:(NSString *)name location:(NSString *)location date:(NSString *)date
                  (NSString *)cardID dateOfBirthYYMMDD:(NSString *)dateOfBirthYYMMDD dateOfExpireYYMMDD:(NSString *)dateOfExpireYYMMDD callback:(RCTResponseSenderBlock)callback
                  )

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
