state("deadbolt_game")
{
    //SplashMenu:125 Home:99 Tutorial:119 
    //NoisyNeighbor:107 NewHigh:105 SmokeSignals:107 Puff:103 FollowHounds:127 Bogeyman:119 Vacancy:105 Supply&Demand:109 Roland:117
    //NightOut:113 LuxInTenebris:129 BloodyMary:109 BottleService:121 Amber&Evelen:113 ALotToGive:117 SirStela:125 ForcedConvo:129 MadamStela:121
    //OvernightShipping:119 StructurallySound:115 BarHopping:117 HorrowShow:125 TimurTinkerer:119 DriverThru:95 AsAGlass:97 Vall:117 
    //Ibzan(a):115 Ibzan(b):123 "LastSleep"/Cutscene:-1
    double levelNumber: 0x39B1E8, 0x18, 0x9C8;
    
    //411:Home 412-Anything Else
    int isHome: 0x0A3C2C, 0x330;

    //The timer displayed in game, recorded in seconds
    //Does not reset between game sessions, only between loads themselves.
    double gameTimer: 0x39B1E8, 0x4, 0x130;

    //0:Not in anything 1:In either chair or picking up sniper rifle
    double inChair: 0x39B1E8, 0x4, 0x540;

    //The final chair the player enters, this value with change to a new value
    //Not entirely sure if it always goes to a new value or not.
    int endGameChair: 0x5A9320, 0x0, 0xAD8;
}