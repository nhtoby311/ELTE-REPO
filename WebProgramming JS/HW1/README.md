Your task is to implement an old card game called SET as a browser application.

Rules

The goal of the game is to find SETs of three cards from the twelve cards placed on the desk. All cards have four properties:

SHAPE: oval, squiggle, diamond
COLOR: red, green, purlple
NUMBER: 1,2, or 3 shapes
SHADING: solid, striped or outlined shapes (only used in the subtasks for bonus points)
Every SET consists of three cards, where all properties are:

the same on all of the cards
different on all of the cards.
The selected cards have to adhere to these rules for ALL properties. Worded differently: if the three cards have the same number of shapes, or 1 2 and 3; if the color is the same, or all three colors; if all shapes are solid, or one solid, striped and empty, etc...

Correct and incorrect SETs (Linkek egy külső oldalra)

Game rules (Linkek egy külső oldalra)

The game
The game has two user interfaces:

The starting page, which displays first, and where the settings can be found
The game page, where the game can be played.
We call these "pages", but you don't have to make two separate HTML pages. Moreso, it is a requirement to implement the game as a single-page application, and make the switch between the interfaces in some way (e.g. toggling the hidden property of two divs.)

Starting page
On the game's starting page, show:

The name of the game
The rules of the game (As text, as a link, as a dropdown, etc.)
An option to set the number (and names) of players
An option to set the game mode
And other, miscellaneous options.
By default, the Advanced difficulty should be selected.

The number of players can be set from 1 to 10, the default is 1. Display changeable names for the selected number of players! The default names should be Player1, Player2, ..., PlayerN.

There are two game modes:

Practice: All options are available, and in a one-player game, there is no timer.
Competitive: The miscellaneous options aren't available, and the one-player game has the timer enabled as well.
The miscellaneous options:

Enable or disable a button which tells if there is a SET in the current deal (Competitive: disabled)
Enable or disable a button which shows a SET (Competitive: disabled)
Automatic or button-based deal method for three new cards after no SET was discovered (Competitive: automatic)
Pressing a button labeled Start starts the game.

The game page
We play the game with three properties: SHAPE, COLOR, NUMBER. The SHADING of the shapes is solid, thus we have 3×3×3=27 cards.
At the start of the game, generate the deck and shuffle it, then print it on the console.
Following that, display 12 cards (preferably in a 3×4 layout)
The players in front of the computer examine the table, and if someone finds a SET, they can declare it:
The player tells the computer it's their action (clicking on their name on the interface, or pressing an assigned button on the keyboard)
A timer of 10 seconds starts. If the timer expires before the player makes a selection, the game considers the player made a wrong selection. Displaying the time is optional: you can show a countdown, or simply notify the player if time is up.
While declaring a SET, clicking on a card should select it. Clicking on an already selected card should remove the selection. Any number of cards can be selected or deselected until the player selects their third card, when the game switches to evaluation.
If the player made a wrong selection, they lose a point, and the other players can try finding a set. The original player can't make a new action until someone discovers a SET or all players fail the turn. If all players fail during a turn, everybody gets re-enabled.
If the player made a correct selection, the three selected cards disappear from the table and the player gets a point. All players who made a wrong selection this turn are re-enabled, and the table draws three new cards.
Dealing new cards onto the table works while there is at least one card in the deck. Display the number of remaining cards in the deck!
If there are no more cards in the deck and the table has no valid SET, the game ends. The program should check for this automatically.
If all players fail to find a SET, three new cards are dealt (automatically or by button, based on the option). If they find a SET in the expanded table, the extra cards are discarded for the next turn. After a set is found on the expanded table the players continue the game with the cards remaining on the table.
Two types of hints are available (if enabled in the settings):
Asking the program if there is a valid SET on the current table
Asking the program to show a valid SET
If there's only one player, measure the time since the start of the game. In this case, the player is automatically selected (no need to tell the computer whose action is happening).
At the end of the game, the game should display who is the first, second, etc. player. A button should redirect the player to the settings.
When there is only one player, three things change:
The game should keep track of the time passed since the start of the game and show how long the player took to finish (you can display this as a timer during the game as well)
The player is automatically selected when declaring a SET (no need to tell the game who is taking an action)
There is no 10s time limit for SET selection.
Extra subtasks for bonus points
Add the following to the settings page:

the difficulty setting
a top scores list for one-player games with three card properties (starter difficulty)
a top scores list for one-player games with four card properties (advanced difficulty)
the results of the last 10 multiplayer games
The difficulty means how many properties of the cards are considered: 3 or 4. When playing with three properties, the SHADING property is not visible, all shapes are solid. For the easy mode, 3×3×3 = 27 cards are in a deck. In advanced mode, 4×4×4×4 = 81 cards are in a deck. By default, the advanced difficulty should be selected.

The program should keep three lists stored on local storage. These lists should appear on the settings page.

the 10 best times for one-player easy games (three properties, 27 cards)
the 10 best times for one-player advanced games (four properties, 81 cards)
the total scores for the last 10 multiplayer games.
The game page should be extended, so that at the end of a multiplayer game, the player should be asked if they awnt a rematch with the same players. If the rematch is selected, display the current scores (from the last game) and a scores total (for all the previous games with these players).

Help
Design is important. Your submission doesn't have to be really pretty and filled with frills, but it should look nice on a screen of at least 1024×768 pixels; the shapes on the cards should be centered and displayed in a recognisable size.
You can use minimalist design, custom CSS with extra graphical elements or a CSS framework.

There's no mandatory technology for displaying the game: you can use tables, divs, and canvas freely.

Criteria for function and presentation isn't set in stone, there's flexibility in the grading as long as your game is playable well and the tasks described above work in some way.

The shapes on cards can be created or displayed any way (canvas, inline svg, bacground pictures).

Breaking up the development into steps
First, create a HTML prototype for your application! This means that as a first step, you should design the settings panel with all of its options and the game in all of its states: how the cards are displayed, where can the players be selected, where are the scores, how do the extra three cards show up, etc. Try to create a style class for subtasks, for example: Selecting a card can be done bí giving it a yellow border or background. Create a class for this and apply it to the HTML elements in the code to see if it works and looks good.
Think about what data structures can be used to represent the subtasks!
How do you store the deck? Can you shuffle it, draw three cards, detect if it's empty?
How do you store the board, the 3×4 cards? Do you know what is where? If something is selected? Can you work with the selected ones? Can you decide if a SET is correct or not?
How do you store the players? Can you select one? Can you select one in a way that makes sure you cannot select another? Can you store the points awarded to each player?
How do you know if you are in game or on the settings page?
Think through all the ways the players can interact with your application: all the things they can select, click, and how you handle these. In other words, define your event handlers.
For a major subtask, we can't see everything for the first time. Use the steps above for subtasks as needed, e.g for scoring:

Display the scores as static HTML for all players.
Where do you store the points? At the players or separately? Which is more convenient?
Which events decrease, increase or show the scores?
You dont need to divide the HTML and CSS work to steps, you can design the whole interface in one go. However, when developing JavaScript, it's better to take small steps. Solve one thing at once, and make it near perfect!

Grading
The assignment is worth 20 points. There is a set of minimum requirements, without those, the assignment is not acceptable. The extra tasks are worth 5 points, so in total, you can get 25 points if you do everything.

Minimum requirements (6 points)
The README.md file from the Other requerements section is filled with your data and included with your solution (0 points)
The game page is displayed (0 points)
A deck of 27 cards consists of cards using a permutation of the three card properties, the deck is printed onto the console (1 points)
The first deal of 12 cards is displayed in a 3×4 arrangement (1 point)
Three cards can be selected (1 point)
After selecting three cards, the program decides if the SET is correct or not (1 point)
After a correct SET, the three cards are discarded and three new cards are drawn (1 points)
The game repeats until the deck runs out (0.5 points)
If the deck is empty and there is no SET on the table, the game ends. (0.5 points)
Further points
Base tasks (14 points)
The rules are accessible from the starting page (0.5 points)
The options are displayed on the starting page (0.5 points)
The name pf the players can be set, the number of fields matches the number of players, there is a default name for each player (0.5 points)
The player who is declaring a SET can be selected (1 point)
If playing a one-player game, the player is always selected (1 point)
When declaring a SET, a selected card can be unselected (1 point)
The timer of 10 seconds (during a player declaring a SET) works (1 point)
Declaring a correct SET gives the player a point (0.5 points)
Declaring an incorrect SET subtracts a point from the player (0.5 points)
The selection of players is working properly (e.g. after declaring, the selection gets reset, a player declaring an incorrect SET is disabled unil next turn) (1 point)
The Is there a SET? button displays according to the settings and works properly (1 point)
The Show me a SET button displays according to the settings and works properly (0.5 points)
The Plus three cards button displays according to the settings and works properly (1 points)
Drawing Plus three cards automatically when there's no SET works (1 point)
The scores are displayed during and after a game
No major errors, no way to cause weird bugs (0.5 points)
Nice, well-designed interaface (1 point)
Missing the deadline by a week (-3 points)
Missing the deadline by two weeks (-6 points)
Missing the deadline by more than two weeks (rejected assignment and no grade)
Bonus tasks (5 extra points)
The difficulty can be selected (3 or 4 properties, 27 or 81 cards) (0.5 points)
The 4-property mode is playable (1 point)
The scores are saved locally (0.5 points)
The settings page displays the one-player three-property toplist (0.5 points)
The settings page displays the one-player four-property toplist (0.5 points)
The settings page displays the results of the last 10 multiplayer games (0.5 points)
Rematch with the current players (1 point)
Current and total scores displayed during and after the game (0.5 points)
Other requirements
The assignment should be compressed into an archive containing all necessary files AND the README.md file in the root folder of the program, and uploaded to Canvas by the deadline.
You cannot use any external, third-party JavaScript libraries.
The README.md file has the following requirements:
You fill in your own data at the start of the file (marked by < > signs)
You mark all (partyally) finished subtasks with an x in place of the space between the square brackets [ ] in the file.
