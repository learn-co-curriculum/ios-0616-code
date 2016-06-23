# BlackJack Views

## Objectives

1. Connect existing data models to a view controller in order to display them.
2. Use `UILabel`s to present information about the current state of your program to your user.
3. Use `UIButton`s to incorporate user interaction into your logical structure.
4. Employ the `hidden` and `enabled` view properties.

## Introduction

In this lab, you're going to take code from the previous `OOP-Cards-Model` and `objc-blackjack` labs to create a visual interface for your data models. You'll use a series of `UILabel`s to show your user the state of the blackjack game, and use a few `UIButton`s to control the actions available.

Most of the tests for this lab (in `FISBlackjackViewControllerSpec.m`) actually tap around in the simulator and look at the various views. It's primarily limited to looking at the content of the labels and being able to press the three buttons that you see, essentially mimicking how your end user might utilize the interface. It will be largely up to you to structure your code in a such a way that ensures the expected outputs. 

The testing suite is also not thorough due to the difficulty presented by the randomness a shuffled card deck, so it's possible to pass the tests yet still have unusual behavior. Don't rely solely on the testing suite to tell you when something's wrong!

## Instructions 

Open the `objc-BlackjackViews.xcworkspace` file and navigate to the `Main.storyboard` file. You'll see a view controller already laid out for you with the necessary labels and buttons for playing Blackjack! However, they're not connected to a class file.

![](https://curriculum-content.s3.amazonaws.com/ios/objc-blackjack-views/blackjack_storyboard.png)

1. Create a new view controller subclass called `FISBlackjackViewController`. Connect up all of the labels and buttons that we provided.

2. Copy in your `FISCard`, `FISCardDeck`, `FISBlackjackPlayer`, and `FISBlackjackGame` class files that you wrote when solving the `objc-Blackjack` lab (the debug console version).

3. Add a `FISBlackjackGame` property to the view controller's header file named `game`. This should be enough to allow the tests to compile.

**Note:** *Because of the randomization inherent to playing blackjack, some of the tests on* `FISBlackjackViewController` *may pass or fail intermittently due to various case being dealt or drawn.*

### Envision the Problem

Before writing any code, put yourself (as the developer) in the mental position of the Blackjack dealer. What steps do you need to take to run a game of Blackjack? You already have several things going for you: you have a deck that can shuffle itself; your opponent (the "player") knows the rules of Blackjack; and your "house rules" dictate when you should hit or stay so you can let the current state of your own hand make that decision for you. With those in mind, the process of running a game of Blackjack, might follow these steps:

1. When the player asks you to deal, give two cards each to the house and to the player.

2. Ask the player to hit or to stay. If they choose to hit, they should receive one card. If the player has not bust (over 21 points), then you as the "house" should take your turn.

3. If the player decides to stay, then you as the "house" play the rest of the game following the house rules in the previous labs.

4. Continue asking the player to hit or stay until they either bust or stay. Figure out the winner when the round has ended and tell the user. Record the result in a tally of wins and losses.

### Write A Single-Use Implementation

Don't tackle the whole problem at once. Start at the beginning and work in small units, running your scheme frequently. 

1. When the app starts, use your `FISBlackjackGame` to start off the game. Use the `hidden` property on the UIViews to hide the labels that shouldn't be shown when the application loads (such as `winner` label, the "cards" that have not been dealt yet, and the "stayed", "busted", and "blackjack" status labels).

![](https://curriculum-content.s3.amazonaws.com/ios/objc-blackjack-views/blackjack_initial_view.png)  
— *A possible setting upon startup.*

2. When a user taps the deal button, a new game should begin dealing two cards to the house and the player.

3. If there is no winner just yet, enable the stay and hit buttons. 

4. When a user taps the hit button it should deal a new card to the player, then the house should take it's turn, then wait for further input. Make sure to check for winners!

5. When a user taps the stay button. Let the house finish playing and display the winner to the user. (Good Luck!)

At this point, you should have a generally-functional single-round game. It should show new cards as they're dealt, tell the user when there is a winner, and update the score.
    
**Hint:** *Views can be stored in collections just like regular objects can. Those collections may or may not be held as properties themselves.*

![](https://curriculum-content.s3.amazonaws.com/ios/objc-blackjack-views/blackjack_busted.png)

### Reset the Game

When a game is complete, the user should be able to re-tap the deal button. As explained above, the deal button should reset the game for a new round.

**Hint:** *If you're already preparing the views for the first game, is there code that you can reuse to prepare for the second game?*

![](https://curriculum-content.s3.amazonaws.com/ios/objc-blackjack-views/blackjack_blackjack.png)

## Advanced

Save your current progress in a commit, especially if you have not done so since cloning the lab.

### Reduce, Reuse, Refactor

Look through your code. Is it easy to follow? Is there duplicated code that can be moved into a private method? Are your method implementations long and cryptic? 

Refactor your code to reduce duplications and improve readability. Test often to identify when a change may have broken something. *Don't be afraid to experiment! Remember that if you make a mess of your code shortly after a commit, you can reset your git as a safety net.*

### Empathize With The User

Now that you've written the application from the perspective of the system, flip your perspective to that of the user. Play a few rounds of the game to get a sense of the user experience. Is there anything lacking from your presentation? Are labels appearing at times when they shouldn't?

Here's something to look for:

In casino blackjack, while the player's cards are dealt face up, the house's card are dealt with one face *down* (and the rest face up) in order to obfuscate the house's actual hand and score. When a player must decide to hit or stay, they do not know the house's exact score (but will get told if the house stays or if the house busts). It's not *really* blackjack if you're always showing your user the house's cards and score!

So, adapt your code to only show the label of the house's first card at the *end* of the round. Use a unicode character of your choice (perhaps ❂ ) as the symbol for the "back" of this one card. Show the card's value when the winner declared. Similarly, you should hide the house's score until the *end* of the round, and **not** tell the user when the house holds a blackjack.

![](https://curriculum-content.s3.amazonaws.com/ios/objc-blackjack-views/blackjack_facedown.png)  
— *Obfuscating the house's hand and score.*

### Customize the Color Scheme

This lab was presented with flat design, but you can easily change many of the font and background colors right in Interface Builder. Play around with these basic settings to customize your blackjack game. You can resize and reorganize the buttons and labels to a certain degree, but make sure the layout remains legible and tactile to the user! Also feel free to investigate adding images.

### Download An Alumni's Blackjack App

In the iOS App Store, search for "Flatiron Blackjack" and download the app published by Flatiron School, Inc. This is an app written by Flatiron iOS alumni inspired by the idea of this exercise (it is obviously more fully implemented than it is here).
