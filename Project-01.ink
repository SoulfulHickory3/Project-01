/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!
*/

VAR Caffeine = 0
VAR Name = ""
VAR Password = ""
VAR time = -1

Which path do you choose to play?

*[In the past.] -> Prologue
*[In the future.] -> seashore

== Prologue ==
While the personnel elevator slowly lowers to the next floor, you try to remember which staff member's profile you need to log in to. Which one was it...
* [Peter Markson]
~ Name = "Peter Markson"
~ Password = "UNLFD4LIFE"
-> Elevator
* [Guillaume Garnier]
~ Name = "Guillaume Garnier"
~ Password = "GGarnier1914"
-> Elevator
* [Arthur Liu]
~ Name = "Arthur Liu"
~ Password = "Hong_Kongian"
-> Elevator

== Elevator ==
Right, it must've been {Name}, that pompous idiot who started all this.
You have just stepped off the elevator to the lobby of the communications floor. A few seconds later, klaxons nearby sound an alarm for a moment, indicating the lockdown has restricted the elevator. {not Desk:The center help desk, while empty, still might have something that could point you to a functioning computer that could send a signal. }Aside from that, you can go down the East or West halls.
+[Take the East hall.] -> East_Hall
+[Take the West hall.] -> West_Hall
*[Inspect the desk.] -> Desk

== Desk ==
Upon inspecting the contents of the desk, you find a paper labeled "MAP". It seems that in the Northeast corner of the East hall, there is the computer setup you need. You stash the map in your pocket.
*[Return to the lobby.] -> Elevator
-> END

== East_Hall ==
You go down the East hall, filled with small office cubicles. Each one has a computer. Only a few have power. It would be terrible to inspect each cubicle for the computer you need...

+ {Desk} [Refer to the map.] -> East_Hall_Map
+ {Caffeine >= 1} [Caffeine-fuelled search!] -> East_Hall_Coffee
+ [Return to the lobby.] -> Elevator
-> END

== West_Hall ==
You go down the West hall, leading to the cafeteria. No computers here.
{Name == "Peter Markson": A big shot like Markson was always the first to get a serving during lunch.| }
{Name == "Guillaume Garnier": Director Garnier would always get food at the tail end of each meal time.| }
{Name == "Arthur Liu": Doctor Liu was never seen getting food from here, somehow. Must've subsisted on vending machines.| }
{not Cafeteria: Maybe something to drink?}
* [Look around for something to drink.] -> Cafeteria
* [Return to the lobby.] -> Elevator
-> END

== East_Hall_Map ==
Good thing you have that map. The computer you need is in the Northeast corner. You find it quickly.
-> Terminal

== East_Hall_Coffee ==
Who needs a directory when you have the energy to go through all the cubicles in a minute? Soon enough, you find the computer you need in the Northeast corner.
-> Terminal

== Cafeteria ==
After a minute of looking around the booths and tables of the cafeteria, you find a can of coffee. It's a new thing introduced to the menu. Since you're in a hurry, you drink about half of the can and immediately feel energized.
~ Caffeine = Caffeine + 1
+ [Nah, let's go all the way.] -> Chug
+ [Return to the lobby.] ->Elevator

== Chug ==
Screw it. You chug down the rest of the coffee, and feel even more energized. You're so jumpy, you could detect the sound of a pin dropping.
~ Caffeine = Caffeine + 1
+ [Retun to the lobby.] -> Elevator

== Terminal ==
You remember being told by Ramis that you need to log into {Name}'s profile. You don't remember being told what his password was. Guessing based on his personality, it might be something like...
* {Password == "UNLFD4LIFE"} [UNLFD4LIFE] -> Hong_Kongian
* {Password == "GGarnier1914"} [GGarnier1914] -> Hong_Kongian
* {Password == "Hong_Kongian"} [Hong_Kongian] -> Hong_Kongian
->END

== Hong_Kongian ==
The computer flashes "PASSWORD ACCEPTED" and brings up a new screen.
-> Option_menu

== Option_menu ==
There are multiple options, but you know the one you need right now.
+ [Click on "ACCESS FILES".] -> Files
+ [Click on "INTRAMAIL".] -> Intramail
+ [Click on "LOCKDOWN CONTROLS".] -> Lockdown
+ [Click on "BROADCAST DISTRESS SIGNAL".] -> Signal
->END

== Files ==
This option brings up a database of hundreds of Found Objects, personnel files, and more. However juicy all that knowledge may be, it's not important right now.
+ [Return to the menu.] -> Option_menu

== Intramail ==
This option brings up all the sent and inbound electronic messages for Dr. Liu, that scummy egghead. If you and him make it out of this alive, you could blackmail him with some of this...
+ [Return to the menu.] -> Option_menu

== Lockdown ==
This option brings up a screen saying "THIS TERMINAL DOES NOT HAVE CLEARANCE TO ACCESS THIS OPTION."
Damn.
+ [Return to the menu.] -> Option_menu

== Signal ==
This option brings up a screen with the warning: "ARE YOU SURE? THIS WILL RESULT IN FURTHER ACTION FROM UNLFD HIGHER UPS, AND CANNOT BE CANCELLED ONCE STARTED."
+ [YES_] -> Yes
+ [NO_] -> No
+ {Caffeine > 0} [Yes, but wait...] -> Yes_coffee
->END

== No ==
For some reason, you don't think you should activate the distress signal.
You hear shuffling behind you, and before you can even turn around, you're shot in the back of the head.
RIP
->END

== Yes ==
You click yes. The screen displays "SIGNAL BROADCASTING. PLEASE MAKE YOUR WAY TO ANY EMERGENCY SHELTER."
Suddenly, you're shot in the back by something. Your blood spatters over the computer screen as you tumble to the floor.
From your position, you can see your killer: A beige-colored, humanoid figure in a purple jumpsuit. It's armed with security-issue 9mm pistol. It has cameras for eyes, and moves like an animatronic from Disney Land.
Standing above you, it raises its pistol, aiming at your head. Closing your eyes, you die knowing you've saved someone else, at least.
RIP
->END

== Yes_coffee ==
You quickly press the enter key, signifying "YES". You don't see what pops up after, though, because your caffeine senses have alerted you to some movement behind you! You quickly turn around and charge at whatever was going to get the drop on you.
* [Continue.] -> Secret_ending
-> END

== Secret_ending ==
The figure you tackled hits a sharp corner of a cubicle in the neck, knocking it dead. It's one of those mannequins that have gone haywire! If you hadn't been blitzed on coffee, it could've hurt you!
* [What now?] -> Secret_ending_2
-> END

== Secret_ending_2 ==
You think for a moment before remembering: the band room to the south of the lobby! That giant soundproof recording booth would be a good place to hide.
You run over to there, barricade youself in, and hunker down with some snacks. Help should be on the way.
END
-> END

== seashore ==
You are standing around on the coast.

Your watch says it's {advance_time()}.

+ {time == 2} [Check on the village.] -> village
+ [Stroll down the coast.] -> beach2
-> DONE

== beach2 ==
This is further down the coast.
* {time == 1} [Look for some seashells.] -> shells
+ [Stroll back up the coast.] -> seashore

== shells ==
You pick up the shells.
-> beach2

== village ==
Just as before, the portal machine is off. There isn't much else to do around here.
+ [Check around the village houses.] -> village2
+ [Stroll back up the coast.] -> seashore

== village2 ==
Yet again, nothing. But there IS the Department outpost...
Your watch says it's {advance_time()}.
+ [Investigate the outpost.] -> outpost
+ [Return to the village.] -> village

== outpost ==
You approach the door to the outpost -- a building shaped like a large pizza box balanced on top of a slightly smaller one, and lined with windows.
As you approach the door, you see a sign stating: "DOORS ARE SEALED UNTIL 12:00 HOURS FOR SHIFT CHANGE".
Your watch says it's {&morning|noon|night}.
+ {time == 1} [Enter the outpost.] -> interior
+ {time != 1} [Wait around until noon.] -> wait

== wait ==
You stroll around the perimeter of the outpost for a while, taking in whatever view there is until noon.
~ time = 1
-> outpost

== interior ==
The door is unlocked, so you open it and enter. The air conditioning that hits you right there is so relieving, you decide to find a chair and take a load off.
-> END

== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "morning"
        
        - time == 1:
            ~ return "noon"
        
        - time == 2:
            ~ return "night"
    }
    
    ~ return time
    