#import "ViewController.h"
#import "TodayVC.h"
#import "AppsVC.h"
#import "SearchVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateFrontView];
}

- (void) generateFrontView {
    self.view.backgroundColor = UIColor.redColor;;
    
    UICollectionViewController *first = [[TodayVC alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    first.view.backgroundColor = UIColor.whiteColor;
    first.navigationItem.title = @"Today";
    UINavigationController *todayVC = [[UINavigationController alloc] initWithRootViewController:first];
    todayVC.tabBarItem.title = @"Today";
    todayVC.tabBarItem.image = [UIImage imageNamed:@"today"];
    todayVC.navigationBar.prefersLargeTitles = YES;
    
    
    AppsVC *second = [[AppsVC alloc] init];
    second.view.backgroundColor = UIColor.whiteColor;
    second.navigationItem.title = @"Games";
    UINavigationController *gamesVC = [[UINavigationController alloc] initWithRootViewController:second];
    gamesVC.tabBarItem.title = @"Games";
    gamesVC.tabBarItem.image = [UIImage imageNamed:@"games"];
    gamesVC.navigationBar.prefersLargeTitles = YES;
    
    UIViewController *third = [[UIViewController alloc] init];
    third.view.backgroundColor = UIColor.whiteColor;
    third.navigationItem.title = @"Apps";
    UINavigationController *appsVC = [[UINavigationController alloc] initWithRootViewController:third];
    appsVC.tabBarItem.title = @"Apps";
    appsVC.tabBarItem.image = [UIImage imageNamed:@"apps"];
    appsVC.navigationBar.prefersLargeTitles = YES;
    
    UIViewController *forth = [[UIViewController alloc] init];
    forth.view.backgroundColor = UIColor.whiteColor;
    forth.navigationItem.title = @"Arcade";
    UINavigationController *arcadeVC = [[UINavigationController alloc] initWithRootViewController:forth];
    arcadeVC.tabBarItem.title = @"Arcade";
    arcadeVC.tabBarItem.image = [UIImage imageNamed:@"arcade"];
    arcadeVC.navigationBar.prefersLargeTitles = YES;
    
    UICollectionViewController *fifth = [[SearchVC alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    fifth.view.backgroundColor = UIColor.whiteColor;
    fifth.navigationItem.title = @"Search";
    UINavigationController *searchVC = [[UINavigationController alloc] initWithRootViewController:fifth];
    searchVC.tabBarItem.title = @"Search";
    searchVC.tabBarItem.image = [UIImage imageNamed:@"search"];
    searchVC.navigationBar.prefersLargeTitles = YES;
    
    self.viewControllers = @[todayVC, gamesVC, appsVC, arcadeVC, searchVC];
    
}

@end
