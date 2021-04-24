state("deadbolt_game")
{
    //SplashMenu:125 Home:99 Tutorial:119 
    //NoisyNeighbor:107 NewHigh:105 SmokeSignals:107 Puff:103 FollowHounds:127 Bogeyman:119 Vacancy:105 Supply&Demand:109 Roland:117
    //NightOut:113 LuxInTenebris:129 BloodyMary:109 BottleService:121 Amber&Evelen:113 ALotToGive:117 SirStela:125 ForcedConvo:129 MadamStela:121
    //OvernightShipping:119 StructurallySound:115 BarHopping:117 HorrowShow:125 TimurTinkerer:119 DriverThru:95 AsAGlass:97 Vall:117 Ibzan(a):115 Ibzan(b):123
    double levelNumber: 0x39B1E8, 0x18, 0x9C8;
    //411:Home 412-Anything Else
    int endMission: 0x0A3C2C, 0x330;

    double gameTimer: 0x39B1E8, 0x4, 0x130;

    //0:Not in anything 1:In either chair or picking up sniper rifle
    double inChair: 0x39B1E8, 0x4, 0x540;
}

update
{
    //print("InChair: " + current.inChair);
}

startup
{
    vars.timerStart = (EventHandler) ((s, e) =>
    {
        print("Start Timer");
        vars.skippedFirst = false;
    });
    timer.OnStart += vars.timerStart;
}

shutdown
{
    timer.OnStart -= vars.timerStart;  
}

start
{
    //Will trigger prematurally when loading the game
    if (current.gameTimer == 1)
    {
        return true;
    }
}

split
{
    if (current.levelNumber == 123 && current.inChair == 1)
    {
        return true;
    }
    if (vars.skippedFirst == false && current.levelNumber != old.levelNumber && current.levelNumber == 99)
    {
        print("Skipped!");
        vars.skippedFirst = true;
    }
    else if (current.levelNumber != old.levelNumber && current.levelNumber == 99)
    {
        print("At Home");
        return true;
    }
}