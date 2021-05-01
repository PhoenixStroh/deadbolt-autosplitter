state("deadbolt_game","v1.0.2")
{
    //Used to identify the specific level currently running (some levels share ID's)
    double levelNumber: 0x39B1E8, 0x18, 0x9C8;

    //The final chair the player enters, this value with change to a new value
    int endGameChair: 0x5A9320, 0x0, 0xAD8;

    //When the scoreboard is open
    int isScoreboard: 0x39AF04, 0x0, 0xB00, 0xC, 0xB4;

    //Which choice you click on in the "New Game" tab
    double choseDifficulty: 0x34E464, 0x520, 0xC, 0x4, 0x23F0;
}

init
{
    if (modules.First().ModuleMemorySize == 6234112)
    {
        print("FOUND VERSION: " + modules.First().ModuleMemorySize);
        version = "v1.0.2";       
    }
}

update
{
    if (version == "")
    {
        print("FAILED TO FIND VERSION: " + modules.First().ModuleMemorySize);
        return false;
    }
}

startup
{
    settings.Add("splitScoreboard", true, "Split on Scoreboard");
    settings.SetToolTip("splitScoreboard", "If enabled, will split every time the scoreboard appears.");
    settings.Add("splitLastChair", true, "Split on Last Chair");
    settings.SetToolTip("splitLastChair", "If enabled, will split after sitting on the final chair.");
}

start
{
    //If you are in the "New Game" tab, and you click on either normal or hard mode
    if (old.choseDifficulty == -1 && (current.choseDifficulty == 0 || current.choseDifficulty == 1))
    {
        return true;
    }
}

split
{

    //Split for End Game Chair
    if (settings["splitLastChair"] && current.levelNumber == 123 && current.endGameChair != old.endGameChair)
    {
        return true;
    }
    //Split for Scoreboard
    if (settings["splitScoreboard"] && current.isScoreboard == 1 && old.isScoreboard == 0)
    {
        return true;
    }
}