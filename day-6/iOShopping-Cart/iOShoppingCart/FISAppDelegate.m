//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISShoppingCart.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    FISShoppingCart *cart = [[FISShoppingCart alloc] init];
//    cart.items = [[NSMutableArray alloc] init]; Not needed -> in init
  //  cart.myDictionary = [[NSDictionary alloc] init];

    FISItem *item = [[FISItem alloc] init];
    item.name = @"Peanut";
    item.priceInCents = 100;

    FISItem *apples = [[FISItem alloc] init];
    apples.name = @"Apples";
    apples.priceInCents = 500;

    FISItem *pears = [[FISItem alloc] init];
    pears.name = @"Pears";
    pears.priceInCents = 900;



    [cart addItem:item];
    [cart addItem:apples];
    [cart addItem:pears];

    [cart sortItemsByNameAsc];
    NSLog(@"After Name sort \n %@",cart.items);
    [cart sortItemsByPriceInCentsAsc];

    NSLog(@"After Price sort \n %@",cart.items);

    NSLog(@"%li",[cart calculateTotalPriceInCents]);


    FISShoppingCart *newCart = [[FISShoppingCart alloc] initWithShippingAddress:@"11 Broadway"];

    FISItem *newItem = [[FISItem alloc] initWithName:@"Kindle" priceInCents:23456];
    [newCart addItem:newItem];

    NSLog(@"%@",newCart.shippingAddress);


    FISShoppingCart *newUsersCart = [[FISShoppingCart alloc] init];

    //code code code code

    NSLog(@"The address of the new user is: %@",newUsersCart.shippingAddress);

    


    
    return YES;
}

@end
