#import "SearchResultModel.h"
#import "AppDetails.h"

@interface SearchResultModel() {
    @private NSString *searchTerm;
}

@end

@implementation SearchResultModel

- (instancetype) initWithSearchTerm:(NSString *)searchTerm {
    self = [super init];
    if (self != nil) {
        self->searchTerm = searchTerm;
        _apps = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) getData {
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&entity=software", searchTerm];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"Error: %@", jsonError);
            return;
        }
        NSArray *results = json[@"results"];
        for (NSDictionary *result in results) {
            NSData *iconData = [NSData dataWithContentsOfURL:[NSURL URLWithString:result[@"artworkUrl60"]]];
            NSMutableArray *screenShotsArray = [[NSMutableArray alloc] init];
            for (int i=0;i<3;i++) {
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:result[@"screenshotUrls"][i]]];
                [screenShotsArray addObject:imageData];
            }
            AppDetails *appDetails = [[AppDetails alloc] initWithAppTitle:result[@"trackName"]
                                                                  appIcon:iconData
                                                                 appGenre:result[@"primaryGenreName"]
                                                                appRating:result[@"averageUserRating"]
                                                            appThumbnails:screenShotsArray
                                                              openAppPage:result[@"trackViewUrl"]];
            [self->_apps addObject:appDetails];
        }
        [self doSomeTask];
    }];
    [dataTask resume];
}

- (void) doSomeTask {
    NSLog(@"%lu", (unsigned long)[self->_apps count]);
}

@end
