# Puny Gods
Lazy git repo for my CSU 2025 Game Jam submission, Puny Gods. Compiled with GameMaker Runtime 2024.11.0.226. I like to live dangerously! (not check things into version control)

If you don't want to compile the game yourself, you can play it [here](https://hoppological.itch.io/puny-gods).

## Project Retrospective
I've fancied myself a coder for a good long while but have never really released anything I'd consider of substance, or that I could be proud of. A lot of my project development over the last year or two has been monolith stuff that has gone nowhere that I really have nothing to show for. Essentially, I got burnt out. Part of my reasoning for joining the CSU Game Developers Club and participating in this Game Jam was to let me learn my limits when I'm faced with a practical, real-world situation (having to do something under a deadline with some kind of restriction) instead of just being left to my own devices.

When the club voted on the "Mythology" theme, I spent a little while drafting ideas until I came to draw on my Christian faith background; the Archangel Michael, hearing God was made fun of at the annual Pagan Halloween party, decides to break down the door and punch everybody in the face with holy magic for disrespecting his guy. A funny concept, I wish I could've kept with it, but as I got into the project it felt too ambitious and it was eventually scaled down to an inexplicably armless Roman soldier toy beating up drawings of pagan gods with abstract red balls.

The final product is pretty rushed and probably not that fun; I had to balance a busy college midterm week and the game, on top of other normal life obligations. The actual in-project time is something around 14 hours, which is very low. However, for 14 hours, I'd say this is quite good! It may not be a good game, but I'm really happy with how things turned out, even if the codebase is completely unusable. That's just how it goes in Game Jams, I guess. I think I might have to spin out more of these itty bitty projects in the future on my own time, it was fun!

### Things I Like
* I'm happy with the aesthetic I settled on. It gives the game a charming low-rent feel and is a good excuse for why things aren't animated. :P
* The little roman soldier with the key is adorable. I wish I could've given him arms, though...
* I think there is real potential for something like a mobile arcade game or whatever, it just needs more fleshing out. Probably needs a bigger level, too.

### Things I'd Go Back On
* The algorithm for spawning new Molochs is very basic, rushed, and copy-paste happy. I just didn't have time to do it right. I think it sometimes results in a fresh Moloch spawning over an existing one.
* I would've liked at least one more enemy; maybe a "passive" one that makes certain platforms unsafe at certain times, to encourage movement.
* There is a giant uncompressed 2000x2000 JPG of a cardboard box that makes up the background of the playspace. I did this out of panic and I think it's the reason the final binary is 12MB or so uncompressed. Sorry.

### Things I Wanted To Do
* Originally, with different weapons, the player's hands would have changed to be holding it; the harmonic weapon would be a harp, the "punch" would be a sword, the Big Bang would be a...uh, something, I guess. This is why the player is armless in the final game; I ran out of time to arm him!
* Not implementing other weapons was a huge missed opportunity. You can still find their definitions in the project (see: PlayerPunch, PlayerHarmonic, PlayerBigBang) but I ran out of time to implement them. Originally they would've spawned at the center, which in theory would've encouraged the player to keep moving and out of the center if they saw a weapon they didn't like. However, since there's nothing in the center, the player basically has free reign over all the enemies since they're at the safest possible position and distance from them. I should have at least placed a Moloch spawn point there.
  * For boring reasons, it's really, really annoying and difficult to do timed events in GameMaker, i.e the kind of thing I would have done to spawn new weapon pickups. There is no Thread.sleep() or wait() or whatever, so your only choice for making events run at a certain time is either alarms (a hardcoded 1D array of values that count down) or Time Sources (basically the same thing, but not tied to an event, not garbage collected automatically, and annoying to setup.) 
* I'm aware this is statistically impossible for something like a short jam project, but the code quality is exceedingly poor; this entire game is basically unworkable! There are only like two code comments and one of them is me swearing at myself for having do a hack because I screwed up an inheritance chain I didn't have time to fix. Maybe I should plan technologically as well as thematically next time?
* NO JUICE!!!! WHERE'S THE JUICE?????? AAAGHHHH!!!!

