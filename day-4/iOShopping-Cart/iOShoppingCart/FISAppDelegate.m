//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISShoppingCart.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    FISShoppingCart *cart = [[FISShoppingCart alloc] init];
    cart.items = [[NSMutableArray alloc] init];
    cart.myDictionary = [[NSDictionary alloc] init];

    FISItem *item = [[FISItem alloc] init];
    item.name = @"Peanuts";
    item.priceInCents = 100;

    FISItem *apples = [[FISItem alloc] init];
    apples.name = @"Apples";
    apples.priceInCents = 500;

    [cart addItem:item];
    [cart addItem:apples];

    [cart sortItemsByNameAsc];

    NSLog(@"%@",cart.items);
    
    return YES;
}

@end
