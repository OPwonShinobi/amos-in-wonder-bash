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
