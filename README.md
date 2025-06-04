# BREAKOUT #

Old QuickBASIC / QBasic Breakout clone.

I originally wrote this in the early 2000's when I was first getting into programming. TI83 Basic and QuickBASIC were my entry into programming, and this was one of the first things I coded.

I have re-organized and cleaned up the code, and updated for QB64 compatibility. While the core logic for the breakout game is mostly still all the original code and logic, and retains the ability to compile / run using original hardware and QB45 software tools, I wrote a bit more logic to make the game fully playable ("levels", lives, game over, etc).

## How To Play ##

Bounce the ball off the paddle into the bricks to break them.

- **ESC** - Quit the game
- **Space** - Fire the ball off the paddle
- **Left Arrow** - Move paddle left
- **Right Arrow** - Move paddle right
- **R** - Reset on Game OVer

## Building ##

### Using QB64PE

#### Setup ####

- Install QB64PE (https://www.qb64phoenix.com) or QB64 (https://qb64.com)
- Add the QB64PE or QB64 installation directory to the system PATH
  - Command must be on the PATH, no fallback installation locations will be searched

#### Compile ####

Run the included build script to compile
- Windows `bin\build-qb64.bat`
- Linux `./bin/build-qb64.sh`

### Using DOSBox ###

#### Setup ####

- Install DOSBox-x (https://dosbox-x.com) or DOSBox (https://www.dosbox.com)
- Add the DOSBox-x or DOSBox installation directory to the system PATH
  - On Windows, if a command is not found, scripts will search common fallback installation locations
    1. Looks for dosbox-x command
    2. Looks for dosbox-x fallback installation location
    3. Looks for dosbox command
    4. Looks for dosbox fallback installation location
  - On Linux, no fallback installation locations will be searched
    - Looks for dosbox-x command
    - Looks for dosbox command if dosbox-x command was not found
- Install QuickBASIC 4.5 (Must obtain software)
  - Windows
    - Place files at C:\DOS\qb45
  - Linux
    - Place files at ~/DOS/qb45

#### Compile ####

Run the included build script to compile
- Windows `bin\build-dosbox.bat`
- Linux `./bin/build.sh`

### Original Hardware / Software

If you are using original hardware / software and have QB available, you can open the source in QB and/or compile using BC and LINK manually.

- `BC /O /T BREAKOUT.BAS,BUILD\BREAKOUT.OBJ;`
- `BC /O /T INC\MULTIKEY.BAS,BUILD\MULTIKEY.OBJ;`
- `LINK BUILD\BREAKOUT.OBJ+BUILD\MULTIKEY.OBJ,BUILD\BREAKOUT.EXE;`