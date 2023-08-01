#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDetails : NSObject

@property (nonatomic, strong) NSString *appTitle;
@property (nonatomic, strong) NSData *appIcon;
@property (nonatomic, strong) NSString *appGenre;
@property (nonatomic, strong) NSString *appRating;
@property (nonatomic, strong) NSArray *appThumbnails;
@property (nonatomic, strong) NSString *openAppPage;

- (instancetype) initWithAppTitle:(NSString *)appTitle
                          appIcon:(NSData *)appIcon
                         appGenre:(NSString *)appGenre
                        appRating:(NSString *)appRating
                    appThumbnails:(NSArray *)appThumbnails
                      openAppPage:(NSString *)openAppPage;
@end

NS_ASSUME_NONNULL_END
