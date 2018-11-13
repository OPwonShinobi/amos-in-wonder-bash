A test project for me to practise bash and linux scripting, similar to the batch version of the game. The source material was a choose-your-own-adventure parody of Alice in Wonderland me and some friends wrote back in high school for our chem class.

How to run
----------
Run start.sh in a terminal. Enter letters when prompted to proceed in the scenes. This was tested and should run fine on Ubuntu (including the Windows Subsystem version). 

Project layout
--------------
The control modules (start, end, and middle.bat) can be easily reused for another project.
They are more or less the same with minor differences:

start.sh is the only file that can be opened directly, the other ones will close if directly opened to avoid undefined behaviour (also skipping to a certain point in the story is just bad story telling).

> ./txt
	This folder stores the scenarios and story layout. The story 
	letter : this stores that scenario's text
	letterC :  this stores the scenario's next possible paths

> start.sh
	Run this script to start the game. loads the first scene.

> middle.sh
	Loads every scene (not endings) after the first.

> end.sh
	Handles ending scenes.

Differences Between The Bash and Batch Versions
-----------------------------------------------
The first version of the choose-your-own-adventure script I wrote, Amos In Wonder Batch, runs on Windows 7+ in Batch script. As Windows Photo Viewer(rundll32.exe) comes default on Windows 7+, I could include it in my script and expect images to work. 

I had some trouble with images in Linux, especially since I started writing this on the Linux Subsystem for Windows, and almost all unix gui applications wouldn't work. Since they weren't a major part of the game, I took out images for this version (they were even optional in the windows version, you could turn them off).

Gnome-terminal and xdg-open wouldn't work properly in the subsystem either, so I couldn't find a way to force maximize / reposition / close new windows easily, like I could using cmdow in batch. So this version's terminal looks arguably worse. 

So, this bash version is closer to a genuine text-adventure, while the batch version is closer to the mixed-media abomination me and friends wrote in high school. 