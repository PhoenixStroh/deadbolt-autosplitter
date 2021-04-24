// ----------- NOTES ABOUT SPLIT --------------
// This Split will/can break in a few ways
// a.) It will split if the livesplit is running before you start the game
// b.) If you have the tutorial as a split, it will not split for the tutorial.
// c.) I cannot guarentee that it will split for the last chair given that the address used doesn't switch between two values,
// but rather generates a new, completely different value each time. I'm not sure if this means that the value can be chance switch to the same value.

state("deadbolt_game")
{
    //Used to identify the specific level currently running (some levels share ID's)
    double levelNumber: 0x39B1E8, 0x18, 0x9C8;

    //The timer displayed in game, recorded in seconds
    double gameTimer: 0x39B1E8, 0x4, 0x130;

    //The final chair the player enters, this value with change to a new value
    int endGameChair: 0x5A9320, 0x0, 0xAD8;
}

init
{
    vars.skippedFirstTimer = false;
}

startup
{
    //This will connect the method below to every time the time is started
    vars.timerStart = (EventHandler) ((s, e) =>
    {
        print("Start Timer");
        vars.skippedFirstTutorial = false;
    });
    timer.OnStart += vars.timerStart;
}

shutdown
{
    timer.OnStart -= vars.timerStart;  
}

start
{
    if (vars.skippedFirstTimer == false){
        print("Skipped Timer");
    }
    //Will trigger prematurally when loading the game
    else if (current.gameTimer == 0)
    {
        return true;
    }
}

split
{
    //Split for End Game Chair
    if (current.levelNumber == 123 && current.endGameChair != old.endGameChair)
    {
        return true;
    }
    //Skip the first split (the tutorial level)
    if (vars.skippedFirstTutorial == false && current.levelNumber != old.levelNumber && current.levelNumber == 99)
    {
        print("Skipped Tutorial Split");
        vars.skippedFirstTutorial = true;
    }
    //Split when returning to home
    else if (current.levelNumber != old.levelNumber && current.levelNumber == 99)
    {
        print("At Home");
        return true;
    }
}