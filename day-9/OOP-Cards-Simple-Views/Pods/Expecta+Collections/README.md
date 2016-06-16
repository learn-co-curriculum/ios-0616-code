# Expecta+Collections


## What it does

Provides a new matcher `equalInAnyOrder` that takes an `NSArray` a will check for equality without checking for order.

## Installation

Expecta+Collections is available through [CocoaPods](http://cocoapods.org), to install it simply add the following line to your Podfile:

    pod "Expecta+Collections"

It's likely that you'll want this in a testing subset, this usually looks like:


    target 'MyApp Tests', :exclusive => true do
        pod 'Specta'
        pod 'Expecta'
        pod 'Expecta+Collections', '~> 1.0'
    end



## License

Expecta+Collections is available under the MIT license. See the LICENSE file for more info.

