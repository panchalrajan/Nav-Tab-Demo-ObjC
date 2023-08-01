#import "AppDetails.h"

@implementation AppDetails

- (instancetype) initWithAppTitle:(NSString *)appTitle
                          appIcon:(NSData *)appIcon
                         appGenre:(NSString *)appGenre
                        appRating:(NSString *)appRating
                    appThumbnails:(NSArray *)appThumbnails
                      openAppPage:(NSString *)openAppPage {
    if( self = [super init]) {
        _appTitle = appTitle;
        _appIcon = appIcon;
        _appGenre = appGenre;
        _appRating = appRating;
        _appThumbnails = appThumbnails;
        _openAppPage = openAppPage;
    }
  return self;
}

@end
