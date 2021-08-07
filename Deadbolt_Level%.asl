state("deadbolt_game","v1.0.2")
{
    double missionIndex: 0x39B1E8, 0x18, 0x578;

    double deathCount: 0x39B1E8, 0x4, 0x380;
    
    //When the scoreboard is open
    int isScoreboard: 0x39AF04, 0x0, 0xB00, 0xC, 0xB4;
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
    settings.Add("resetOnDeath", true, "Reset on Death");
    settings.SetToolTip("resetOnDeath", "If enabled, will reset if the player dies.");
    settings.Add("resetOnLeave", true, "Reset when Leaving Mission");
    settings.SetToolTip("resetOnLeave", "If enabled, will reset if the player leaves a mission.");
}

start
{
    if (old.missionIndex == -1 && current.missionIndex != -1)
    {
        return true;
    }
    if (settings["resetOnDeath"] && old.deathCount < current.deathCount)
    {
        return true;
    }
}

split
{
    if (old.isScoreboard == 0 && current.isScoreboard == 1)
    {
        return true;
    }
}

reset
{
    if (settings["resetOnLeave"] && old.missionIndex != -1 && current.missionIndex == -1)
    {
        return true;
    }
    if (settings["resetOnDeath"] && old.deathCount < current.deathCount)
    {
        return true;
    }
}