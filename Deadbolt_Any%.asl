// ----------- NOTES ABOUT SPLIT --------------
// This Autsplitter has a few caveats:
// a.) The starting split is slightly slower than what you can click.
// b.) If you exit the level while the level's mission has been completed, it will split.

state("deadbolt_game")
{
    //Used to identify the specific level currently running (some levels share ID's)
    double levelNumber: 0x39B1E8, 0x18, 0x9C8;

    //The timer displayed in game, recorded in seconds
    double gameTimer: 0x39B1E8, 0x4, 0x130;

    //The final chair the player enters, this value with change to a new value
    int endGameChair: 0x5A9320, 0x0, 0xAD8;

    //The mission requirement for each level, between 0 or 1
    double missionCompleted: 0x39B1E8, 0x4, 0x410;

    //0:Not in scoreboard 1:In scoreboard
    int isScoreboard: 0x39AF04, 0x0, 0xB00, 0xC, 0xB4;
}

init
{
    vars.skippedFirstTimer = false;
    vars.missionCompletedHolder = false;
}

startup
{
    //settings.Add("autoReset", false, "Auto Reset");
    //settings.SetToolTip("autoReset", "If enabled, will automatically reset when exiting to Main Menu.");

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
    if (current.isScoreboard == 1 && old.isScoreboard == 0)
    {
        return true;
    }
}