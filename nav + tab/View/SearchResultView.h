#import <UIKit/UIKit.h>
#import "AppDetails.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SearchResultViewDelegate <NSObject>

- (void) loadAppPage;

@end

@interface SearchResultView : UICollectionViewCell

@property (nonatomic, weak) id<SearchResultViewDelegate> delegate;

- (void) fillDetails:(AppDetails *)app;

@end

NS_ASSUME_NONNULL_END
