# OOP-Cards Simple Views

## Objectives

1. Use Storyboard to layout a view controller
2. Link labels and buttons in storyboard to a view controller's class file.
3. Write the implementation for IBActions to change the text displayed in UILabels.

## Introduction

In this lab we're going to turn the canvas of a view controller into a representation of a playing card. You'll see that our `FICard` class has been imported from previous labs, and the `FISCardSwitcherViewController` is already setting up a few cards for us to use.

## Instructions:

Open the `OOPCardsSimpleView.xcworkspace` file and navigate to the storyboard file. You'll see an empty view controller that's already connected to the `FISCardSwitcherViewController` class.

1. Create three UILabels on the view controller canvas:
  * one in the upper-left hand corner,
  * one in the bottom-right hand corner, and 
  * one right in the center.  
  Leave a little bit of room at the bottom for a row of UIButtons that we'll add later.
  
2. Set the *accesibility label* of each of these UILabels to be `topLabel`, `middleLabel`, and `bottomLabel` respectively. This is how our tests determine which label is which. Set `!N` as the default text in each. Increase the font size of the middle label to something greater than 40.

3. Now, add four UIButtons to the bottom of the canvas in a row:
  * set the button title to `♠️3` and the *accessibility label* to `threeOfSpadesButton`,
  * set the button title to `♣️4` and the *accessibility label* to `fourOfClubsButton`,
  * set the button title to `♦️8` and the *accessibility label* to `eightOfDiamondsButton`,
  * set the button title to `♥️10` and the *accessibility label* to `tenOfHeartsButton`.

4. Connect the IBActions for these four buttons and write their implementations so that when one is pressed, all three of the UILabels update their text to show the `cardLabel` for the card that matches that button. The tests should pass when you have done this correctly.

**Note:** *If you have trouble copy/pasting the suit characters from the README, you can also find them in the test files.*

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/OOP-Cards-Simple-Views' title='OOP-Cards Simple Views'>OOP-Cards Simple Views</a> on Learn.co and start learning to code for free.</p>
