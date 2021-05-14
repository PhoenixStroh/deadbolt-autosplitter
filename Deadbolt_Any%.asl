state("deadbolt_game","v1.0.2")
{
    //0:rInit 1:rm_logo 2:rm_main 3:rm_load 4:rm_ng 5:rm_load_custom 6:rm_mission 7:rm_apt 8:rm_credits 9:rm_dock 10:rm_stats 11:rm_pause 12:rm_ingame
    int SceneIndex : 0x59D310;

    //The level index 1-9, within each "region"
    double levelIndex: 0x39B1E8, 0x18, 0xA18;

    //The player is in animation for the chair, and the sniper rifle
    double playerSittingOrSniping: 0x39B1E8, 0x4, 0x540;

    //When the scoreboard is open
    int isScoreboard: 0x39AF04, 0x0, 0xB00, 0xC, 0xB4;

    //Which choice you click on in the "New Game" tab
    double choseDifficulty: 0x59D374, 0x10, 0x84, 0x4, 0x23F0;
}

init
{
    if (modules.First().ModuleMemorySize == 6234112)
    {
        version = "v1.0.2";       
    }
}

update
{
    if (version == "")
    {
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
    if (settings["splitLastChair"] && current.SceneIndex == 12 && current.levelIndex == 9 && current.playerSittingOrSniping == 1 && old.playerSittingOrSniping == 0)
    {
        return true;
    }
    //Split for Scoreboard
    if (settings["splitScoreboard"] && current.isScoreboard == 1 && old.isScoreboard == 0)
    {
        return true;
    }
}