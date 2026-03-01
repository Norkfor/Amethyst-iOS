#import "BaseAuthenticator.h"

@implementation LocalAuthenticator

- (void)loginWithCallback:(Callback)callback {
    self.authData[@"oldusername"] = self.authData[@"username"] = self.authData[@"input"];
    // Generate a random offline UUID to avoid Minecraft treating the account as demo
    self.authData[@"profileId"] = [self generateOfflineUUID];
    callback(nil, [super saveChanges]);
}

- (NSString *)generateOfflineUUID {
    NSUUID *uuid = [NSUUID UUID];
    return [uuid UUIDString];
}

- (void)refreshTokenWithCallback:(Callback)callback {
    // Nothing to do
    callback(nil, YES);
}

@end
