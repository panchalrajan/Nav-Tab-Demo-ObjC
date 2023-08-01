#import "SearchVC.h"
#import "SearchResultView.h"
#import "SearchResultModel.h"

@interface SearchVC () <UISearchBarDelegate, SearchResultViewDelegate> {
    SearchResultView *searchResultView;
    SearchResultModel *searchResultModel;
    @private UIActivityIndicatorView *activityIndicator;
}

@end

@implementation SearchVC


- (void)viewDidLoad {
    [super viewDidLoad];
    searchResultModel = [[SearchResultModel alloc] initWithSearchTerm:@"Instagram"];
    searchResultView = [[SearchResultView alloc] init];
    searchResultView.delegate = self;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [self->searchResultModel getData];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self->activityIndicator startAnimating];
            [self.collectionView reloadData];
        });
    });
    
    [self.collectionView registerClass:[SearchResultView class] forCellWithReuseIdentifier:@"searchResultIdentifier"];
    UISearchController *searchController = [[UISearchController alloc]init];
    self.navigationItem.searchController = searchController;
    self.navigationItem.hidesSearchBarWhenScrolling = NO;
    searchController.searchBar.delegate = self;
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [searchResultModel.apps count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchResultView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"searchResultIdentifier" forIndexPath:indexPath];
    [cell fillDetails:searchResultModel.apps[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height/2.5);
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(searchNow) object:nil];
    [self performSelector:@selector(searchNow) withObject:nil afterDelay:0.5];
}

- (void)searchNow{
    NSLog(@"hello");
}

- (void)loadAppPage {
    NSLog(@"hello");
}

@end
