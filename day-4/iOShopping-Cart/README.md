# Shopping Cart

## Objectives

1. Create a custom class file that inherits from `NSObject`.
2. Import another custom class.
3. Declare a property on a custom class.
4. Write methods for the custom class to perform on a property that it owns.

## Instructions

Open the `iOShoppingCart.xcworkspace` file. You should see the familiar `FISAppDelegate` class and a `FISItem` class set up already.

I. Create a new `FISShoppingCart` class that inherits from `NSObject`.  
Import `FISItem` into `FISShoppingCart`'s header file.  
Declare one property, an `NSMutableArray` called `items`.  
Declare the following 11 methods in `FISShoppingCart.h`:

  * `calculateTotalPriceInCents` which takes no arguments and returns an `NSUInteger`,
  * `addItem:` which takes one `FISItem` argument called `item` and provides no return,
  * `removeItem:` which takes one `FISItem` argument called `item` and provides no return,
  * `removeAllItemsLikeItem:` which takes on `FISItem` argument called `item` and provides no return,
  * `sortItemsByNameAsc` which takes no arguments and provides no return,
  * `sortItemsByNameDesc` which takes no arguments and provides no return,
  * `sortItemsByPriceInCentsAsc` which takes no arguments and provides no return,
  * `sortItemsByPriceInCentsDesc` which takes no arguments and provides no return,
  * `allItemsWithName:` which takes one `NSString` argument called `name` and returns an `NSArray`,
  * `allItemsWithMinimumPriceInCents:` which takes one `NSUInteger` argument and returns an `NSArray`, and
  * `allItemsWithMaximumPriceInCents:` which takes one `NSUInteger` argument and returns an `NSArray`.
  
Define the initial method implementations in `FISShoppingCart.m` to either:
  
  * `return nil` for methods that provide a return, or
  * *do nothing* for methods that *do not* provide a return.
  
Run the tests with `⌘` `U` to check that the tests in `FISShoppingCartSpec.m` initially fail.
  
II. Complete each of the method implementations so that they pass their tests:

1. `calculateTotalPriceInCents` should calculate the sum of the `priceInCents` property of all the items in the `items` array. Naturally, this should return `0` if the `items` array is empty.

2. `addItem:` should add the submitted item to the `items` array, even if the item is already in the `items` array (sometimes you just need to stock up on hot pockets!).

3. `removeItem:` should remove a single occurrence of an item in the `items` array.  
**Hint:** *Use* `NSMutableArray`*'s* `indexOfObject:` *and*`removeObjectAtIndex:` *method.*

4. `removeAllItemsLikeItem:` should remove all occurrences of an item in the `items` array.

5. `sortItemsByNameAsc` should sort the contents of the `items` array by their `name` property in ascending order (alphabetical).  
**Hint:** *Use* `NSSortDescriptor` *for these methods.*

6. `sortItemsByNameDesc` should sort the contents of the `items` array by their `name` property in descending order.

7. `sortItemsByPriceInCentsAsc` should sort the contents of the `items` array by the `priceInCents` property in ascending order.

8. `sortItemsByPriceInCentsDesc` should sort the the contents of the `items` array by the `priceInCents` property in descending order.

9. `allItemsWithName:` should return an array containing only the items whose `name` property matches the argument string.  
**Hint:** *Use* `NSPredicate` *for these methods.*

10. `allItemsWithMinimumPriceInCents:` should return an array containing only the items whose `priceInCents` property is *greater than or equal to* the argument integer.

11. `allItemsWithMaximumPriceInCents:` should return an array containing only those items whose `priceInCents` property is *less than or equal to* the argument integer.


<p data-visibility='hidden'>View <a href='https://learn.co/lessons/iOShopping-Cart' title='Shopping Cart'>Shopping Cart</a> on Learn.co and start learning to code for free.</p>

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/iOShopping-Cart'>Shopping Cart</a> on Learn.co and start learning to code for free.</p>
