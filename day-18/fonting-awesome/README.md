

# Fonting Awesome!

## Objectives

1. Create an Xcode project.
2. Install third party frameworks using the Cocoapods Dependency Manager.

## Instructions

  1. Make a new single view project
  2. Add the [FontAwesomeKit](https://cocoapods.org/pods/FontAwesomeKit) pod.
    - In your Xcode project's folder, enter the command `pod init`. This will generate an empty Podfile.
    - Go to **FontAwesomeKit**'s documentation page and find the section called **Installing with Cocoapods (Strongly Recommended)**. It should tell you to add `pod 'FontAwesomeKit', '~> 2.2.0'` to your project target in the Podfile. (You may edit the Podfile using Sublime or Xcode). Then save and close it.
    - In terminal, enter the `pod install` command. This will create a `.xcworkspace` for the project (which you should use from now on). It will also download and install the Cocoapod you listed in the Podfile into the Pods project which is visible to the xcworkspace.
    - After that, your project will have access to all of the functionality of FontAwesomeKit. Its capabilities are outlined in their documentation page. The sections that are of particular interest for getting started will be **Importing Headers** and **Example Usage**.
  3. FontAwesomeKit creates an `NSAttributedString` with the `attributedString` method. To assign an attributedString to a UIButton title you need to use the `setAttributedTitle:forState:` method.
    * Add a button in the center of the view controller's canvas. At run time, make its title display an icon that you like from the FontAwesomeKit framework.
    * When the button is pressed, it should show a different icon from the FontAwesomeKit framework.
  4. Add another really awesome CocoaPod called [CWStatusBarNotification](https://cocoapods.org/pods/CWStatusBarNotification) by following the same installation steps detailed above. The framework makes it easy to put quick notifications in the iPhone's status bar. It's great for giving unobtrusive notifications to your user for things like updated data or incorrect form entries.
  5. Use CWStatusBarNotification's documentation to figure out how to tell your user that they are pressing (and holding) the button that has an awesome font.
<p data-visibility='hidden'>View <a href='https://learn.co/lessons/fonting-awesome' title='Fonting Awesome!'>Fonting Awesome!</a> on Learn.co and start learning to code for free.</p>
