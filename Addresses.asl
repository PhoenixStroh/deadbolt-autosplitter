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

    //0:Mission is not completed yet 1:Mission has been completed
    double missionCompleted: 0x39B1E8, 0x4, 0x410;

    //0:Not in scoreboard 1:In scoreboard
    int isScoreboard: 0x39AF04, 0x0, 0xB00, 0xC, 0xB4;

    //-1:When the "Choose Difficulty Options" is open 0:Normal Mode/Null value 1:Hard Mode 2: Back button
    double difficultyChosen: 0x39B1E8, 0x4, 0x70;

    //0:Normal Mode/Null value 1:Hard Mode 2: Back button
    double difficultySelect: 0x34E464, 0x520, 0xC, 0x4, 0x23E0;

    //Will detect every fadeout in the game. Values range from -0.5 (default, no fade) 0 (pause menu fade, halfway) 0.5 (full fade) 1.5 (?)
    double fadeout: 0x59D34C, 0x84, 0x4, 0x1BE0;
}