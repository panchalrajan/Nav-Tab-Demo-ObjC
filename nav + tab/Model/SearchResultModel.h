#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultModel : NSObject

@property (nonatomic,strong) NSMutableArray *apps;

- (void) getData;
- (instancetype) initWithSearchTerm:(NSString *)searchTerm ;

@end

NS_ASSUME_NONNULL_END
