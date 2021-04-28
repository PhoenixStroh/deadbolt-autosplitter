// ----------- NOTES ABOUT SPLIT --------------
// This Autsplitter has a few caveats:
// a.) The starting split is slightly slower then what you can click.
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
}

init
{
    vars.skippedFirstTimer = false;
    vars.missionCompletedHolder = false;
}

startup
{
    //Add Settings for Player
    settings.Add("skipTutorial", true, "Skip Tutorial");
    settings.SetToolTip("skipTutorial", "If enabled, will split when exiting the tutorial.");
    settings.Add("completeMissionSafety", true, "Complete Mission Safetyguard");
    settings.SetToolTip("completeMissionSafety", "If enabled, will not split if the current mission has not been completed");
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
    //Will updated missionCompleted when you return home
    if (current.missionCompleted == 1 && vars.missionCompletedHolder == false)
    {
        vars.missionCompletedHolder = true;
    }
    else if (settings["completeMissionSafety"] == false){
        vars.missionCompletedHolder = true;
    }

    //Split for End Game Chair
    if (current.levelNumber == 123 && current.endGameChair != old.endGameChair)
    {
        return true;
    }
    //Skip the first split (the tutorial level)
    if (settings["skipTutorial"] == true && vars.skippedFirstTutorial == false && current.levelNumber != old.levelNumber && current.levelNumber == 99)
    {
        print("Skipped Tutorial Split");
        vars.skippedFirstTutorial = true;
    }
    //Split when returning to home
    else if (vars.missionCompletedHolder == true && current.levelNumber != old.levelNumber && current.levelNumber == 99)
    {
        print("At Home");
        vars.missionCompletedHolder = false;
        return true;
    }
}