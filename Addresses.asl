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

    //Not tested
    double difficultyChosen: 0x39B1E8, 0x4, 0x70;

    //Not tested
    double difficultySelect: 0x34E464, 0x520, 0xC, 0x4, 0x23E0;

    //Discoverable Addresses

    
    //gml_Object_oPControl_Step_2
    /*
    if (!global.stage_cleared)
    {
        switch global.objective
        {
            case 8:
                global.quest = "Find the &b&sniper rifle.&!&"
                break
            case 7:
                global.quest = "Destroy all &b&ash totems.&!&"
                all_burnt = 1
                with (oTotem1)
                {
                    if (active == 0)
                        all_burnt = 0
                }
                if all_burnt
                    advance_mission()
                break
            case 6:
                global.quest = "Kill all &r&targets.&!&"
                if (instance_number(oTarget) == 0)
                    advance_mission()
                else if (instance_number(oTarget) == 1)
                {
                    if (oTarget.parent != noone)
                        global.quest = (("Kill &r&" + oTarget.parent.name) + "&!&")
                }
                else
                    global.quest = (("Kill the &r&backup (" + string(instance_number(oTarget))) + ")&!&")
                break
            case 5:
                if (instance_number(oTarget) == 0 && instance_number(oKeycard) == 0)
                    advance_mission()
                else
                    global.quest = "Collect &b&keycards&!&"
                break
            case 4:
                global.quest = "Find &b&information.&!&"
                if (global.mission_var == 1)
                    advance_mission()
                break
            case 3:
                global.quest = "Kill all &r&targets.&!&"
                if (instance_number(oTarget) == 0)
                    advance_mission()
                else if (instance_number(oTarget) == 1)
                {
                    if (oTarget.parent != noone)
                        global.quest = (("Kill &r&" + oTarget.parent.name) + "&!&")
                }
                else
                    global.quest = (("Kill the &r&remaining targets (" + string(instance_number(oTarget))) + ")&!&")
                break
            case 0:
                global.quest = "Kill all &r&undead.&!&"
                if ((instance_number(pEnemy) + instance_number(oVamp3Gem)) == 0)
                    advance_mission()
                break
            case 2:
                global.quest = "Destroy all &b&ash caches.&!&"
                all_burnt = 1
                with (oCokeBurn)
                {
                    if (active == 0)
                        all_burnt = 0
                }
                if all_burnt
                    advance_mission()
                break
            case 1:
                global.quest = "Find the &b&drugs.&!&"
                all_found = 1
                with (oCokeInspect)
                {
                    if (active != 2)
                        all_found = 0
                }
                if all_found
                    advance_mission()
                break
    */
}