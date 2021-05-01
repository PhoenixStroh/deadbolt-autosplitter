// ----------- NOTES ABOUT SPLIT --------------
// This Autsplitter has a few caveats:
// a.) The starting split is slightly slower than what you can click.

state("deadbolt_game")
{
    //Used to identify the specific level currently running (some levels share ID's)
    double levelNumber: 0x39B1E8, 0x18, 0x9C8;

    //The final chair the player enters, this value with change to a new value
    int endGameChair: 0x5A9320, 0x0, 0xAD8;

    //The mission requirement for each level, between 0 or 1
    double missionCompleted: 0x39B1E8, 0x4, 0x410;

    //0:Not in scoreboard 1:In scoreboard
    int isScoreboard: 0x39AF04, 0x0, 0xB00, 0xC, 0xB4;

    //Not tested
    double difficultySelect: 0x34E464, 0x520, 0xC, 0x4, 0x23E0;

    //Not tested
    double fadeout: 0x59D34C, 0x84, 0x4, 0x1BE0;
}

update
{
    print("Difficulty Select: " + current.difficultySelect);
    print("Fadeout: " + current.fadeout);
}

startup
{
    //settings.Add("autoReset", false, "Auto Reset");
    //settings.SetToolTip("autoReset", "If enabled, will automatically reset when exiting to Main Menu.");
}

start
{

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