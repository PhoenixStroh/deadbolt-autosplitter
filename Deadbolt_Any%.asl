// ----------- NOTES ABOUT SPLIT --------------
// This Split has a few caveats:
// a.) The starting split is slightly slower then what you can click.
// b.) It will not split for the tutorial, so please do not include it as a split.
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
    //Prevent the timer from starting if the game is loading. If not, it can start freely
    if (vars.skippedFirstTimer == false && current.gameTimer != 0){
        vars.skippedFirstTimer = true;
        print("Skipped Timer");
    }
    else if (vars.skippedFirstTimer == false)
    {
        print("Delayed Skipping Timer");
    }
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