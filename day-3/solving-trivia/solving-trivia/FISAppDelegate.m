//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self solveTrivia];
    return YES;
}

- (NSString *)solveTrivia {
//    NSArray *capitals = @["Montgomery","@Juneau"];
//    NSArray *states = @["Alabama",@"Alaska"];
//


    NSDictionary *stateCapitals= @{@"Alabama":@"Montgomery",
                                   @"Alaska":@"Juneau",
                                   @"Arizona":@"Phoenix",
                                   @"Arkansas":@"Little Rock",
                                   @"California":@"Sacramento",
                                   @"Colorado":@"Denver",
                                   @"Connecticut":@"Hartford",
                                   @"Delaware":@"Dover",
                                   @"Florida":@"Tallahassee",
                                   @"Georgia":@"Atlanta",
                                   @"Hawaii":@"Honolulu",
                                   @"Idaho":@"Boise",
                                   @"Illinois":@"Springfield",
                                   @"Indiana":@"Indianapolis",
                                   @"Iowa":@"Des Moines",
                                   @"Kansas":@"Topeka",
                                   @"Kentucky":@"Frankfort",
                                   @"Lousiana":@"Baton Rouge",
                                   @"Maine":@"Augusta",
                                   @"Maryland":@"Annapolis",
                                   @"Massassachusetts":@"Boston",
                                   @"Michigan":@"Lansing",
                                   @"Minnesota":@"Saint Paul",
                                   @"Mississippi":@"Jackson",
                                   @"Missouri":@"Jefferson City",
                                   @"Montana":@"Helena",
                                   @"Nebraska":@"Lincoln",
                                   @"Nevada":@"Carson City",
                                   @"New Hampshire":@"Concord",
                                   @"New Jersey":@"Trenton",
                                   @"New Mexico":@"Santa Fe",
                                   @"New York":@"Albany",
                                   @"North Carolina":@"Raleigh",
                                   @"North Dakota":@"Bismarck",
                                   @"Ohio":@"Columbus",
                                   @"Oklahoma":@"Oklahoma City",
                                   @"Oregon":@"Salem",
                                   @"Pennsylvania":@"Harrisburg",
                                   @"Rhode Island":@"Providence",
                                   @"South Carolina":@"Columbia",
                                   @"South Dakota":@"Pierre",
                                   @"Tennessee":@"Nashville",
                                   @"Texas":@"Austin",
                                   @"Utah":@"Salt Lake City",
                                   @"Vermont":@"Montpelier",
                                   @"Virgina":@"Richmond",
                                   @"Washington":@"Olympia",
                                   @"West Virginia":@"Charleston",
                                   @"Wisconsin":@"Madison",
                                   @"Wyoming":@"Cheyenne"};


//    NSString *city = stateCapitals[@"Alabama"];
//
//
//
//    NSString *state = @"Alabama";

    for (NSString *state in stateCapitals) {
        NSString *city = stateCapitals[state];

        NSMutableArray *charactersInState = [[NSMutableArray alloc] initWithCapacity:[state length]];

        for (NSUInteger i=0; i < [state length]; i++) {
            NSString *ichar  = [NSString stringWithFormat:@"%c", [state characterAtIndex:i]];
            [charactersInState addObject:ichar];
        }

        BOOL correctAnswer = true;


        for (NSString *stateCharacter in charactersInState) {

            // Get Characters for the City
            NSMutableArray *characterInCity = [[NSMutableArray alloc] initWithCapacity:[city length]];

            for (NSUInteger i=0; i < [city length]; i++) {
                NSString *ichar  = [NSString stringWithFormat:@"%c", [city characterAtIndex:i]];
                [characterInCity addObject:ichar];
            }

            //Done getting characters


            for (NSString *cityCharacter in characterInCity) {

                NSString *uppercaseCity = [cityCharacter uppercaseString];
                NSString *uppercaseState = [stateCharacter uppercaseString];

                if ([uppercaseCity isEqualToString:uppercaseState]) {
                    correctAnswer = false;
                }
            }



        }
        if(correctAnswer){
            NSLog(@"%@ is the correct answer",state);
            return state;
        }

    }


    return @"";



}
/*

Write your method here

*/

@end
