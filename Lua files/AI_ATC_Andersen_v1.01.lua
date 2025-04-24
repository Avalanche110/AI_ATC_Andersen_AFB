-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************AIRBASE_ATC*****************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AI_ATC = {}

_SETTINGS:SetPlayerMenuOff()

AI_ATC.Airstart = false

AI_ATC.CrewChief = false

AI_ATC.ParentMenu = MENU_MISSION:New("ATC")

--AI_ATC.Environment = "Local"
AI_ATC.Environment = "Online"
AI_ATC.SoundPath = "C:\\Users\\Administrator\\Saved Games\\"
AI_ATC.SRS_Path = "C:\\Program Files\\DCS-SimpleRadio-Standalone"
AI_ATC.SRSPort = 5002

AI_ATC.ATIS = {}
AI_ATC.Ground = {}
AI_ATC.Clearance = {}
AI_ATC.Tower = {}
AI_ATC.Departure = {}
AI_ATC.Approach = {}

AI_ATC.TimeStamp = function()timer.getTime()end

AI_ATC.CustomCallsigns = {}
AI_ATC.FlightGroup = {}

AI_ATC.Coalition = "blue"
AI_ATC.Airbase = "Andersen"
AI_ATC.AirbaseID = AIRBASE.MarianaIslands.Andersen_AFB
AI_ATC_Airbase = AIRBASE:FindByName("Andersen AFB")

AI_ATC.Runways = { Takeoff = nil, TakeoffZone = nil, Landing = nil, LandingZone = nil, HoldShort = nil, TakeoffClearance = false }
  
AI_ATC.MissionStart = UTILS.SecondsOfToday()

AI_ATC.Radio = {
  ["ATIS"] = {      Key = "ATIS",      UHF = 254.325, VHF = 118.175, UserFreq = "UHF", Transmitter = "Andersen_ATIS" },
  ["Ground"] = {    Key = "Ground",    UHF = 275.8,   VHF = 121.7,   UserFreq = "UHF", Transmitter = "Andersen_Ground" },
  ["Clearance"] = { Key = "Clearance", UHF = 256.7,   VHF = 126.725, UserFreq = "UHF", Transmitter = "Andersen_Clearance" },
  ["Tower"] = {     Key = "Ground",    UHF = 233.7,   VHF = 126.2,   UserFreq = "UHF", Transmitter = "Andersen_Tower" },
  ["Departure"] = { Key = "Departure", UHF = 239.3,   VHF = 120.5,   UserFreq = "UHF", Transmitter = "Andersen_Departure" },
  ["Approach"] = {  Key = "Departure", UHF = 239.3,   VHF = 120.5,   UserFreq = "UHF", Transmitter = "Andersen_Approach" },
  }

AI_ATC.Procedure = "IFR"
AI_ATC.Approach.PatternAltitude = "5"

AI_ATC.TaxiWay = {
  ["Alpha"] = {Zone = TAXIWAY_ALPHA},
  ["Bravo"] = {Zone = TAXIWAY_BRAVO},
  ["Charlie"] = {Zone = TAXIWAY_CHARLIE},
  ["Delta"] = {Zone = TAXIWAY_DELTA},
  ["Echo"] = {Zone = TAXIWAY_ECHO},
  ["Foxtrot"] = {Zone = TAXIWAY_FOXTROT},
  ["Golf"] = {Zone = TAXIWAY_GOLF},
  ["Hotel"] = {Zone = TAXIWAY_HOTEL},
  ["Juliet"] = {Zone = TAXIWAY_JULIET},
  ["Kilo"] = {Zone = TAXIWAY_KILO},
}
  

AI_ATC_SoundFiles = {}
AI_ATC_SoundFiles.ATIS = {}
AI_ATC_SoundFiles.Ground = {}
AI_ATC_SoundFiles.Clearance = {}
AI_ATC_SoundFiles.Departure = {}
AI_ATC_SoundFiles.RangeControl = {}

AI_ATC_SoundFiles.ATIS.Numerical = {
  ["."] = { filename = "ATIS_Decimal.ogg", duration = 0.627 },
  ["0"] = { filename = "ATIS_0.ogg", duration = 0.627 },
  ["1"] = { filename = "ATIS_1.ogg", duration = 0.432 },
  ["2"] = { filename = "ATIS_2.ogg", duration = 0.444 },
  ["3"] = { filename = "ATIS_3.ogg", duration = 0.496 },
  ["4"] = { filename = "ATIS_4.ogg", duration = 0.506 },
  ["5"] = { filename = "ATIS_5.ogg", duration = 0.534 },
  ["6"] = { filename = "ATIS_6.ogg", duration = 0.582 },
  ["7"] = { filename = "ATIS_7.ogg", duration = 0.556 },
  ["8"] = { filename = "ATIS_8.ogg", duration = 0.377 },
  ["9"] = { filename = "ATIS_9.ogg", duration = 0.459 },
  ["1000"] = { filename = "ATIS_1000.ogg", duration = 0.778 },
  ["2000"] = { filename = "ATIS_2000.ogg", duration = 0.778 },
  ["3000"] = { filename = "ATIS_3000.ogg", duration = 0.756 },
  ["4000"] = { filename = "ATIS_4000.ogg", duration = 0.798 },
  ["5000"] = { filename = "ATIS_5000.ogg", duration = 0.866 },
  ["6000"] = { filename = "ATIS_6000.ogg", duration = 0.845 },
  ["7000"] = { filename = "ATIS_7000.ogg", duration = 0.920 },
  ["8000"] = { filename = "ATIS_8000.ogg", duration = 0.753 },
  ["9000"] = { filename = "ATIS_9000.ogg", duration = 0.885 },
  ["10000"] = { filename = "ATIS_10000.ogg", duration = 0.766 },
  ["11000"] = { filename = "ATIS_11000.ogg", duration = 0.964 },
  ["12000"] = { filename = "ATIS_12000.ogg", duration = 0.866 },
  ["13000"] = { filename = "ATIS_13000.ogg", duration = 1.115 },
  ["14000"] = { filename = "ATIS_14000.ogg", duration = 1.084 },
  ["15000"] = { filename = "ATIS_15000.ogg", duration = 1.051 },
  ["16000"] = { filename = "ATIS_16000.ogg", duration = 1.088 },
  ["17000"] = { filename = "ATIS_17000.ogg", duration = 1.128 },
  ["18000"] = { filename = "ATIS_18000.ogg", duration = 0.969 },
  ["19000"] = { filename = "ATIS_19000.ogg", duration = 1.173 },
  ["20000"] = { filename = "ATIS_20000.ogg", duration = 0.872 },
  ["Thousand"] = { filename = "ATIS_Thousand.ogg", duration = 0.557 },
}

AI_ATC_SoundFiles.Ground.Numerical = {
  ["."] = { filename = "Ground_Decimal.ogg", duration = 0.410 },
  ["0"] = { filename = "Ground_0.ogg", duration = 0.476 },
  ["1"] = { filename = "Ground_1.ogg", duration = 0.348 },
  ["2"] = { filename = "Ground_2.ogg", duration = 0.313 },
  ["3"] = { filename = "Ground_3.ogg", duration = 0.348 },
  ["4"] = { filename = "Ground_4.ogg", duration = 0.372 },
  ["5"] = { filename = "Ground_5.ogg", duration = 0.418 },
  ["6"] = { filename = "Ground_6.ogg", duration = 0.488 },
  ["7"] = { filename = "Ground_7.ogg", duration = 0.418 },
  ["8"] = { filename = "Ground_8.ogg", duration = 0.325 },
  ["9"] = { filename = "Ground_9.ogg", duration = 0.348 },
  ["10"] = { filename = "Ground_10.ogg", duration = 0.668 },
  ["11"] = { filename = "Ground_11.ogg", duration = 0.495 },
  ["12"] = { filename = "Ground_12.ogg", duration = 0.563 },
  ["13"] = { filename = "Ground_13.ogg", duration = 0.627 },
  ["14"] = { filename = "Ground_14.ogg", duration = 0.621 },
  ["15"] = { filename = "Ground_15.ogg", duration = 0.679 },
  ["16"] = { filename = "Ground_16.ogg", duration = 0.708 },
  ["17"] = { filename = "Ground_17.ogg", duration = 0.618 },
  ["18"] = { filename = "Ground_18.ogg", duration = 0.430 },
  ["19"] = { filename = "Ground_19.ogg", duration = 0.598 },
  ["20"] = { filename = "Ground_20.ogg", duration = 0.636 },
  ["21"] = { filename = "Ground_21.ogg", duration = 0.492 },
  ["22"] = { filename = "Ground_22.ogg", duration = 0.565 },
  ["23"] = { filename = "Ground_23.ogg", duration = 0.540 },
  ["24"] = { filename = "Ground_24.ogg", duration = 0.542 },
  ["25"] = { filename = "Ground_25.ogg", duration = 0.630 },
  ["26"] = { filename = "Ground_26.ogg", duration = 0.641 },
  ["27"] = { filename = "Ground_27.ogg", duration = 0.639 },
  ["28"] = { filename = "Ground_28.ogg", duration = 0.511 },
  ["29"] = { filename = "Ground_29.ogg", duration = 0.578 },
  ["30"] = { filename = "Ground_30.ogg", duration = 0.679 },
  }
  
AI_ATC_SoundFiles.RangeControl.Numerical = {
  ["."] = { filename = "RangeControl_Decimal.ogg", duration = 0.441 },
  ["0"] = { filename = "RangeControl_0.ogg", duration = 0.499 },
  ["1"] = { filename = "RangeControl_1.ogg", duration = 0.337 },
  ["2"] = { filename = "RangeControl_2.ogg", duration = 0.313 },
  ["3"] = { filename = "RangeControl_3.ogg", duration = 0.395 },
  ["4"] = { filename = "RangeControl_4.ogg", duration = 0.406 },
  ["5"] = { filename = "RangeControl_5.ogg", duration = 0.476 },
  ["6"] = { filename = "RangeControl_6.ogg", duration = 0.592 },
  ["7"] = { filename = "RangeControl_7.ogg", duration = 0.464 },
  ["8"] = { filename = "RangeControl_8.ogg", duration = 0.395 },
  ["9"] = { filename = "RangeControl_9.ogg", duration = 0.441 },
  ["10"] = { filename = "RangeControl_10.ogg", duration = 0.395 },
  ["11"] = { filename = "RangeControl_11.ogg", duration = 0.476 },
  ["12"] = { filename = "RangeControl_12.ogg", duration = 0.476 },
  ["13"] = { filename = "RangeControl_13.ogg", duration = 0.489 },
  ["14"] = { filename = "RangeControl_14.ogg", duration = 0.521 },
  ["15"] = { filename = "RangeControl_15.ogg", duration = 0.464 },
  ["16"] = { filename = "RangeControl_16.ogg", duration = 0.605 },
  ["17"] = { filename = "RangeControl_17.ogg", duration = 0.589 },
  ["18"] = { filename = "RangeControl_18.ogg", duration = 0.480 },
  ["19"] = { filename = "RangeControl_19.ogg", duration = 0.562 },
  ["20"] = { filename = "RangeControl_20.ogg", duration = 0.380 },
  ["30"] = { filename = "RangeControl_30.ogg", duration = 0.344 },
  ["40"] = { filename = "RangeControl_40.ogg", duration = 0.352 },
  ["50"] = { filename = "RangeControl_50.ogg", duration = 0.373 },
  ["60"] = { filename = "RangeControl_60.ogg", duration = 0.512 },
  ["70"] = { filename = "RangeControl_70.ogg", duration = 0.443 },
  ["80"] = { filename = "RangeControl_80.ogg", duration = 0.342 },
  ["90"] = { filename = "RangeControl_90.ogg", duration = 0.430 },
  ["100"] = { filename = "RangeControl_100.ogg", duration = 0.508 },
  ["200"] = { filename = "RangeControl_200.ogg", duration = 0.531 },
  ["300"] = { filename = "RangeControl_300.ogg", duration = 0.582 },
  ["400"] = { filename = "RangeControl_400.ogg", duration = 0.592 },
  ["500"] = { filename = "RangeControl_500.ogg", duration = 0.573 },
  ["600"] = { filename = "RangeControl_600.ogg", duration = 0.644 },
  ["700"] = { filename = "RangeControl_700.ogg", duration = 0.689 },
  ["800"] = { filename = "RangeControl_800.ogg", duration = 0.525 },
  ["900"] = { filename = "RangeControl_900.ogg", duration = 0.697 },
  ["1000"] = { filename = "RangeControl1000.ogg", duration = 0.685 },
  ["2000"] = { filename = "RangeControl2000.ogg", duration = 0.662 },
  ["3000"] = { filename = "RangeControl3000.ogg", duration = 0.743 },
  ["4000"] = { filename = "RangeControl4000.ogg", duration = 0.708 },
  ["5000"] = { filename = "RangeControl5000.ogg", duration = 0.697 },
  ["6000"] = { filename = "RangeControl6000.ogg", duration = 0.871 },
  ["7000"] = { filename = "RangeControl7000.ogg", duration = 0.774 },
  ["8000"] = { filename = "RangeControl8000.ogg", duration = 0.691 },
  ["9000"] = { filename = "RangeControl9000.ogg", duration = 0.705 },
  ["10000"] = { filename = "RangeControl10000.ogg", duration = 0.669 },
  ["11000"] = { filename = "RangeControl11000.ogg", duration = 0.805 },
  ["12000"] = { filename = "RangeControl12000.ogg", duration = 0.739 },
  ["13000"] = { filename = "RangeControl13000.ogg", duration = 0.840 },
  ["14000"] = { filename = "RangeControl14000.ogg", duration = 0.975 },
  ["15000"] = { filename = "RangeControl15000.ogg", duration = 1.010 },
  ["16000"] = { filename = "RangeControl16000.ogg", duration = 0.891 },
  ["17000"] = { filename = "RangeControl17000.ogg", duration = 1.022 },
  ["18000"] = { filename = "RangeControl18000.ogg", duration = 0.812 },
}
  
AI_ATC_SoundFiles.Clearance.Numerical = {
  ["0"] = { filename = "Clearance_0.ogg", duration = 0.369 },
  ["1"] = { filename = "Clearance_1.ogg", duration = 0.286 },
  ["2"] = { filename = "Clearance_2.ogg", duration = 0.237 },
  ["3"] = { filename = "Clearance_3.ogg", duration = 0.264 },
  ["4"] = { filename = "Clearance_4.ogg", duration = 0.258 },
  ["5"] = { filename = "Clearance_5.ogg", duration = 0.258 },
  ["6"] = { filename = "Clearance_6.ogg", duration = 0.383 },
  ["7"] = { filename = "Clearance_7.ogg", duration = 0.435 },
  ["8"] = { filename = "Clearance_8.ogg", duration = 0.222 },
  ["9"] = { filename = "Clearance_9.ogg", duration = 0.286 },
  }
  
AI_ATC_SoundFiles.Ground.Heading = {
  ["000"] = { filename = "360.ogg", duration = 0.836 },
  ["001"] = { filename = "001.ogg", duration = 0.904 },
  ["002"] = { filename = "002.ogg", duration = 0.916 },
  ["003"] = { filename = "003.ogg", duration = 0.994 },
  ["004"] = { filename = "004.ogg", duration = 1.019 },
  ["005"] = { filename = "005.ogg", duration = 1.074 },
  ["006"] = { filename = "006.ogg", duration = 1.088 },
  ["007"] = { filename = "007.ogg", duration = 1.012 },
  ["008"] = { filename = "008.ogg", duration = 0.949 },
  ["009"] = { filename = "009.ogg", duration = 0.990 },
  ["010"] = { filename = "010.ogg", duration = 0.908 },
  ["011"] = { filename = "011.ogg", duration = 0.737 },
  ["012"] = { filename = "012.ogg", duration = 0.830 },
  ["013"] = { filename = "013.ogg", duration = 0.863 },
  ["014"] = { filename = "014.ogg", duration = 0.858 },
  ["015"] = { filename = "015.ogg", duration = 0.919 },
  ["016"] = { filename = "016.ogg", duration = 0.938 },
  ["017"] = { filename = "017.ogg", duration = 0.911 },
  ["018"] = { filename = "018.ogg", duration = 0.794 },
  ["019"] = { filename = "019.ogg", duration = 0.874 },
  ["020"] = { filename = "020.ogg", duration = 0.888 },
  ["021"] = { filename = "021.ogg", duration = 0.755 },
  ["022"] = { filename = "022.ogg", duration = 0.813 },
  ["023"] = { filename = "023.ogg", duration = 0.810 },
  ["024"] = { filename = "024.ogg", duration = 0.832 },
  ["025"] = { filename = "025.ogg", duration = 0.893 },
  ["026"] = { filename = "026.ogg", duration = 0.907 },
  ["027"] = { filename = "027.ogg", duration = 0.881 },
  ["028"] = { filename = "028.ogg", duration = 0.811 },
  ["029"] = { filename = "029.ogg", duration = 0.866 },
  ["030"] = { filename = "030.ogg", duration = 0.975 },
  ["031"] = { filename = "031.ogg", duration = 0.821 },
  ["032"] = { filename = "032.ogg", duration = 0.816 },
  ["033"] = { filename = "033.ogg", duration = 0.890 },
  ["034"] = { filename = "034.ogg", duration = 0.914 },
  ["035"] = { filename = "035.ogg", duration = 0.965 },
  ["036"] = { filename = "036.ogg", duration = 0.977 },
  ["037"] = { filename = "037.ogg", duration = 0.945 },
  ["038"] = { filename = "038.ogg", duration = 0.848 },
  ["039"] = { filename = "039.ogg", duration = 0.882 },
  ["040"] = { filename = "040.ogg", duration = 0.977 },
  ["041"] = { filename = "041.ogg", duration = 0.813 },
  ["042"] = { filename = "042.ogg", duration = 0.845 },
  ["043"] = { filename = "043.ogg", duration = 0.904 },
  ["044"] = { filename = "044.ogg", duration = 0.869 },
  ["045"] = { filename = "045.ogg", duration = 0.959 },
  ["046"] = { filename = "046.ogg", duration = 0.968 },
  ["047"] = { filename = "047.ogg", duration = 0.958 },
  ["048"] = { filename = "048.ogg", duration = 0.874 },
  ["049"] = { filename = "049.ogg", duration = 0.894 },
  ["050"] = { filename = "050.ogg", duration = 0.984 },
  ["051"] = { filename = "051.ogg", duration = 0.785 },
  ["052"] = { filename = "052.ogg", duration = 0.823 },
  ["053"] = { filename = "053.ogg", duration = 0.945 },
  ["054"] = { filename = "054.ogg", duration = 0.929 },
  ["055"] = { filename = "055.ogg", duration = 1.068 },
  ["056"] = { filename = "056.ogg", duration = 1.020 },
  ["057"] = { filename = "057.ogg", duration = 0.956 },
  ["058"] = { filename = "058.ogg", duration = 0.855 },
  ["059"] = { filename = "059.ogg", duration = 0.882 },
  ["060"] = { filename = "060.ogg", duration = 0.943 },
  ["061"] = { filename = "061.ogg", duration = 0.855 },
  ["062"] = { filename = "062.ogg", duration = 0.834 },
  ["063"] = { filename = "063.ogg", duration = 0.916 },
  ["064"] = { filename = "064.ogg", duration = 0.866 },
  ["065"] = { filename = "065.ogg", duration = 0.997 },
  ["066"] = { filename = "066.ogg", duration = 0.952 },
  ["067"] = { filename = "067.ogg", duration = 0.929 },
  ["068"] = { filename = "068.ogg", duration = 0.881 },
  ["069"] = { filename = "069.ogg", duration = 0.939 },
  ["070"] = { filename = "070.ogg", duration = 1.059 },
  ["071"] = { filename = "071.ogg", duration = 0.922 },
  ["072"] = { filename = "072.ogg", duration = 0.987 },
  ["073"] = { filename = "073.ogg", duration = 1.010 },
  ["074"] = { filename = "074.ogg", duration = 0.961 },
  ["075"] = { filename = "075.ogg", duration = 1.077 },
  ["076"] = { filename = "076.ogg", duration = 1.093 },
  ["077"] = { filename = "077.ogg", duration = 1.059 },
  ["078"] = { filename = "078.ogg", duration = 0.933 },
  ["079"] = { filename = "079.ogg", duration = 1.013 },
  ["080"] = { filename = "080.ogg", duration = 0.842 },
  ["081"] = { filename = "081.ogg", duration = 0.762 },
  ["082"] = { filename = "082.ogg", duration = 0.798 },
  ["083"] = { filename = "083.ogg", duration = 0.778 },
  ["084"] = { filename = "084.ogg", duration = 0.788 },
  ["085"] = { filename = "085.ogg", duration = 0.875 },
  ["086"] = { filename = "086.ogg", duration = 0.868 },
  ["087"] = { filename = "087.ogg", duration = 0.853 },
  ["088"] = { filename = "088.ogg", duration = 0.769 },
  ["089"] = { filename = "089.ogg", duration = 0.840 },
  ["090"] = { filename = "090.ogg", duration = 0.946 },
  ["091"] = { filename = "091.ogg", duration = 0.853 },
  ["092"] = { filename = "092.ogg", duration = 0.907 },
  ["093"] = { filename = "093.ogg", duration = 0.910 },
  ["094"] = { filename = "094.ogg", duration = 0.933 },
  ["095"] = { filename = "095.ogg", duration = 1.017 },
  ["096"] = { filename = "096.ogg", duration = 1.017 },
  ["097"] = { filename = "097.ogg", duration = 0.893 },
  ["098"] = { filename = "098.ogg", duration = 0.849 },
  ["099"] = { filename = "099.ogg", duration = 0.926 },
  ["100"] = { filename = "100.ogg", duration = 0.945 },
  ["101"] = { filename = "101.ogg", duration = 0.691 },
  ["102"] = { filename = "102.ogg", duration = 0.784 },
  ["103"] = { filename = "103.ogg", duration = 0.826 },
  ["104"] = { filename = "104.ogg", duration = 0.811 },
  ["105"] = { filename = "105.ogg", duration = 0.913 },
  ["106"] = { filename = "106.ogg", duration = 0.914 },
  ["107"] = { filename = "107.ogg", duration = 0.897 },
  ["108"] = { filename = "108.ogg", duration = 0.763 },
  ["109"] = { filename = "109.ogg", duration = 0.819 },
  ["110"] = { filename = "110.ogg", duration = 0.747 },
  ["111"] = { filename = "111.ogg", duration = 0.633 },
  ["112"] = { filename = "112.ogg", duration = 0.665 },
  ["113"] = { filename = "113.ogg", duration = 0.694 },
  ["114"] = { filename = "114.ogg", duration = 0.665 },
  ["115"] = { filename = "115.ogg", duration = 0.795 },
  ["116"] = { filename = "116.ogg", duration = 0.756 },
  ["117"] = { filename = "117.ogg", duration = 0.769 },
  ["118"] = { filename = "118.ogg", duration = 0.644 },
  ["119"] = { filename = "119.ogg", duration = 0.700 },
  ["120"] = { filename = "120.ogg", duration = 0.727 },
  ["121"] = { filename = "121.ogg", duration = 0.583 },
  ["122"] = { filename = "122.ogg", duration = 0.643 },
  ["123"] = { filename = "123.ogg", duration = 0.649 },
  ["124"] = { filename = "124.ogg", duration = 0.652 },
  ["125"] = { filename = "125.ogg", duration = 0.747 },
  ["126"] = { filename = "126.ogg", duration = 0.740 },
  ["127"] = { filename = "127.ogg", duration = 0.733 },
  ["128"] = { filename = "128.ogg", duration = 0.621 },
  ["129"] = { filename = "129.ogg", duration = 0.675 },
  ["130"] = { filename = "130.ogg", duration = 0.778 },
  ["131"] = { filename = "131.ogg", duration = 0.610 },
  ["132"] = { filename = "132.ogg", duration = 0.636 },
  ["133"] = { filename = "133.ogg", duration = 0.739 },
  ["134"] = { filename = "134.ogg", duration = 0.737 },
  ["135"] = { filename = "135.ogg", duration = 0.808 },
  ["136"] = { filename = "136.ogg", duration = 0.797 },
  ["137"] = { filename = "137.ogg", duration = 0.769 },
  ["138"] = { filename = "138.ogg", duration = 0.660 },
  ["139"] = { filename = "139.ogg", duration = 0.702 },
  ["140"] = { filename = "140.ogg", duration = 0.781 },
  ["141"] = { filename = "141.ogg", duration = 0.620 },
  ["142"] = { filename = "142.ogg", duration = 0.665 },
  ["143"] = { filename = "143.ogg", duration = 0.723 },
  ["144"] = { filename = "144.ogg", duration = 0.718 },
  ["145"] = { filename = "145.ogg", duration = 0.816 },
  ["146"] = { filename = "146.ogg", duration = 0.813 },
  ["147"] = { filename = "147.ogg", duration = 0.774 },
  ["148"] = { filename = "148.ogg", duration = 0.681 },
  ["149"] = { filename = "149.ogg", duration = 0.737 },
  ["150"] = { filename = "150.ogg", duration = 0.779 },
  ["151"] = { filename = "151.ogg", duration = 0.596 },
  ["152"] = { filename = "152.ogg", duration = 0.652 },
  ["153"] = { filename = "153.ogg", duration = 0.768 },
  ["154"] = { filename = "154.ogg", duration = 0.744 },
  ["155"] = { filename = "155.ogg", duration = 0.845 },
  ["156"] = { filename = "156.ogg", duration = 0.845 },
  ["157"] = { filename = "157.ogg", duration = 0.836 },
  ["158"] = { filename = "158.ogg", duration = 0.723 },
  ["159"] = { filename = "159.ogg", duration = 0.731 },
  ["160"] = { filename = "160.ogg", duration = 0.798 },
  ["161"] = { filename = "161.ogg", duration = 0.666 },
  ["162"] = { filename = "162.ogg", duration = 0.688 },
  ["163"] = { filename = "163.ogg", duration = 0.708 },
  ["164"] = { filename = "164.ogg", duration = 0.715 },
  ["165"] = { filename = "165.ogg", duration = 0.837 },
  ["166"] = { filename = "166.ogg", duration = 0.737 },
  ["167"] = { filename = "167.ogg", duration = 0.742 },
  ["168"] = { filename = "168.ogg", duration = 0.726 },
  ["169"] = { filename = "169.ogg", duration = 0.737 },
  ["170"] = { filename = "170.ogg", duration = 0.833 },
  ["171"] = { filename = "171.ogg", duration = 0.749 },
  ["172"] = { filename = "172.ogg", duration = 0.760 },
  ["173"] = { filename = "173.ogg", duration = 0.813 },
  ["174"] = { filename = "174.ogg", duration = 0.821 },
  ["175"] = { filename = "175.ogg", duration = 0.868 },
  ["176"] = { filename = "176.ogg", duration = 0.907 },
  ["177"] = { filename = "177.ogg", duration = 0.852 },
  ["178"] = { filename = "178.ogg", duration = 0.785 },
  ["179"] = { filename = "179.ogg", duration = 0.778 },
  ["180"] = { filename = "180.ogg", duration = 0.662 },
  ["181"] = { filename = "181.ogg", duration = 0.599 },
  ["182"] = { filename = "182.ogg", duration = 0.592 },
  ["183"] = { filename = "183.ogg", duration = 0.662 },
  ["184"] = { filename = "184.ogg", duration = 0.578 },
  ["185"] = { filename = "185.ogg", duration = 0.729 },
  ["186"] = { filename = "186.ogg", duration = 0.724 },
  ["187"] = { filename = "187.ogg", duration = 0.701 },
  ["188"] = { filename = "188.ogg", duration = 0.617 },
  ["189"] = { filename = "189.ogg", duration = 0.657 },
  ["190"] = { filename = "190.ogg", duration = 0.800 },
  ["191"] = { filename = "191.ogg", duration = 0.647 },
  ["192"] = { filename = "192.ogg", duration = 0.663 },
  ["193"] = { filename = "193.ogg", duration = 0.749 },
  ["194"] = { filename = "194.ogg", duration = 0.739 },
  ["195"] = { filename = "195.ogg", duration = 0.816 },
  ["196"] = { filename = "196.ogg", duration = 0.816 },
  ["197"] = { filename = "197.ogg", duration = 0.804 },
  ["198"] = { filename = "198.ogg", duration = 0.705 },
  ["199"] = { filename = "199.ogg", duration = 0.730 },
  ["200"] = { filename = "200.ogg", duration = 0.850 },
  ["201"] = { filename = "201.ogg", duration = 0.689 },
  ["202"] = { filename = "202.ogg", duration = 0.763 },
  ["203"] = { filename = "203.ogg", duration = 0.839 },
  ["204"] = { filename = "204.ogg", duration = 0.766 },
  ["205"] = { filename = "205.ogg", duration = 0.891 },
  ["206"] = { filename = "206.ogg", duration = 0.875 },
  ["207"] = { filename = "207.ogg", duration = 0.887 },
  ["208"] = { filename = "208.ogg", duration = 0.778 },
  ["209"] = { filename = "209.ogg", duration = 0.819 },
  ["210"] = { filename = "210.ogg", duration = 0.708 },
  ["211"] = { filename = "211.ogg", duration = 0.646 },
  ["212"] = { filename = "212.ogg", duration = 0.669 },
  ["213"] = { filename = "213.ogg", duration = 0.655 },
  ["214"] = { filename = "214.ogg", duration = 0.665 },
  ["215"] = { filename = "215.ogg", duration = 0.778 },
  ["216"] = { filename = "216.ogg", duration = 0.744 },
  ["217"] = { filename = "217.ogg", duration = 0.731 },
  ["218"] = { filename = "218.ogg", duration = 0.630 },
  ["219"] = { filename = "219.ogg", duration = 0.665 },
  ["220"] = { filename = "220.ogg", duration = 0.730 },
  ["221"] = { filename = "221.ogg", duration = 0.594 },
  ["222"] = { filename = "222.ogg", duration = 0.612 },
  ["223"] = { filename = "223.ogg", duration = 0.625 },
  ["224"] = { filename = "224.ogg", duration = 0.644 },
  ["225"] = { filename = "225.ogg", duration = 0.760 },
  ["226"] = { filename = "226.ogg", duration = 0.740 },
  ["227"] = { filename = "227.ogg", duration = 0.720 },
  ["228"] = { filename = "228.ogg", duration = 0.620 },
  ["229"] = { filename = "229.ogg", duration = 0.675 },
  ["230"] = { filename = "230.ogg", duration = 0.785 },
  ["231"] = { filename = "231.ogg", duration = 0.583 },
  ["232"] = { filename = "232.ogg", duration = 0.646 },
  ["233"] = { filename = "233.ogg", duration = 0.700 },
  ["234"] = { filename = "234.ogg", duration = 0.686 },
  ["235"] = { filename = "235.ogg", duration = 0.778 },
  ["236"] = { filename = "236.ogg", duration = 0.771 },
  ["237"] = { filename = "237.ogg", duration = 0.766 },
  ["238"] = { filename = "238.ogg", duration = 0.659 },
  ["239"] = { filename = "239.ogg", duration = 0.715 },
  ["240"] = { filename = "240.ogg", duration = 0.731 },
  ["241"] = { filename = "241.ogg", duration = 0.601 },
  ["242"] = { filename = "242.ogg", duration = 0.675 },
  ["243"] = { filename = "243.ogg", duration = 0.717 },
  ["244"] = { filename = "244.ogg", duration = 0.681 },
  ["245"] = { filename = "245.ogg", duration = 0.798 },
  ["246"] = { filename = "246.ogg", duration = 0.789 },
  ["247"] = { filename = "247.ogg", duration = 0.772 },
  ["248"] = { filename = "248.ogg", duration = 0.675 },
  ["249"] = { filename = "249.ogg", duration = 0.707 },
  ["250"] = { filename = "250.ogg", duration = 0.772 },
  ["251"] = { filename = "251.ogg", duration = 0.579 },
  ["252"] = { filename = "252.ogg", duration = 0.659 },
  ["253"] = { filename = "253.ogg", duration = 0.711 },
  ["254"] = { filename = "254.ogg", duration = 0.726 },
  ["255"] = { filename = "255.ogg", duration = 0.820 },
  ["256"] = { filename = "256.ogg", duration = 0.811 },
  ["257"] = { filename = "257.ogg", duration = 0.739 },
  ["258"] = { filename = "258.ogg", duration = 0.686 },
  ["259"] = { filename = "259.ogg", duration = 0.691 },
  ["260"] = { filename = "260.ogg", duration = 0.774 },
  ["261"] = { filename = "261.ogg", duration = 0.675 },
  ["262"] = { filename = "262.ogg", duration = 0.666 },
  ["263"] = { filename = "263.ogg", duration = 0.729 },
  ["264"] = { filename = "264.ogg", duration = 0.704 },
  ["265"] = { filename = "265.ogg", duration = 0.821 },
  ["266"] = { filename = "266.ogg", duration = 0.750 },
  ["267"] = { filename = "267.ogg", duration = 0.739 },
  ["268"] = { filename = "268.ogg", duration = 0.655 },
  ["269"] = { filename = "269.ogg", duration = 0.778 },
  ["270"] = { filename = "270.ogg", duration = 0.836 },
  ["271"] = { filename = "271.ogg", duration = 0.759 },
  ["272"] = { filename = "272.ogg", duration = 0.788 },
  ["273"] = { filename = "273.ogg", duration = 0.823 },
  ["274"] = { filename = "274.ogg", duration = 0.834 },
  ["275"] = { filename = "275.ogg", duration = 0.874 },
  ["276"] = { filename = "276.ogg", duration = 0.897 },
  ["277"] = { filename = "277.ogg", duration = 0.866 },
  ["278"] = { filename = "278.ogg", duration = 0.762 },
  ["279"] = { filename = "279.ogg", duration = 0.727 },
  ["280"] = { filename = "280.ogg", duration = 0.682 },
  ["281"] = { filename = "281.ogg", duration = 0.608 },
  ["282"] = { filename = "282.ogg", duration = 0.592 },
  ["283"] = { filename = "283.ogg", duration = 0.627 },
  ["284"] = { filename = "284.ogg", duration = 0.602 },
  ["285"] = { filename = "285.ogg", duration = 0.726 },
  ["286"] = { filename = "286.ogg", duration = 0.714 },
  ["287"] = { filename = "287.ogg", duration = 0.691 },
  ["288"] = { filename = "288.ogg", duration = 0.599 },
  ["289"] = { filename = "289.ogg", duration = 0.689 },
  ["290"] = { filename = "290.ogg", duration = 0.752 },
  ["291"] = { filename = "291.ogg", duration = 0.673 },
  ["292"] = { filename = "292.ogg", duration = 0.682 },
  ["293"] = { filename = "293.ogg", duration = 0.750 },
  ["294"] = { filename = "294.ogg", duration = 0.765 },
  ["295"] = { filename = "295.ogg", duration = 0.845 },
  ["296"] = { filename = "296.ogg", duration = 0.811 },
  ["297"] = { filename = "297.ogg", duration = 0.769 },
  ["298"] = { filename = "298.ogg", duration = 0.702 },
  ["299"] = { filename = "299.ogg", duration = 0.678 },
  ["300"] = { filename = "300.ogg", duration = 1.035 },
  ["301"] = { filename = "301.ogg", duration = 0.811 },
  ["302"] = { filename = "302.ogg", duration = 0.888 },
  ["303"] = { filename = "303.ogg", duration = 0.951 },
  ["304"] = { filename = "304.ogg", duration = 0.935 },
  ["305"] = { filename = "305.ogg", duration = 1.045 },
  ["306"] = { filename = "306.ogg", duration = 1.057 },
  ["307"] = { filename = "307.ogg", duration = 1.022 },
  ["308"] = { filename = "308.ogg", duration = 0.893 },
  ["309"] = { filename = "309.ogg", duration = 0.956 },
  ["310"] = { filename = "310.ogg", duration = 0.842 },
  ["311"] = { filename = "311.ogg", duration = 0.705 },
  ["312"] = { filename = "312.ogg", duration = 0.715 },
  ["313"] = { filename = "313.ogg", duration = 0.731 },
  ["314"] = { filename = "314.ogg", duration = 0.727 },
  ["315"] = { filename = "315.ogg", duration = 0.830 },
  ["316"] = { filename = "316.ogg", duration = 0.803 },
  ["317"] = { filename = "317.ogg", duration = 0.805 },
  ["318"] = { filename = "318.ogg", duration = 0.685 },
  ["319"] = { filename = "319.ogg", duration = 0.787 },
  ["320"] = { filename = "320.ogg", duration = 0.817 },
  ["321"] = { filename = "321.ogg", duration = 0.628 },
  ["322"] = { filename = "322.ogg", duration = 0.663 },
  ["323"] = { filename = "323.ogg", duration = 0.691 },
  ["324"] = { filename = "324.ogg", duration = 0.697 },
  ["325"] = { filename = "325.ogg", duration = 0.797 },
  ["326"] = { filename = "326.ogg", duration = 0.756 },
  ["327"] = { filename = "327.ogg", duration = 0.775 },
  ["328"] = { filename = "328.ogg", duration = 0.641 },
  ["329"] = { filename = "329.ogg", duration = 0.813 },
  ["330"] = { filename = "330.ogg", duration = 0.813 },
  ["331"] = { filename = "331.ogg", duration = 0.685 },
  ["332"] = { filename = "332.ogg", duration = 0.673 },
  ["333"] = { filename = "333.ogg", duration = 0.746 },
  ["334"] = { filename = "334.ogg", duration = 0.832 },
  ["335"] = { filename = "335.ogg", duration = 0.827 },
  ["336"] = { filename = "336.ogg", duration = 0.829 },
  ["337"] = { filename = "337.ogg", duration = 0.813 },
  ["338"] = { filename = "338.ogg", duration = 0.700 },
  ["339"] = { filename = "339.ogg", duration = 0.778 },
  ["340"] = { filename = "340.ogg", duration = 0.887 },
  ["341"] = { filename = "341.ogg", duration = 0.705 },
  ["342"] = { filename = "342.ogg", duration = 0.730 },
  ["343"] = { filename = "343.ogg", duration = 0.787 },
  ["344"] = { filename = "344.ogg", duration = 0.758 },
  ["345"] = { filename = "345.ogg", duration = 0.913 },
  ["346"] = { filename = "346.ogg", duration = 0.871 },
  ["347"] = { filename = "347.ogg", duration = 0.846 },
  ["348"] = { filename = "348.ogg", duration = 0.729 },
  ["349"] = { filename = "349.ogg", duration = 0.789 },
  ["350"] = { filename = "350.ogg", duration = 0.852 },
  ["351"] = { filename = "351.ogg", duration = 0.685 },
  ["352"] = { filename = "352.ogg", duration = 0.689 },
  ["353"] = { filename = "353.ogg", duration = 0.823 },
  ["354"] = { filename = "354.ogg", duration = 0.800 },
  ["355"] = { filename = "355.ogg", duration = 0.922 },
  ["356"] = { filename = "356.ogg", duration = 0.852 },
  ["357"] = { filename = "357.ogg", duration = 0.849 },
  ["358"] = { filename = "358.ogg", duration = 0.766 },
  ["359"] = { filename = "359.ogg", duration = 0.744 },
  ["360"] = { filename = "360.ogg", duration = 0.836 }
}

AI_ATC_SoundFiles.Departure.Heading = {
  ["000"] = { filename = "360.ogg", duration = 0.996 },
  ["001"] = { filename = "001.ogg", duration = 1.144 },
  ["002"] = { filename = "002.ogg", duration = 1.181 },
  ["003"] = { filename = "003.ogg", duration = 1.157 },
  ["004"] = { filename = "004.ogg", duration = 1.019 },
  ["005"] = { filename = "005.ogg", duration = 1.140 },
  ["006"] = { filename = "006.ogg", duration = 1.149 },
  ["007"] = { filename = "007.ogg", duration = 1.347 },
  ["008"] = { filename = "008.ogg", duration = 1.203 },
  ["009"] = { filename = "009.ogg", duration = 1.100 },
  ["010"] = { filename = "010.ogg", duration = 1.125 },
  ["011"] = { filename = "011.ogg", duration = 0.993 },
  ["012"] = { filename = "012.ogg", duration = 0.975 },
  ["013"] = { filename = "013.ogg", duration = 0.990 },
  ["014"] = { filename = "014.ogg", duration = 0.990 },
  ["015"] = { filename = "015.ogg", duration = 0.996 },
  ["016"] = { filename = "016.ogg", duration = 1.035 },
  ["017"] = { filename = "017.ogg", duration = 1.162 },
  ["018"] = { filename = "018.ogg", duration = 0.990 },
  ["019"] = { filename = "019.ogg", duration = 0.969 },
  ["020"] = { filename = "020.ogg", duration = 1.149 },
  ["021"] = { filename = "021.ogg", duration = 0.967 },
  ["022"] = { filename = "022.ogg", duration = 1.020 },
  ["023"] = { filename = "023.ogg", duration = 1.071 },
  ["024"] = { filename = "024.ogg", duration = 1.039 },
  ["025"] = { filename = "025.ogg", duration = 1.077 },
  ["026"] = { filename = "026.ogg", duration = 1.115 },
  ["027"] = { filename = "027.ogg", duration = 1.152 },
  ["028"] = { filename = "028.ogg", duration = 0.906 },
  ["029"] = { filename = "029.ogg", duration = 1.045 },
  ["030"] = { filename = "030.ogg", duration = 1.138 },
  ["031"] = { filename = "031.ogg", duration = 1.045 },
  ["032"] = { filename = "032.ogg", duration = 1.057 },
  ["033"] = { filename = "033.ogg", duration = 1.051 },
  ["034"] = { filename = "034.ogg", duration = 1.048 },
  ["035"] = { filename = "035.ogg", duration = 0.998 },
  ["036"] = { filename = "036.ogg", duration = 1.129 },
  ["037"] = { filename = "037.ogg", duration = 1.170 },
  ["038"] = { filename = "038.ogg", duration = 0.949 },
  ["039"] = { filename = "039.ogg", duration = 0.998 },
  ["040"] = { filename = "040.ogg", duration = 1.167 },
  ["041"] = { filename = "041.ogg", duration = 1.022 },
  ["042"] = { filename = "042.ogg", duration = 1.027 },
  ["043"] = { filename = "043.ogg", duration = 1.051 },
  ["044"] = { filename = "044.ogg", duration = 1.054 },
  ["045"] = { filename = "045.ogg", duration = 1.088 },
  ["046"] = { filename = "046.ogg", duration = 1.123 },
  ["047"] = { filename = "047.ogg", duration = 1.184 },
  ["048"] = { filename = "048.ogg", duration = 0.949 },
  ["049"] = { filename = "049.ogg", duration = 0.964 },
  ["050"] = { filename = "050.ogg", duration = 1.117 },
  ["051"] = { filename = "051.ogg", duration = 0.998 },
  ["052"] = { filename = "052.ogg", duration = 0.993 },
  ["053"] = { filename = "053.ogg", duration = 0.967 },
  ["054"] = { filename = "054.ogg", duration = 1.010 },
  ["055"] = { filename = "055.ogg", duration = 1.115 },
  ["056"] = { filename = "056.ogg", duration = 1.156 },
  ["057"] = { filename = "057.ogg", duration = 1.164 },
  ["058"] = { filename = "058.ogg", duration = 0.978 },
  ["059"] = { filename = "059.ogg", duration = 0.987 },
  ["060"] = { filename = "060.ogg", duration = 1.088 },
  ["061"] = { filename = "061.ogg", duration = 0.993 },
  ["062"] = { filename = "062.ogg", duration = 1.004 },
  ["063"] = { filename = "063.ogg", duration = 1.004 },
  ["064"] = { filename = "064.ogg", duration = 1.004 },
  ["065"] = { filename = "065.ogg", duration = 0.998 },
  ["066"] = { filename = "066.ogg", duration = 1.126 },
  ["067"] = { filename = "067.ogg", duration = 1.149 },
  ["068"] = { filename = "068.ogg", duration = 0.961 },
  ["069"] = { filename = "069.ogg", duration = 0.987 },
  ["070"] = { filename = "070.ogg", duration = 1.297 },
  ["071"] = { filename = "071.ogg", duration = 1.144 },
  ["072"] = { filename = "072.ogg", duration = 1.152 },
  ["073"] = { filename = "073.ogg", duration = 1.173 },
  ["074"] = { filename = "074.ogg", duration = 1.155 },
  ["075"] = { filename = "075.ogg", duration = 1.146 },
  ["076"] = { filename = "076.ogg", duration = 1.236 },
  ["077"] = { filename = "077.ogg", duration = 1.350 },
  ["078"] = { filename = "078.ogg", duration = 1.234 },
  ["079"] = { filename = "079.ogg", duration = 1.123 },
  ["080"] = { filename = "080.ogg", duration = 1.207 },
  ["081"] = { filename = "081.ogg", duration = 1.030 },
  ["082"] = { filename = "082.ogg", duration = 1.115 },
  ["083"] = { filename = "083.ogg", duration = 1.100 },
  ["084"] = { filename = "084.ogg", duration = 1.062 },
  ["085"] = { filename = "085.ogg", duration = 1.112 },
  ["086"] = { filename = "086.ogg", duration = 1.126 },
  ["087"] = { filename = "087.ogg", duration = 1.231 },
  ["088"] = { filename = "088.ogg", duration = 1.254 },
  ["089"] = { filename = "089.ogg", duration = 1.039 },
  ["090"] = { filename = "090.ogg", duration = 1.161 },
  ["091"] = { filename = "091.ogg", duration = 0.996 },
  ["092"] = { filename = "092.ogg", duration = 0.978 },
  ["093"] = { filename = "093.ogg", duration = 0.969 },
  ["094"] = { filename = "094.ogg", duration = 0.969 },
  ["095"] = { filename = "095.ogg", duration = 0.975 },
  ["096"] = { filename = "096.ogg", duration = 1.048 },
  ["097"] = { filename = "097.ogg", duration = 1.146 },
  ["098"] = { filename = "098.ogg", duration = 0.990 },
  ["099"] = { filename = "099.ogg", duration = 0.946 },
  ["100"] = { filename = "100.ogg", duration = 1.042 },
  ["101"] = { filename = "101.ogg", duration = 0.924 },
  ["102"] = { filename = "102.ogg", duration = 0.949 },
  ["103"] = { filename = "103.ogg", duration = 0.926 },
  ["104"] = { filename = "104.ogg", duration = 0.943 },
  ["105"] = { filename = "105.ogg", duration = 0.952 },
  ["106"] = { filename = "106.ogg", duration = 0.981 },
  ["107"] = { filename = "107.ogg", duration = 1.094 },
  ["108"] = { filename = "108.ogg", duration = 0.967 },
  ["109"] = { filename = "109.ogg", duration = 0.914 },
  ["110"] = { filename = "110.ogg", duration = 1.071 },
  ["111"] = { filename = "111.ogg", duration = 0.816 },
  ["112"] = { filename = "112.ogg", duration = 0.924 },
  ["113"] = { filename = "113.ogg", duration = 0.766 },
  ["114"] = { filename = "114.ogg", duration = 0.769 },
  ["115"] = { filename = "115.ogg", duration = 0.789 },
  ["116"] = { filename = "116.ogg", duration = 0.842 },
  ["117"] = { filename = "117.ogg", duration = 0.920 },
  ["118"] = { filename = "118.ogg", duration = 0.967 },
  ["119"] = { filename = "119.ogg", duration = 0.805 },
  ["120"] = { filename = "120.ogg", duration = 0.900 },
  ["121"] = { filename = "121.ogg", duration = 0.885 },
  ["122"] = { filename = "122.ogg", duration = 0.840 },
  ["123"] = { filename = "123.ogg", duration = 0.895 },
  ["124"] = { filename = "124.ogg", duration = 0.906 },
  ["125"] = { filename = "125.ogg", duration = 0.920 },
  ["126"] = { filename = "126.ogg", duration = 0.823 },
  ["127"] = { filename = "127.ogg", duration = 0.923 },
  ["128"] = { filename = "128.ogg", duration = 0.938 },
  ["129"] = { filename = "129.ogg", duration = 0.888 },
  ["130"] = { filename = "130.ogg", duration = 0.926 },
  ["131"] = { filename = "131.ogg", duration = 0.814 },
  ["132"] = { filename = "132.ogg", duration = 0.826 },
  ["133"] = { filename = "133.ogg", duration = 0.871 },
  ["134"] = { filename = "134.ogg", duration = 0.830 },
  ["135"] = { filename = "135.ogg", duration = 0.848 },
  ["136"] = { filename = "136.ogg", duration = 0.923 },
  ["137"] = { filename = "137.ogg", duration = 0.936 },
  ["138"] = { filename = "138.ogg", duration = 0.996 },
  ["139"] = { filename = "139.ogg", duration = 0.792 },
  ["140"] = { filename = "140.ogg", duration = 0.926 },
  ["141"] = { filename = "141.ogg", duration = 0.836 },
  ["142"] = { filename = "142.ogg", duration = 0.821 },
  ["143"] = { filename = "143.ogg", duration = 0.859 },
  ["144"] = { filename = "144.ogg", duration = 0.850 },
  ["145"] = { filename = "145.ogg", duration = 0.853 },
  ["146"] = { filename = "146.ogg", duration = 0.839 },
  ["147"] = { filename = "147.ogg", duration = 0.949 },
  ["148"] = { filename = "148.ogg", duration = 0.917 },
  ["149"] = { filename = "149.ogg", duration = 0.823 },
  ["150"] = { filename = "150.ogg", duration = 0.927 },
  ["151"] = { filename = "151.ogg", duration = 0.845 },
  ["152"] = { filename = "152.ogg", duration = 0.862 },
  ["153"] = { filename = "153.ogg", duration = 0.859 },
  ["154"] = { filename = "154.ogg", duration = 0.830 },
  ["155"] = { filename = "155.ogg", duration = 0.888 },
  ["156"] = { filename = "156.ogg", duration = 0.862 },
  ["157"] = { filename = "157.ogg", duration = 0.967 },
  ["158"] = { filename = "158.ogg", duration = 0.996 },
  ["159"] = { filename = "159.ogg", duration = 0.804 },
  ["160"] = { filename = "160.ogg", duration = 1.106 },
  ["161"] = { filename = "161.ogg", duration = 0.862 },
  ["162"] = { filename = "162.ogg", duration = 0.842 },
  ["163"] = { filename = "163.ogg", duration = 0.868 },
  ["164"] = { filename = "164.ogg", duration = 0.871 },
  ["165"] = { filename = "165.ogg", duration = 0.882 },
  ["166"] = { filename = "166.ogg", duration = 0.894 },
  ["167"] = { filename = "167.ogg", duration = 0.917 },
  ["168"] = { filename = "168.ogg", duration = 0.752 },
  ["169"] = { filename = "169.ogg", duration = 0.798 },
  ["170"] = { filename = "170.ogg", duration = 1.071 },
  ["171"] = { filename = "171.ogg", duration = 0.929 },
  ["172"] = { filename = "172.ogg", duration = 0.920 },
  ["173"] = { filename = "173.ogg", duration = 0.923 },
  ["174"] = { filename = "174.ogg", duration = 0.932 },
  ["175"] = { filename = "175.ogg", duration = 0.949 },
  ["176"] = { filename = "176.ogg", duration = 0.984 },
  ["177"] = { filename = "177.ogg", duration = 1.091 },
  ["178"] = { filename = "178.ogg", duration = 0.987 },
  ["179"] = { filename = "179.ogg", duration = 0.900 },
  ["180"] = { filename = "180.ogg", duration = 0.955 },
  ["181"] = { filename = "181.ogg", duration = 0.972 },
  ["182"] = { filename = "182.ogg", duration = 0.932 },
  ["183"] = { filename = "183.ogg", duration = 1.007 },
  ["184"] = { filename = "184.ogg", duration = 0.943 },
  ["185"] = { filename = "185.ogg", duration = 0.961 },
  ["186"] = { filename = "186.ogg", duration = 0.824 },
  ["187"] = { filename = "187.ogg", duration = 0.975 },
  ["188"] = { filename = "188.ogg", duration = 0.935 },
  ["189"] = { filename = "189.ogg", duration = 0.920 },
  ["190"] = { filename = "190.ogg", duration = 0.943 },
  ["191"] = { filename = "191.ogg", duration = 0.798 },
  ["192"] = { filename = "192.ogg", duration = 0.819 },
  ["193"] = { filename = "193.ogg", duration = 0.848 },
  ["194"] = { filename = "194.ogg", duration = 0.749 },
  ["195"] = { filename = "195.ogg", duration = 0.771 },
  ["196"] = { filename = "196.ogg", duration = 0.833 },
  ["197"] = { filename = "197.ogg", duration = 0.920 },
  ["198"] = { filename = "198.ogg", duration = 0.958 },
  ["199"] = { filename = "199.ogg", duration = 1.254 },
  ["200"] = { filename = "200.ogg", duration = 1.062 },
  ["201"] = { filename = "201.ogg", duration = 0.967 },
  ["202"] = { filename = "202.ogg", duration = 1.178 },
  ["203"] = { filename = "203.ogg", duration = 0.958 },
  ["204"] = { filename = "204.ogg", duration = 0.964 },
  ["205"] = { filename = "205.ogg", duration = 0.964 },
  ["206"] = { filename = "206.ogg", duration = 0.993 },
  ["207"] = { filename = "207.ogg", duration = 1.138 },
  ["208"] = { filename = "208.ogg", duration = 1.231 },
  ["209"] = { filename = "209.ogg", duration = 0.961 },
  ["210"] = { filename = "210.ogg", duration = 1.057 },
  ["211"] = { filename = "211.ogg", duration = 0.789 },
  ["212"] = { filename = "212.ogg", duration = 0.816 },
  ["213"] = { filename = "213.ogg", duration = 0.819 },
  ["214"] = { filename = "214.ogg", duration = 0.810 },
  ["215"] = { filename = "215.ogg", duration = 0.830 },
  ["216"] = { filename = "216.ogg", duration = 0.894 },
  ["217"] = { filename = "217.ogg", duration = 0.911 },
  ["218"] = { filename = "218.ogg", duration = 0.993 },
  ["219"] = { filename = "219.ogg", duration = 0.871 },
  ["220"] = { filename = "220.ogg", duration = 1.138 },
  ["221"] = { filename = "221.ogg", duration = 0.906 },
  ["222"] = { filename = "222.ogg", duration = 0.981 },
  ["223"] = { filename = "223.ogg", duration = 0.845 },
  ["224"] = { filename = "224.ogg", duration = 0.882 },
  ["225"] = { filename = "225.ogg", duration = 0.914 },
  ["226"] = { filename = "226.ogg", duration = 0.940 },
  ["227"] = { filename = "227.ogg", duration = 0.940 },
  ["228"] = { filename = "228.ogg", duration = 0.911 },
  ["229"] = { filename = "229.ogg", duration = 0.882 },
  ["230"] = { filename = "230.ogg", duration = 0.920 },
  ["231"] = { filename = "231.ogg", duration = 0.940 },
  ["232"] = { filename = "232.ogg", duration = 0.926 },
  ["233"] = { filename = "233.ogg", duration = 0.943 },
  ["234"] = { filename = "234.ogg", duration = 0.917 },
  ["235"] = { filename = "235.ogg", duration = 0.949 },
  ["236"] = { filename = "236.ogg", duration = 0.956 },
  ["237"] = { filename = "237.ogg", duration = 0.964 },
  ["238"] = { filename = "238.ogg", duration = 0.938 },
  ["239"] = { filename = "239.ogg", duration = 0.917 },
  ["240"] = { filename = "240.ogg", duration = 0.932 },
  ["241"] = { filename = "241.ogg", duration = 0.940 },
  ["242"] = { filename = "242.ogg", duration = 0.958 },
  ["243"] = { filename = "243.ogg", duration = 0.958 },
  ["244"] = { filename = "244.ogg", duration = 0.961 },
  ["245"] = { filename = "245.ogg", duration = 0.943 },
  ["246"] = { filename = "246.ogg", duration = 0.917 },
  ["247"] = { filename = "247.ogg", duration = 0.949 },
  ["248"] = { filename = "248.ogg", duration = 0.969 },
  ["249"] = { filename = "249.ogg", duration = 0.914 },
  ["250"] = { filename = "250.ogg", duration = 0.914 },
  ["251"] = { filename = "251.ogg", duration = 0.964 },
  ["252"] = { filename = "252.ogg", duration = 0.955 },
  ["253"] = { filename = "253.ogg", duration = 0.943 },
  ["254"] = { filename = "254.ogg", duration = 0.926 },
  ["255"] = { filename = "255.ogg", duration = 0.938 },
  ["256"] = { filename = "256.ogg", duration = 0.901 },
  ["257"] = { filename = "257.ogg", duration = 0.967 },
  ["258"] = { filename = "258.ogg", duration = 0.958 },
  ["259"] = { filename = "259.ogg", duration = 0.964 },
  ["260"] = { filename = "260.ogg", duration = 0.888 },
  ["261"] = { filename = "261.ogg", duration = 0.888 },
  ["262"] = { filename = "262.ogg", duration = 0.856 },
  ["263"] = { filename = "263.ogg", duration = 0.911 },
  ["264"] = { filename = "264.ogg", duration = 0.865 },
  ["265"] = { filename = "265.ogg", duration = 0.877 },
  ["266"] = { filename = "266.ogg", duration = 0.888 },
  ["267"] = { filename = "267.ogg", duration = 0.943 },
  ["268"] = { filename = "268.ogg", duration = 0.935 },
  ["269"] = { filename = "269.ogg", duration = 0.792 },
  ["270"] = { filename = "270.ogg", duration = 1.083 },
  ["271"] = { filename = "271.ogg", duration = 0.981 },
  ["272"] = { filename = "272.ogg", duration = 0.961 },
  ["273"] = { filename = "273.ogg", duration = 0.998 },
  ["274"] = { filename = "274.ogg", duration = 0.952 },
  ["275"] = { filename = "275.ogg", duration = 0.975 },
  ["276"] = { filename = "276.ogg", duration = 1.013 },
  ["277"] = { filename = "277.ogg", duration = 1.112 },
  ["278"] = { filename = "278.ogg", duration = 1.004 },
  ["279"] = { filename = "279.ogg", duration = 0.935 },
  ["280"] = { filename = "280.ogg", duration = 1.071 },
  ["281"] = { filename = "281.ogg", duration = 0.923 },
  ["282"] = { filename = "282.ogg", duration = 0.914 },
  ["283"] = { filename = "283.ogg", duration = 0.969 },
  ["284"] = { filename = "284.ogg", duration = 0.935 },
  ["285"] = { filename = "285.ogg", duration = 0.961 },
  ["286"] = { filename = "286.ogg", duration = 0.958 },
  ["287"] = { filename = "287.ogg", duration = 0.993 },
  ["288"] = { filename = "288.ogg", duration = 0.990 },
  ["289"] = { filename = "289.ogg", duration = 0.943 },
  ["290"] = { filename = "290.ogg", duration = 0.917 },
  ["291"] = { filename = "291.ogg", duration = 0.920 },
  ["292"] = { filename = "292.ogg", duration = 0.914 },
  ["293"] = { filename = "293.ogg", duration = 0.958 },
  ["294"] = { filename = "294.ogg", duration = 0.932 },
  ["295"] = { filename = "295.ogg", duration = 0.938 },
  ["296"] = { filename = "296.ogg", duration = 0.834 },
  ["297"] = { filename = "297.ogg", duration = 0.946 },
  ["298"] = { filename = "298.ogg", duration = 0.969 },
  ["299"] = { filename = "299.ogg", duration = 0.888 },
  ["300"] = { filename = "300.ogg", duration = 1.039 },
  ["301"] = { filename = "301.ogg", duration = 0.961 },
  ["302"] = { filename = "302.ogg", duration = 0.955 },
  ["303"] = { filename = "303.ogg", duration = 0.935 },
  ["304"] = { filename = "304.ogg", duration = 0.920 },
  ["305"] = { filename = "305.ogg", duration = 0.969 },
  ["306"] = { filename = "306.ogg", duration = 0.984 },
  ["307"] = { filename = "307.ogg", duration = 1.083 },
  ["308"] = { filename = "308.ogg", duration = 0.961 },
  ["309"] = { filename = "309.ogg", duration = 0.932 },
  ["310"] = { filename = "310.ogg", duration = 0.938 },
  ["311"] = { filename = "311.ogg", duration = 0.819 },
  ["312"] = { filename = "312.ogg", duration = 0.839 },
  ["313"] = { filename = "313.ogg", duration = 0.791 },
  ["314"] = { filename = "314.ogg", duration = 0.792 },
  ["315"] = { filename = "315.ogg", duration = 0.861 },
  ["316"] = { filename = "316.ogg", duration = 0.839 },
  ["317"] = { filename = "317.ogg", duration = 0.946 },
  ["318"] = { filename = "318.ogg", duration = 0.961 },
  ["319"] = { filename = "319.ogg", duration = 0.785 },
  ["320"] = { filename = "320.ogg", duration = 0.938 },
  ["321"] = { filename = "321.ogg", duration = 0.961 },
  ["322"] = { filename = "322.ogg", duration = 0.830 },
  ["323"] = { filename = "323.ogg", duration = 0.980 },
  ["324"] = { filename = "324.ogg", duration = 0.906 },
  ["325"] = { filename = "325.ogg", duration = 0.943 },
  ["326"] = { filename = "326.ogg", duration = 0.839 },
  ["327"] = { filename = "327.ogg", duration = 0.775 },
  ["328"] = { filename = "328.ogg", duration = 0.940 },
  ["329"] = { filename = "329.ogg", duration = 0.911 },
  ["330"] = { filename = "330.ogg", duration = 0.967 },
  ["331"] = { filename = "331.ogg", duration = 0.871 },
  ["332"] = { filename = "332.ogg", duration = 0.958 },
  ["333"] = { filename = "333.ogg", duration = 0.911 },
  ["334"] = { filename = "334.ogg", duration = 0.887 },
  ["335"] = { filename = "335.ogg", duration = 0.877 },
  ["336"] = { filename = "336.ogg", duration = 0.972 },
  ["337"] = { filename = "337.ogg", duration = 0.943 },
  ["338"] = { filename = "338.ogg", duration = 0.961 },
  ["339"] = { filename = "339.ogg", duration = 0.795 },
  ["340"] = { filename = "340.ogg", duration = 0.932 },
  ["341"] = { filename = "341.ogg", duration = 0.891 },
  ["342"] = { filename = "342.ogg", duration = 0.877 },
  ["343"] = { filename = "343.ogg", duration = 0.894 },
  ["344"] = { filename = "344.ogg", duration = 0.792 },
  ["345"] = { filename = "345.ogg", duration = 0.972 },
  ["346"] = { filename = "346.ogg", duration = 0.856 },
  ["347"] = { filename = "347.ogg", duration = 0.938 },
  ["348"] = { filename = "348.ogg", duration = 0.967 },
  ["349"] = { filename = "349.ogg", duration = 0.789 },
  ["350"] = { filename = "350.ogg", duration = 0.943 },
  ["351"] = { filename = "351.ogg", duration = 0.821 },
  ["352"] = { filename = "352.ogg", duration = 0.984 },
  ["353"] = { filename = "353.ogg", duration = 0.819 },
  ["354"] = { filename = "354.ogg", duration = 0.787 },
  ["355"] = { filename = "355.ogg", duration = 0.882 },
  ["356"] = { filename = "356.ogg", duration = 0.961 },
  ["357"] = { filename = "357.ogg", duration = 0.969 },
  ["358"] = { filename = "358.ogg", duration = 0.975 },
  ["359"] = { filename = "359.ogg", duration = 0.836 },
  ["360"] = { filename = "360.ogg", duration = 0.996 }
}

AI_ATC_SoundFiles.RangeControl.Heading = {
  ["000"] = { filename = "360.ogg", duration = 1.007 },
  ["001"] = { filename = "001.ogg", duration = 0.882 },
  ["002"] = { filename = "002.ogg", duration = 0.969 },
  ["003"] = { filename = "003.ogg", duration = 0.998 },
  ["004"] = { filename = "004.ogg", duration = 1.009 },
  ["005"] = { filename = "005.ogg", duration = 1.010 },
  ["006"] = { filename = "006.ogg", duration = 1.132 },
  ["007"] = { filename = "007.ogg", duration = 1.023 },
  ["008"] = { filename = "008.ogg", duration = 0.907 },
  ["009"] = { filename = "009.ogg", duration = 0.884 },
  ["010"] = { filename = "010.ogg", duration = 0.978 },
  ["011"] = { filename = "011.ogg", duration = 0.781 },
  ["012"] = { filename = "012.ogg", duration = 0.859 },
  ["013"] = { filename = "013.ogg", duration = 0.903 },
  ["014"] = { filename = "014.ogg", duration = 0.904 },
  ["015"] = { filename = "015.ogg", duration = 0.919 },
  ["016"] = { filename = "016.ogg", duration = 1.033 },
  ["017"] = { filename = "017.ogg", duration = 0.891 },
  ["018"] = { filename = "018.ogg", duration = 0.781 },
  ["019"] = { filename = "019.ogg", duration = 0.789 },
  ["020"] = { filename = "020.ogg", duration = 0.982 },
  ["021"] = { filename = "021.ogg", duration = 0.845 },
  ["022"] = { filename = "022.ogg", duration = 0.846 },
  ["023"] = { filename = "023.ogg", duration = 0.888 },
  ["024"] = { filename = "024.ogg", duration = 0.906 },
  ["025"] = { filename = "025.ogg", duration = 0.924 },
  ["026"] = { filename = "026.ogg", duration = 1.030 },
  ["027"] = { filename = "027.ogg", duration = 0.916 },
  ["028"] = { filename = "028.ogg", duration = 0.820 },
  ["029"] = { filename = "029.ogg", duration = 0.877 },
  ["030"] = { filename = "030.ogg", duration = 1.001 },
  ["031"] = { filename = "031.ogg", duration = 0.865 },
  ["032"] = { filename = "032.ogg", duration = 0.882 },
  ["033"] = { filename = "033.ogg", duration = 0.901 },
  ["034"] = { filename = "034.ogg", duration = 0.924 },
  ["035"] = { filename = "035.ogg", duration = 0.932 },
  ["036"] = { filename = "036.ogg", duration = 1.051 },
  ["037"] = { filename = "037.ogg", duration = 0.951 },
  ["038"] = { filename = "038.ogg", duration = 0.833 },
  ["039"] = { filename = "039.ogg", duration = 0.911 },
  ["040"] = { filename = "040.ogg", duration = 1.023 },
  ["041"] = { filename = "041.ogg", duration = 0.871 },
  ["042"] = { filename = "042.ogg", duration = 0.901 },
  ["043"] = { filename = "043.ogg", duration = 0.932 },
  ["044"] = { filename = "044.ogg", duration = 0.932 },
  ["045"] = { filename = "045.ogg", duration = 0.946 },
  ["046"] = { filename = "046.ogg", duration = 1.084 },
  ["047"] = { filename = "047.ogg", duration = 0.949 },
  ["048"] = { filename = "048.ogg", duration = 0.824 },
  ["049"] = { filename = "049.ogg", duration = 0.848 },
  ["050"] = { filename = "050.ogg", duration = 1.027 },
  ["051"] = { filename = "051.ogg", duration = 0.842 },
  ["052"] = { filename = "052.ogg", duration = 0.927 },
  ["053"] = { filename = "053.ogg", duration = 0.940 },
  ["054"] = { filename = "054.ogg", duration = 0.958 },
  ["055"] = { filename = "055.ogg", duration = 0.968 },
  ["056"] = { filename = "056.ogg", duration = 1.097 },
  ["057"] = { filename = "057.ogg", duration = 0.910 },
  ["058"] = { filename = "058.ogg", duration = 0.856 },
  ["059"] = { filename = "059.ogg", duration = 0.865 },
  ["060"] = { filename = "060.ogg", duration = 1.014 },
  ["061"] = { filename = "061.ogg", duration = 0.882 },
  ["062"] = { filename = "062.ogg", duration = 0.916 },
  ["063"] = { filename = "063.ogg", duration = 0.926 },
  ["064"] = { filename = "064.ogg", duration = 0.968 },
  ["065"] = { filename = "065.ogg", duration = 0.971 },
  ["066"] = { filename = "066.ogg", duration = 1.065 },
  ["067"] = { filename = "067.ogg", duration = 0.958 },
  ["068"] = { filename = "068.ogg", duration = 0.906 },
  ["069"] = { filename = "069.ogg", duration = 0.891 },
  ["070"] = { filename = "070.ogg", duration = 1.077 },
  ["071"] = { filename = "071.ogg", duration = 0.845 },
  ["072"] = { filename = "072.ogg", duration = 0.929 },
  ["073"] = { filename = "073.ogg", duration = 0.984 },
  ["074"] = { filename = "074.ogg", duration = 0.996 },
  ["075"] = { filename = "075.ogg", duration = 1.022 },
  ["076"] = { filename = "076.ogg", duration = 1.133 },
  ["077"] = { filename = "077.ogg", duration = 1.026 },
  ["078"] = { filename = "078.ogg", duration = 0.856 },
  ["079"] = { filename = "079.ogg", duration = 0.884 },
  ["080"] = { filename = "080.ogg", duration = 0.943 },
  ["081"] = { filename = "081.ogg", duration = 0.971 },
  ["082"] = { filename = "082.ogg", duration = 0.839 },
  ["083"] = { filename = "083.ogg", duration = 0.866 },
  ["084"] = { filename = "084.ogg", duration = 0.895 },
  ["085"] = { filename = "085.ogg", duration = 0.900 },
  ["086"] = { filename = "086.ogg", duration = 1.019 },
  ["087"] = { filename = "087.ogg", duration = 0.878 },
  ["088"] = { filename = "088.ogg", duration = 0.787 },
  ["089"] = { filename = "089.ogg", duration = 0.800 },
  ["090"] = { filename = "090.ogg", duration = 0.990 },
  ["091"] = { filename = "091.ogg", duration = 0.848 },
  ["092"] = { filename = "092.ogg", duration = 0.868 },
  ["093"] = { filename = "093.ogg", duration = 0.861 },
  ["094"] = { filename = "094.ogg", duration = 0.917 },
  ["095"] = { filename = "095.ogg", duration = 0.927 },
  ["096"] = { filename = "096.ogg", duration = 1.051 },
  ["097"] = { filename = "097.ogg", duration = 0.887 },
  ["098"] = { filename = "098.ogg", duration = 0.788 },
  ["099"] = { filename = "099.ogg", duration = 0.810 },
  ["100"] = { filename = "100.ogg", duration = 1.068 },
  ["101"] = { filename = "101.ogg", duration = 0.775 },
  ["102"] = { filename = "102.ogg", duration = 0.768 },
  ["103"] = { filename = "103.ogg", duration = 0.874 },
  ["104"] = { filename = "104.ogg", duration = 0.930 },
  ["105"] = { filename = "105.ogg", duration = 0.932 },
  ["106"] = { filename = "106.ogg", duration = 1.059 },
  ["107"] = { filename = "107.ogg", duration = 0.897 },
  ["108"] = { filename = "108.ogg", duration = 0.810 },
  ["109"] = { filename = "109.ogg", duration = 0.820 },
  ["110"] = { filename = "110.ogg", duration = 1.081 },
  ["111"] = { filename = "111.ogg", duration = 0.807 },
  ["112"] = { filename = "112.ogg", duration = 0.895 },
  ["113"] = { filename = "113.ogg", duration = 0.935 },
  ["114"] = { filename = "114.ogg", duration = 0.962 },
  ["115"] = { filename = "115.ogg", duration = 0.964 },
  ["116"] = { filename = "116.ogg", duration = 1.115 },
  ["117"] = { filename = "117.ogg", duration = 0.887 },
  ["118"] = { filename = "118.ogg", duration = 0.794 },
  ["119"] = { filename = "119.ogg", duration = 0.814 },
  ["120"] = { filename = "120.ogg", duration = 1.074 },
  ["121"] = { filename = "121.ogg", duration = 0.774 },
  ["122"] = { filename = "122.ogg", duration = 0.882 },
  ["123"] = { filename = "123.ogg", duration = 0.945 },
  ["124"] = { filename = "124.ogg", duration = 0.938 },
  ["125"] = { filename = "125.ogg", duration = 0.977 },
  ["126"] = { filename = "126.ogg", duration = 1.104 },
  ["127"] = { filename = "127.ogg", duration = 0.910 },
  ["128"] = { filename = "128.ogg", duration = 0.846 },
  ["129"] = { filename = "129.ogg", duration = 0.836 },
  ["130"] = { filename = "130.ogg", duration = 0.988 },
  ["131"] = { filename = "131.ogg", duration = 0.760 },
  ["132"] = { filename = "132.ogg", duration = 0.859 },
  ["133"] = { filename = "133.ogg", duration = 0.897 },
  ["134"] = { filename = "134.ogg", duration = 0.908 },
  ["135"] = { filename = "135.ogg", duration = 0.907 },
  ["136"] = { filename = "136.ogg", duration = 1.026 },
  ["137"] = { filename = "137.ogg", duration = 0.840 },
  ["138"] = { filename = "138.ogg", duration = 0.797 },
  ["139"] = { filename = "139.ogg", duration = 0.791 },
  ["140"] = { filename = "140.ogg", duration = 1.019 },
  ["141"] = { filename = "141.ogg", duration = 0.756 },
  ["142"] = { filename = "142.ogg", duration = 0.874 },
  ["143"] = { filename = "143.ogg", duration = 0.888 },
  ["144"] = { filename = "144.ogg", duration = 0.910 },
  ["145"] = { filename = "145.ogg", duration = 0.924 },
  ["146"] = { filename = "146.ogg", duration = 1.049 },
  ["147"] = { filename = "147.ogg", duration = 0.855 },
  ["148"] = { filename = "148.ogg", duration = 0.794 },
  ["149"] = { filename = "149.ogg", duration = 0.803 },
  ["150"] = { filename = "150.ogg", duration = 1.017 },
  ["151"] = { filename = "151.ogg", duration = 0.820 },
  ["152"] = { filename = "152.ogg", duration = 0.911 },
  ["153"] = { filename = "153.ogg", duration = 0.919 },
  ["154"] = { filename = "154.ogg", duration = 0.959 },
  ["155"] = { filename = "155.ogg", duration = 0.968 },
  ["156"] = { filename = "156.ogg", duration = 1.090 },
  ["157"] = { filename = "157.ogg", duration = 0.874 },
  ["158"] = { filename = "158.ogg", duration = 0.833 },
  ["159"] = { filename = "159.ogg", duration = 0.853 },
  ["160"] = { filename = "160.ogg", duration = 1.012 },
  ["161"] = { filename = "161.ogg", duration = 0.821 },
  ["162"] = { filename = "162.ogg", duration = 0.923 },
  ["163"] = { filename = "163.ogg", duration = 0.898 },
  ["164"] = { filename = "164.ogg", duration = 0.936 },
  ["165"] = { filename = "165.ogg", duration = 0.929 },
  ["166"] = { filename = "166.ogg", duration = 1.038 },
  ["167"] = { filename = "167.ogg", duration = 0.832 },
  ["168"] = { filename = "168.ogg", duration = 0.833 },
  ["169"] = { filename = "169.ogg", duration = 0.834 },
  ["170"] = { filename = "170.ogg", duration = 1.048 },
  ["171"] = { filename = "171.ogg", duration = 0.833 },
  ["172"] = { filename = "172.ogg", duration = 0.938 },
  ["173"] = { filename = "173.ogg", duration = 0.987 },
  ["174"] = { filename = "174.ogg", duration = 0.991 },
  ["175"] = { filename = "175.ogg", duration = 0.993 },
  ["176"] = { filename = "176.ogg", duration = 1.138 },
  ["177"] = { filename = "177.ogg", duration = 0.952 },
  ["178"] = { filename = "178.ogg", duration = 0.833 },
  ["179"] = { filename = "179.ogg", duration = 0.853 },
  ["180"] = { filename = "180.ogg", duration = 0.878 },
  ["181"] = { filename = "181.ogg", duration = 0.644 },
  ["182"] = { filename = "182.ogg", duration = 0.755 },
  ["183"] = { filename = "183.ogg", duration = 0.798 },
  ["184"] = { filename = "184.ogg", duration = 0.804 },
  ["185"] = { filename = "185.ogg", duration = 0.819 },
  ["186"] = { filename = "186.ogg", duration = 0.933 },
  ["187"] = { filename = "187.ogg", duration = 0.756 },
  ["188"] = { filename = "188.ogg", duration = 0.689 },
  ["189"] = { filename = "189.ogg", duration = 0.701 },
  ["190"] = { filename = "190.ogg", duration = 0.967 },
  ["191"] = { filename = "191.ogg", duration = 0.726 },
  ["192"] = { filename = "192.ogg", duration = 0.840 },
  ["193"] = { filename = "193.ogg", duration = 0.856 },
  ["194"] = { filename = "194.ogg", duration = 0.894 },
  ["195"] = { filename = "195.ogg", duration = 0.901 },
  ["196"] = { filename = "196.ogg", duration = 1.020 },
  ["197"] = { filename = "197.ogg", duration = 0.819 },
  ["198"] = { filename = "198.ogg", duration = 0.755 },
  ["199"] = { filename = "199.ogg", duration = 0.756 },
  ["200"] = { filename = "200.ogg", duration = 0.994 },
  ["201"] = { filename = "201.ogg", duration = 0.850 },
  ["202"] = { filename = "202.ogg", duration = 0.908 },
  ["203"] = { filename = "203.ogg", duration = 0.942 },
  ["204"] = { filename = "204.ogg", duration = 0.951 },
  ["205"] = { filename = "205.ogg", duration = 0.948 },
  ["206"] = { filename = "206.ogg", duration = 1.086 },
  ["207"] = { filename = "207.ogg", duration = 0.942 },
  ["208"] = { filename = "208.ogg", duration = 0.836 },
  ["209"] = { filename = "209.ogg", duration = 0.820 },
  ["210"] = { filename = "210.ogg", duration = 0.907 },
  ["211"] = { filename = "211.ogg", duration = 0.733 },
  ["212"] = { filename = "212.ogg", duration = 0.774 },
  ["213"] = { filename = "213.ogg", duration = 0.816 },
  ["214"] = { filename = "214.ogg", duration = 0.833 },
  ["215"] = { filename = "215.ogg", duration = 0.837 },
  ["216"] = { filename = "216.ogg", duration = 0.962 },
  ["217"] = { filename = "217.ogg", duration = 0.842 },
  ["218"] = { filename = "218.ogg", duration = 0.686 },
  ["219"] = { filename = "219.ogg", duration = 0.708 },
  ["220"] = { filename = "220.ogg", duration = 0.895 },
  ["221"] = { filename = "221.ogg", duration = 0.753 },
  ["222"] = { filename = "222.ogg", duration = 0.772 },
  ["223"] = { filename = "223.ogg", duration = 0.803 },
  ["224"] = { filename = "224.ogg", duration = 0.817 },
  ["225"] = { filename = "225.ogg", duration = 0.820 },
  ["226"] = { filename = "226.ogg", duration = 0.959 },
  ["227"] = { filename = "227.ogg", duration = 0.803 },
  ["228"] = { filename = "228.ogg", duration = 0.715 },
  ["229"] = { filename = "229.ogg", duration = 0.704 },
  ["230"] = { filename = "230.ogg", duration = 0.900 },
  ["231"] = { filename = "231.ogg", duration = 0.778 },
  ["232"] = { filename = "232.ogg", duration = 0.792 },
  ["233"] = { filename = "233.ogg", duration = 0.813 },
  ["234"] = { filename = "234.ogg", duration = 0.821 },
  ["235"] = { filename = "235.ogg", duration = 0.846 },
  ["236"] = { filename = "236.ogg", duration = 0.958 },
  ["237"] = { filename = "237.ogg", duration = 0.840 },
  ["238"] = { filename = "238.ogg", duration = 0.723 },
  ["239"] = { filename = "239.ogg", duration = 0.727 },
  ["240"] = { filename = "240.ogg", duration = 0.924 },
  ["241"] = { filename = "241.ogg", duration = 0.785 },
  ["242"] = { filename = "242.ogg", duration = 0.792 },
  ["243"] = { filename = "243.ogg", duration = 0.837 },
  ["244"] = { filename = "244.ogg", duration = 0.850 },
  ["245"] = { filename = "245.ogg", duration = 0.848 },
  ["246"] = { filename = "246.ogg", duration = 0.985 },
  ["247"] = { filename = "247.ogg", duration = 0.842 },
  ["248"] = { filename = "248.ogg", duration = 0.731 },
  ["249"] = { filename = "249.ogg", duration = 0.733 },
  ["250"] = { filename = "250.ogg", duration = 0.942 },
  ["251"] = { filename = "251.ogg", duration = 0.730 },
  ["252"] = { filename = "252.ogg", duration = 0.820 },
  ["253"] = { filename = "253.ogg", duration = 0.859 },
  ["254"] = { filename = "254.ogg", duration = 0.869 },
  ["255"] = { filename = "255.ogg", duration = 0.872 },
  ["256"] = { filename = "256.ogg", duration = 0.998 },
  ["257"] = { filename = "257.ogg", duration = 0.863 },
  ["258"] = { filename = "258.ogg", duration = 0.824 },
  ["259"] = { filename = "259.ogg", duration = 0.781 },
  ["260"] = { filename = "260.ogg", duration = 0.940 },
  ["261"] = { filename = "261.ogg", duration = 0.819 },
  ["262"] = { filename = "262.ogg", duration = 0.846 },
  ["263"] = { filename = "263.ogg", duration = 0.846 },
  ["264"] = { filename = "264.ogg", duration = 0.881 },
  ["265"] = { filename = "265.ogg", duration = 0.878 },
  ["266"] = { filename = "266.ogg", duration = 0.990 },
  ["267"] = { filename = "267.ogg", duration = 0.813 },
  ["268"] = { filename = "268.ogg", duration = 0.803 },
  ["269"] = { filename = "269.ogg", duration = 0.797 },
  ["270"] = { filename = "270.ogg", duration = 0.988 },
  ["271"] = { filename = "271.ogg", duration = 0.760 },
  ["272"] = { filename = "272.ogg", duration = 0.863 },
  ["273"] = { filename = "273.ogg", duration = 0.907 },
  ["274"] = { filename = "274.ogg", duration = 0.913 },
  ["275"] = { filename = "275.ogg", duration = 0.935 },
  ["276"] = { filename = "276.ogg", duration = 1.067 },
  ["277"] = { filename = "277.ogg", duration = 0.946 },
  ["278"] = { filename = "278.ogg", duration = 0.779 },
  ["279"] = { filename = "279.ogg", duration = 0.794 },
  ["280"] = { filename = "280.ogg", duration = 0.859 },
  ["281"] = { filename = "281.ogg", duration = 0.734 },
  ["282"] = { filename = "282.ogg", duration = 0.753 },
  ["283"] = { filename = "283.ogg", duration = 0.791 },
  ["284"] = { filename = "284.ogg", duration = 0.826 },
  ["285"] = { filename = "285.ogg", duration = 0.816 },
  ["286"] = { filename = "286.ogg", duration = 0.955 },
  ["287"] = { filename = "287.ogg", duration = 0.816 },
  ["288"] = { filename = "288.ogg", duration = 0.707 },
  ["289"] = { filename = "289.ogg", duration = 0.715 },
  ["290"] = { filename = "290.ogg", duration = 0.914 },
  ["291"] = { filename = "291.ogg", duration = 0.702 },
  ["292"] = { filename = "292.ogg", duration = 0.781 },
  ["293"] = { filename = "293.ogg", duration = 0.816 },
  ["294"] = { filename = "294.ogg", duration = 0.839 },
  ["295"] = { filename = "295.ogg", duration = 0.862 },
  ["296"] = { filename = "296.ogg", duration = 0.981 },
  ["297"] = { filename = "297.ogg", duration = 0.839 },
  ["298"] = { filename = "298.ogg", duration = 0.705 },
  ["299"] = { filename = "299.ogg", duration = 0.723 },
  ["300"] = { filename = "300.ogg", duration = 1.155 },
  ["301"] = { filename = "301.ogg", duration = 0.871 },
  ["302"] = { filename = "302.ogg", duration = 0.942 },
  ["303"] = { filename = "303.ogg", duration = 0.980 },
  ["304"] = { filename = "304.ogg", duration = 0.991 },
  ["305"] = { filename = "305.ogg", duration = 1.029 },
  ["306"] = { filename = "306.ogg", duration = 1.139 },
  ["307"] = { filename = "307.ogg", duration = 1.025 },
  ["308"] = { filename = "308.ogg", duration = 0.885 },
  ["309"] = { filename = "309.ogg", duration = 0.895 },
  ["310"] = { filename = "310.ogg", duration = 0.965 },
  ["311"] = { filename = "311.ogg", duration = 0.760 },
  ["312"] = { filename = "312.ogg", duration = 0.843 },
  ["313"] = { filename = "313.ogg", duration = 0.885 },
  ["314"] = { filename = "314.ogg", duration = 0.881 },
  ["315"] = { filename = "315.ogg", duration = 0.917 },
  ["316"] = { filename = "316.ogg", duration = 1.030 },
  ["317"] = { filename = "317.ogg", duration = 0.878 },
  ["318"] = { filename = "318.ogg", duration = 0.762 },
  ["319"] = { filename = "319.ogg", duration = 0.779 },
  ["320"] = { filename = "320.ogg", duration = 0.959 },
  ["321"] = { filename = "321.ogg", duration = 0.760 },
  ["322"] = { filename = "322.ogg", duration = 0.826 },
  ["323"] = { filename = "323.ogg", duration = 0.866 },
  ["324"] = { filename = "324.ogg", duration = 0.868 },
  ["325"] = { filename = "325.ogg", duration = 0.908 },
  ["326"] = { filename = "326.ogg", duration = 1.022 },
  ["327"] = { filename = "327.ogg", duration = 0.871 },
  ["328"] = { filename = "328.ogg", duration = 0.784 },
  ["329"] = { filename = "329.ogg", duration = 0.789 },
  ["330"] = { filename = "330.ogg", duration = 0.956 },
  ["331"] = { filename = "331.ogg", duration = 0.827 },
  ["332"] = { filename = "332.ogg", duration = 0.861 },
  ["333"] = { filename = "333.ogg", duration = 0.882 },
  ["334"] = { filename = "334.ogg", duration = 0.901 },
  ["335"] = { filename = "335.ogg", duration = 0.900 },
  ["336"] = { filename = "336.ogg", duration = 1.032 },
  ["337"] = { filename = "337.ogg", duration = 0.890 },
  ["338"] = { filename = "338.ogg", duration = 0.782 },
  ["339"] = { filename = "339.ogg", duration = 0.803 },
  ["340"] = { filename = "340.ogg", duration = 1.004 },
  ["341"] = { filename = "341.ogg", duration = 0.872 },
  ["342"] = { filename = "342.ogg", duration = 0.874 },
  ["343"] = { filename = "343.ogg", duration = 0.903 },
  ["344"] = { filename = "344.ogg", duration = 0.923 },
  ["345"] = { filename = "345.ogg", duration = 0.930 },
  ["346"] = { filename = "346.ogg", duration = 1.064 },
  ["347"] = { filename = "347.ogg", duration = 0.919 },
  ["348"] = { filename = "348.ogg", duration = 0.797 },
  ["349"] = { filename = "349.ogg", duration = 0.816 },
  ["350"] = { filename = "350.ogg", duration = 1.012 },
  ["351"] = { filename = "351.ogg", duration = 0.807 },
  ["352"] = { filename = "352.ogg", duration = 0.901 },
  ["353"] = { filename = "353.ogg", duration = 0.894 },
  ["354"] = { filename = "354.ogg", duration = 0.943 },
  ["355"] = { filename = "355.ogg", duration = 0.984 },
  ["356"] = { filename = "356.ogg", duration = 1.071 },
  ["357"] = { filename = "357.ogg", duration = 0.881 },
  ["358"] = { filename = "358.ogg", duration = 0.827 },
  ["359"] = { filename = "359.ogg", duration = 0.849 },
  ["360"] = { filename = "360.ogg", duration = 1.007 },
}

AI_ATC_SoundFiles.Ground.FlightLevel = {
  ["40"] = { filename = "40.ogg", duration = 0.871 },
}

AI_ATC_SoundFiles.Departure.FlightLevel = {
  ["10"] = { filename = "10.ogg", duration = 0.865 },
  ["20"] = { filename = "20.ogg", duration = 0.795 },
  ["30"] = { filename = "30.ogg", duration = 0.848 },
  ["40"] = { filename = "40.ogg", duration = 0.871 },
  ["50"] = { filename = "50.ogg", duration = 0.917 },
  ["60"] = { filename = "60.ogg", duration = 0.850 },
  ["70"] = { filename = "70.ogg", duration = 0.940 },
  ["80"] = { filename = "80.ogg", duration = 0.862 },
  ["90"] = { filename = "90.ogg", duration = 0.959 },
  ["100"] = { filename = "100.ogg", duration = 1.196 },
  ["110"] = { filename = "110.ogg", duration = 0.987 },
  ["120"] = { filename = "120.ogg", duration = 0.981 },
  ["130"] = { filename = "130.ogg", duration = 1.039 },
  ["140"] = { filename = "140.ogg", duration = 1.027 },
  ["150"] = { filename = "150.ogg", duration = 1.028 },
  ["160"] = { filename = "160.ogg", duration = 1.022 },
  ["170"] = { filename = "170.ogg", duration = 1.173 },
  ["180"] = { filename = "180.ogg", duration = 1.052 },
  ["190"] = { filename = "190.ogg", duration = 0.936 },
  ["200"] = { filename = "200.ogg", duration = 1.103 },
  ["210"] = { filename = "210.ogg", duration = 0.913 },
  ["220"] = { filename = "220.ogg", duration = 1.025 },
  ["230"] = { filename = "230.ogg", duration = 0.951 },
  ["240"] = { filename = "240.ogg", duration = 0.949 },
  ["250"] = { filename = "250.ogg", duration = 0.942 },
  ["260"] = { filename = "260.ogg", duration = 0.901 },
  ["270"] = { filename = "270.ogg", duration = 1.100 },
  ["280"] = { filename = "280.ogg", duration = 0.984 },
  ["290"] = { filename = "290.ogg", duration = 0.934 },
  ["300"] = { filename = "300.ogg", duration = 1.062 },
}

AI_ATC_SoundFiles.RangeControl.FlightLevel = {
  ["10"] = { filename = "10.ogg", duration = 0.720 },
  ["20"] = { filename = "20.ogg", duration = 0.639 },
  ["30"] = { filename = "30.ogg", duration = 0.705 },
  ["40"] = { filename = "40.ogg", duration = 0.871 },
  ["50"] = { filename = "50.ogg", duration = 0.740 },
  ["60"] = { filename = "60.ogg", duration = 0.784 },
  ["70"] = { filename = "70.ogg", duration = 0.859 },
  ["80"] = { filename = "80.ogg", duration = 0.688 },
  ["90"] = { filename = "90.ogg", duration = 0.737 },
  ["100"] = { filename = "100.ogg", duration = 1.196 },
  ["110"] = { filename = "110.ogg", duration = 0.862 },
  ["120"] = { filename = "120.ogg", duration = 0.850 },
  ["130"] = { filename = "130.ogg", duration = 0.871 },
  ["140"] = { filename = "140.ogg", duration = 0.893 },
  ["150"] = { filename = "150.ogg", duration = 0.943 },
  ["160"] = { filename = "160.ogg", duration = 0.969 },
  ["170"] = { filename = "170.ogg", duration = 0.993 },
  ["180"] = { filename = "180.ogg", duration = 0.792 },
  ["190"] = { filename = "190.ogg", duration = 0.906 },
  ["200"] = { filename = "200.ogg", duration = 0.935 },
  ["210"] = { filename = "210.ogg", duration = 0.836 },
  ["220"] = { filename = "220.ogg", duration = 0.807 },
  ["230"] = { filename = "230.ogg", duration = 0.839 },
  ["240"] = { filename = "240.ogg", duration = 0.874 },
  ["250"] = { filename = "250.ogg", duration = 0.894 },
  ["260"] = { filename = "260.ogg", duration = 0.871 },
  ["270"] = { filename = "270.ogg", duration = 0.906 },
  ["280"] = { filename = "280.ogg", duration = 0.795 },
  ["290"] = { filename = "290.ogg", duration = 0.888 },
  ["300"] = { filename = "300.ogg", duration = 0.996 },
}

AI_ATC_SoundFiles.Departure.Numerical = {
  ["."] = { filename = "Departure_Decimal.ogg", duration = 0.477 },
  ["0"] = { filename = "Departure_0.ogg", duration = 0.511 },
  ["1"] = { filename = "Departure_1.ogg", duration = 0.325 },
  ["2"] = { filename = "Departure_2.ogg", duration = 0.365 },
  ["3"] = { filename = "Departure_3.ogg", duration = 0.337 },
  ["4"] = { filename = "Departure_4.ogg", duration = 0.372 },
  ["5"] = { filename = "Departure_5.ogg", duration = 0.391 },
  ["6"] = { filename = "Departure_6.ogg", duration = 0.453},
  ["7"] = { filename = "Departure_7.ogg", duration = 0.511 },
  ["8"] = { filename = "Departure_8.ogg", duration = 0.414 },
  ["9"] = { filename = "Departure_9.ogg", duration = 0.430 },
  ["10"] = { filename = "Departure_10.ogg", duration = 0.441 },
  ["11"] = { filename = "Departure_11.ogg", duration = 0.592 },
  ["12"] = { filename = "Departure_12.ogg", duration = 0.430 },
  ["100"] = { filename = "Departure_100.ogg", duration = 0.636 },
  ["200"] = { filename = "Departure_200.ogg", duration = 0.737 },
  ["300"] = { filename = "Departure_300.ogg", duration = 0.639 },
  ["400"] = { filename = "Departure_400.ogg", duration = 0.598 },
  ["500"] = { filename = "Departure_500.ogg", duration = 0.615 },
  ["600"] = { filename = "Departure_600.ogg", duration = 0.668 },
  ["700"] = { filename = "Departure_700.ogg", duration = 0.821 },
  ["800"] = { filename = "Departure_800.ogg", duration = 0.717 },
  ["900"] = { filename = "Departure_900.ogg", duration = 0.647 },
  ["Thousand"] = { filename = "Departure_Thousand.ogg", duration = 0.595 },
}

AI_ATC_SoundFiles.Ground.CallsignsNumerical = {
  ["11"] = {filename = "OneOne.ogg", duration = 0.495},
  ["12"] = {filename = "OneTwo.ogg", duration = 0.563},
  ["13"] = {filename = "OneThree.ogg", duration = 0.627},
  ["14"] = {filename = "OneFour.ogg", duration = 0.621},
  ["21"] = {filename = "TwoOne.ogg", duration = 0.492},
  ["22"] = {filename = "TwoTwo.ogg", duration = 0.565},
  ["23"] = {filename = "TwoThree.ogg", duration = 0.540},
  ["24"] = {filename = "TwoFour.ogg", duration = 0.542},
  ["31"] = {filename = "ThreeOne.ogg", duration = 0.543},
  ["32"] = {filename = "ThreeTwo.ogg", duration = 0.549},
  ["33"] = {filename = "ThreeThree.ogg", duration = 0.580},
  ["34"] = {filename = "ThreeFour.ogg", duration = 0.598},
  ["41"] = {filename = "FourOne.ogg", duration = 0.499},
  ["42"] = {filename = "FourTwo.ogg", duration = 0.549},
  ["43"] = {filename = "FourThree.ogg", duration = 0.607},
  ["44"] = {filename = "FourFour.ogg", duration = 0.578},
  ["51"] = {filename = "FiveOne.ogg", duration = 0.446},
  ["52"] = {filename = "FiveTwo.ogg", duration = 0.580},
  ["53"] = {filename = "FiveThree.ogg", duration = 0.659},
  ["54"] = {filename = "FiveFour.ogg", duration = 0.665},
  ["61"] = {filename = "SixOne.ogg", duration = 0.656},
  ["62"] = {filename = "SixTwo.ogg", duration = 0.615},
  ["63"] = {filename = "SixThree.ogg", duration = 0.688},
  ["64"] = {filename = "SixFour.ogg", duration = 0.700},
  ["71"] = {filename = "SevenOne.ogg", duration = 0.711},
  ["72"] = {filename = "SevenTwo.ogg", duration = 0.752},
  ["73"] = {filename = "SevenThree.ogg", duration = 0.810},
  ["74"] = {filename = "SevenFour.ogg", duration = 0.758},
  ["81"] = {filename = "EightOne.ogg", duration = 0.493},
  ["82"] = {filename = "EightTwo.ogg", duration = 0.540},
  ["83"] = {filename = "EightThree.ogg", duration = 0.560},
  ["84"] = {filename = "EightFour.ogg", duration = 0.505},
  ["91"] = {filename = "NineOne.ogg", duration = 0.589},
  ["92"] = {filename = "NineTwo.ogg", duration = 0.659},
  ["93"] = {filename = "NineThree.ogg", duration = 0.705},
  ["94"] = {filename = "NineFour.ogg", duration = 0.734},
  ["1 flight"] = {filename = "OneFlight.ogg", duration = 0.755},
  ["2 flight"] = {filename = "TwoFlight.ogg", duration = 0.659},
  ["3 flight"] = {filename = "ThreeFlight.ogg", duration = 0.746},
  ["4 flight"] = {filename = "FourFlight.ogg", duration = 0.698},
  ["5 flight"] = {filename = "FiveFlight.ogg", duration = 0.807},
  ["6 flight"] = {filename = "SixFlight.ogg", duration = 0.789},
  ["7 flight"] = {filename = "SevenFlight.ogg", duration = 0.940},
  ["8 flight"] = {filename = "EightFlight.ogg", duration = 0.662},
  ["9 flight"] = {filename = "NineFlight.ogg", duration = 0.776},
}

AI_ATC_SoundFiles.Clearance.CallsignsNumerical = {
  ["11"] = {filename = "OneOne.ogg", duration = 0.480},
  ["12"] = {filename = "OneTwo.ogg", duration = 0.604},
  ["13"] = {filename = "OneThree.ogg", duration = 0.731},
  ["14"] = {filename = "OneFour.ogg", duration = 0.755},
  ["21"] = {filename = "TwoOne.ogg", duration = 0.755},
  ["22"] = {filename = "TwoTwo.ogg", duration = 0.602},
  ["23"] = {filename = "TwoThree.ogg", duration = 0.685},
  ["24"] = {filename = "TwoFour.ogg", duration = 0.792},
  ["31"] = {filename = "ThreeOne.ogg", duration = 0.657},
  ["32"] = {filename = "ThreeTwo.ogg", duration = 0.615},
  ["33"] = {filename = "ThreeThree.ogg", duration = 0.673},
  ["34"] = {filename = "ThreeFour.ogg", duration = 0.792},
  ["41"] = {filename = "FourOne.ogg", duration = 0.784},
  ["42"] = {filename = "FourTwo.ogg", duration = 0.647},
  ["43"] = {filename = "FourThree.ogg", duration = 0.627},
  ["44"] = {filename = "FourFour.ogg", duration = 0.801},
  ["51"] = {filename = "FiveOne.ogg", duration = 0.644},
  ["52"] = {filename = "FiveTwo.ogg", duration = 0.784},
  ["53"] = {filename = "FiveThree.ogg", duration = 0.662},
  ["54"] = {filename = "FiveFour.ogg", duration = 0.708},
  ["61"] = {filename = "SixOne.ogg", duration = 0.717},
  ["62"] = {filename = "SixTwo.ogg", duration = 0.695},
  ["63"] = {filename = "SixThree.ogg", duration = 0.729},
  ["64"] = {filename = "SixFour.ogg", duration = 0.628},
  ["71"] = {filename = "SevenOne.ogg", duration = 0.756},
  ["72"] = {filename = "SevenTwo.ogg", duration = 0.827},
  ["73"] = {filename = "SevenThree.ogg", duration = 0.720},
  ["74"] = {filename = "SevenFour.ogg", duration = 0.731},
  ["81"] = {filename = "EightOne.ogg", duration = 0.653},
  ["82"] = {filename = "EightTwo.ogg", duration = 0.737},
  ["83"] = {filename = "EightThree.ogg", duration = 0.604},
  ["84"] = {filename = "EightFour.ogg", duration = 0.708},
  ["91"] = {filename = "NineOne.ogg", duration = 0.662},
  ["92"] = {filename = "NineTwo.ogg", duration = 0.653},
  ["93"] = {filename = "NineThree.ogg", duration = 0.778},
  ["94"] = {filename = "NineFour.ogg", duration = 0.845},
  ["1 flight"] = {filename = "OneFlight.ogg", duration = 0.592},
  ["2 flight"] = {filename = "TwoFlight.ogg", duration = 0.580},
  ["3 flight"] = {filename = "ThreeFlight.ogg", duration = 0.615},
  ["4 flight"] = {filename = "FourFlight.ogg", duration = 0.621},
  ["5 flight"] = {filename = "FiveFlight.ogg", duration = 0.595},
  ["6 flight"] = {filename = "SixFlight.ogg", duration = 0.592},
  ["7 flight"] = {filename = "SevenFlight.ogg", duration = 0.641},
  ["8 flight"] = {filename = "EightFlight.ogg", duration = 0.589},
  ["9 flight"] = {filename = "NineFlight.ogg", duration = 0.633},
}
    
AI_ATC_SoundFiles.Departure.CallsignsNumerical = {
  ["11"] = {filename = "OneOne.ogg", duration = 0.612},
  ["12"] = {filename = "OneTwo.ogg", duration = 0.578},
  ["13"] = {filename = "OneThree.ogg", duration = 0.580},
  ["14"] = {filename = "OneFour.ogg", duration = 0.610},
  ["21"] = {filename = "TwoOne.ogg", duration = 0.639},
  ["22"] = {filename = "TwoTwo.ogg", duration = 0.598},
  ["23"] = {filename = "TwoThree.ogg", duration = 0.615},
  ["24"] = {filename = "TwoFour.ogg", duration = 0.592},
  ["31"] = {filename = "ThreeOne.ogg", duration = 0.634},
  ["32"] = {filename = "ThreeTwo.ogg", duration = 0.624},
  ["33"] = {filename = "ThreeThree.ogg", duration = 0.633},
  ["34"] = {filename = "ThreeFour.ogg", duration = 0.612},
  ["41"] = {filename = "FourOne.ogg", duration = 0.641},
  ["42"] = {filename = "FourTwo.ogg", duration = 0.636},
  ["43"] = {filename = "FourThree.ogg", duration = 0.668},
  ["44"] = {filename = "FourFour.ogg", duration = 0.653},
  ["51"] = {filename = "FiveOne.ogg", duration = 0.668},
  ["52"] = {filename = "FiveTwo.ogg", duration = 0.679},
  ["53"] = {filename = "FiveThree.ogg", duration = 0.662},
  ["54"] = {filename = "FiveFour.ogg", duration = 0.641},
  ["61"] = {filename = "SixOne.ogg", duration = 0.708},
  ["62"] = {filename = "SixTwo.ogg", duration = 0.668},
  ["63"] = {filename = "SixThree.ogg", duration = 0.691},
  ["64"] = {filename = "SixFour.ogg", duration = 0.679},
  ["71"] = {filename = "SevenOne.ogg", duration = 0.830},
  ["72"] = {filename = "SevenTwo.ogg", duration = 0.842},
  ["73"] = {filename = "SevenThree.ogg", duration = 0.850},
  ["74"] = {filename = "SevenFour.ogg", duration = 0.833},
  ["81"] = {filename = "EightOne.ogg", duration = 0.618},
  ["82"] = {filename = "EightTwo.ogg", duration = 0.607},
  ["83"] = {filename = "EightThree.ogg", duration = 0.630},
  ["84"] = {filename = "EightFour.ogg", duration = 0.612},
  ["91"] = {filename = "NineOne.ogg", duration = 0.634},
  ["92"] = {filename = "NineTwo.ogg", duration = 0.639},
  ["93"] = {filename = "NineThree.ogg", duration = 0.645},
  ["94"] = {filename = "NineFour.ogg", duration = 0.679},
  ["1 flight"] = {filename = "OneFlight.ogg", duration = 0.670},
  ["2 flight"] = {filename = "TwoFlight.ogg", duration = 0.601},
  ["3 flight"] = {filename = "ThreeFlight.ogg", duration = 0.707},
  ["4 flight"] = {filename = "FourFlight.ogg", duration = 0.778},
  ["5 flight"] = {filename = "FiveFlight.ogg", duration = 0.734},
  ["6 flight"] = {filename = "SixFlight.ogg", duration = 0.668},
  ["7 flight"] = {filename = "SevenFlight.ogg", duration = 0.807},
  ["8 flight"] = {filename = "EightFlight.ogg", duration = 0.623},
  ["9 flight"] = {filename = "NineFlight.ogg", duration = 0.714},
}

AI_ATC_SoundFiles.RangeControl.CallsignsNumerical = {
  ["11"] = {filename = "OneOne.ogg", duration = 0.417},
  ["12"] = {filename = "OneTwo.ogg", duration = 0.560},
  ["13"] = {filename = "OneThree.ogg", duration = 0.569},
  ["14"] = {filename = "OneFour.ogg", duration = 0.566},
  ["21"] = {filename = "TwoOne.ogg", duration = 0.524},
  ["22"] = {filename = "TwoTwo.ogg", duration = 0.528},
  ["23"] = {filename = "TwoThree.ogg", duration = 0.567},
  ["24"] = {filename = "TwoFour.ogg", duration = 0.586},
  ["31"] = {filename = "ThreeOne.ogg", duration = 0.586},
  ["32"] = {filename = "ThreeTwo.ogg", duration = 0.586},
  ["33"] = {filename = "ThreeThree.ogg", duration = 0.615},
  ["34"] = {filename = "ThreeFour.ogg", duration = 0.640},
  ["41"] = {filename = "FourOne.ogg", duration = 0.580},
  ["42"] = {filename = "FourTwo.ogg", duration = 0.580},
  ["43"] = {filename = "FourThree.ogg", duration = 0.650},
  ["44"] = {filename = "FourFour.ogg", duration = 0.679},
  ["51"] = {filename = "FiveOne.ogg", duration = 0.562},
  ["52"] = {filename = "FiveTwo.ogg", duration = 0.652},
  ["53"] = {filename = "FiveThree.ogg", duration = 0.681},
  ["54"] = {filename = "FiveFour.ogg", duration = 0.718},
  ["61"] = {filename = "SixOne.ogg", duration = 0.618},
  ["62"] = {filename = "SixTwo.ogg", duration = 0.647},
  ["63"] = {filename = "SixThree.ogg", duration = 0.657},
  ["64"] = {filename = "SixFour.ogg", duration = 0.685},
  ["71"] = {filename = "SevenOne.ogg", duration = 0.594},
  ["72"] = {filename = "SevenTwo.ogg", duration = 0.686},
  ["73"] = {filename = "SevenThree.ogg", duration = 0.726},
  ["74"] = {filename = "SevenFour.ogg", duration = 0.749},
  ["81"] = {filename = "EightOne.ogg", duration = 0.504},
  ["82"] = {filename = "EightTwo.ogg", duration = 0.525},
  ["83"] = {filename = "EightThree.ogg", duration = 0.567},
  ["84"] = {filename = "EightFour.ogg", duration = 0.594},
  ["91"] = {filename = "NineOne.ogg", duration = 0.530},
  ["92"] = {filename = "NineTwo.ogg", duration = 0.599},
  ["93"] = {filename = "NineThree.ogg", duration = 0.653},
  ["94"] = {filename = "NineFour.ogg", duration = 0.682},
}
  
AI_ATC_SoundFiles.Departure.Oclock = {
  ["1"] = { filename = "OneOclock.ogg", duration = 0.720 },
  ["2"] = { filename = "TwoOclock.ogg", duration = 0.766 },
  ["3"] = { filename = "ThreeOclock.ogg", duration = 0.813 },
  ["4"] = { filename = "FourOclock.ogg", duration = 0.813 },
  ["5"] = { filename = "FiveOclock.ogg", duration = 0.813 },
  ["6"] = { filename = "SixOclock.ogg", duration = 0.813},
  ["7"] = { filename = "SevenOclock.ogg", duration = 0.752 },
  ["8"] = { filename = "EightOclock.ogg", duration = 0.743 },
  ["9"] = { filename = "NineOclock.ogg", duration = 0.801 },
  ["10"] = { filename = "TenOclock.ogg", duration = 0.755 },
  ["11"] = { filename = "ElevenOclock.ogg", duration = 0.906 },
  ["12"] = { filename = "TwelveOclock.ogg", duration = 0.731 },
  }

AI_ATC_SoundFiles.ATIS.Direction = {
  ["L"] = {filename = "Left.ogg", duration = 0.467},
  ["R"] = {filename = "Right.ogg", duration = 0.430}
  }

AI_ATC_SoundFiles.Ground.Direction = {
  ["L"] = {filename = "Left.ogg", duration = 0.400},
  ["R"] = {filename = "Right.ogg", duration = 0.430}
  }
  
AI_ATC_SoundFiles.Departure.Direction = {
  ["L"] = {filename = "Left.ogg", duration = 0.418},
  ["R"] = {filename = "Right.ogg", duration = 0.347}
  }
  
AI_ATC_SoundFiles.Departure.Cardinal = {
  ["North"] = {filename = "NorthBound.ogg", duration = 0.650},
  ["North-East"] = {filename = "NorthEastBound.ogg", duration = 0.848},
  ["East"] = {filename = "EastBound.ogg", duration = 0.662},
  ["South-East"] = {filename = "SouthEastBound.ogg", duration = 0.871},
  ["South"] = {filename = "SouthBound.ogg", duration = 0.778},
  ["South-West"] = {filename = "SouthWestBound.ogg", duration = 0.858},
  ["West"] = {filename = "WestBound.ogg", duration = 0.630},
  ["North-West"] = {filename = "NorthWestBound.ogg", duration = 0.859},
  }
AI_ATC_SoundFiles.Departure.Cardinal2 = {
  ["North"] = {filename = "North.ogg", duration = 0.833},
  ["North-East"] = {filename = "NorthEast.ogg", duration = 1.042},
  ["East"] = {filename = "East.ogg", duration = 0.662},
  ["South-East"] = {filename = "SouthEast.ogg", duration = 1.100},
  ["South"] = {filename = "South.ogg", duration = 0.848},
  ["South-West"] = {filename = "SouthWest.ogg", duration = 1.135},
  ["West"] = {filename = "West.ogg", duration = 0.855},
  ["North-West"] = {filename = "NorthWest.ogg", duration = 1.126},
  }
  
AI_ATC_SoundFiles.Ground.Runway = {
  ["03L"] = {filename = "03L.ogg", duration = 1.062},
  ["03R"] = {filename = "03R.ogg", duration = 0.981},
  ["06L"] = {filename = "06L.ogg", duration = 1.080},
  ["06R"] = {filename = "06R.ogg", duration = 1.080},
  ["21L"] = {filename = "21L.ogg", duration = 0.868},
  ["21R"] = {filename = "21R.ogg", duration = 0.842},
  ["24L"] = {filename = "24L.ogg", duration = 0.859},
  ["24R"] = {filename = "24R.ogg", duration = 0.824},
  }
  
AI_ATC_SoundFiles.Departure.Runway = {
  ["03L"] = {filename = "03L.ogg", duration = 0.998},
  ["03R"] = {filename = "03R.ogg", duration = 0.917},
  ["06L"] = {filename = "06L.ogg", duration = 1.010},
  ["06R"] = {filename = "06R.ogg", duration = 0.917},
  ["21L"] = {filename = "21L.ogg", duration = 0.842},
  ["21R"] = {filename = "21R.ogg", duration = 0.766},
  ["24L"] = {filename = "24L.ogg", duration = 0.824},
  ["24R"] = {filename = "24R.ogg", duration = 0.959},
  }
  
AI_ATC_SoundFiles.Departure.SID = {
  ["DREAM 7"] = {filename = "DREAM_7.ogg", duration = 1.283},
  ["FYTTR 7"] = {filename = "FYTTR_7.ogg", duration = 1.443},
  ["MORMON MESA 8"] = {filename = "MORMAN_8.ogg", duration = 1.415},
  }
  
AI_ATC_SoundFiles.Departure.VFR = {
  ["FLEX"] = {filename = "DepartFLEX.ogg", duration = 1.498, Subtitle = "Depart FLEX at or below 4000"},
  ["DREAM"] = {filename = "DREAM.ogg", duration = 1.567, Subtitle = "Depart FLEX direct DREAM"},
  ["FYTTR"] = {filename = "FYTTR.ogg", duration = 1.695, Subtitle = "Depart FLEX direct FYTTR"},
  ["MORMON MESA"] = {filename = "DREAM.ogg", duration = 1.567, Subtitle = "Depart FLEX direct DREAM"},
  ["GASS_PEAK"] = {filename = "GASSPEAK.ogg", duration = 1.062, Subtitle = "GASS PEAK Departure. Remain at or below 500 until clear of class B airspace."},
  ["Dry Lake"] = {filename = "DryLake.ogg", duration = 1.115, Subtitle = "Dry Lake Departure. Remain at or below 500 until clear of class B airspace."},
  ["Red Horse"] = {filename = "RedHorse.ogg", duration = 1.138, Subtitle = "Red Horse Departure. Remain at or below 500 until clear of class B airspace."},
  ["Sunrise"] = {filename = "GASSPEAK.ogg", duration = 1.161, Subtitle = "Sunrise Departure. Remain at or below 500 until clear of class B airspace."},
  }

AI_ATC_SoundFiles.Departure.NavPoint = {
  ["FOVEM"] = {filename = "FOVEM.ogg", duration = 0.546},
  ["ARKEE"] = {filename = "ARKEE.ogg", duration = 0.569},
  ["HURUG"] = {filename = "HURUG.ogg", duration = 0.607},
  ["FOMOD"] = {filename = "FOMOD.ogg", duration = 0.557},
  ["ITUME"] = {filename = "ITUME.ogg", duration = 0.614},
  ["ADTIN"] = {filename = "ADTIN.ogg", duration = 0.580},
  ["COLMA"] = {filename = "COLMA.ogg", duration = 0.493},
  ["FAXEL"] = {filename = "FAXEL.ogg", duration = 0.511},
  ["WELKU"] = {filename = "WELKU.ogg", duration = 0.554},
  ["OKIBE"] = {filename = "OKIBE.ogg", duration = 0.563},
  ["BAVAC"] = {filename = "BAVAC.ogg", duration = 0.554},
  ["EVEBE"] = {filename = "EVEBE.ogg", duration = 0.644},
  ["JIPRO"] = {filename = "JIPRO.ogg", duration = 0.453},
  ["LOGLE"] = {filename = "LOGLE.ogg", duration = 0.517},
  ["JORUN"] = {filename = "JORUN.ogg", duration = 0.505},
  ["HILRI"] = {filename = "HILRI.ogg", duration = 0.525},
  ["ANIKA"] = {filename = "ANIKA.ogg", duration = 0.615},
  ["SULUE"] = {filename = "SULUE.ogg", duration = 0.514},
  ["PANNS"] = {filename = "PANNS.ogg", duration = 0.441},
  ["WESOK"] = {filename = "WESOK.ogg", duration = 0.508},
  ["ACUYU"] = {filename = "ACUYU.ogg", duration = 0.569},
  ["FABED"] = {filename = "FABED.ogg", duration = 0.592},
  ["HASRA"] = {filename = "HASRA.ogg", duration = 0.485},
  ["INIME"] = {filename = "INIME.ogg", duration = 0.641},
  ["KATNE"] = {filename = "KATNE.ogg", duration = 0.604},
  ["WELKU"] = {filename = "WELKU.ogg", duration = 0.557},
  ["ILS"] = {filename = "ILS.ogg", duration = 0.847},
  ["TACAN"]= {filename = "TACAN.ogg", duration = 0.615},
  ["Andersen AFB"] = {filename = "Andersen AFB.ogg", duration = 1.428},
  ["Antonio B. Won Pat Intl"] = {filename = "Antonio B. Won Pat Intl.ogg", duration = 1.469},
  ["North West Field"] = {filename = "North West Field.ogg", duration = 0.795},
  ["Olf Orote"] = {filename = "Olf Orote.ogg", duration = 1.033},
  ["Pagan Airstrip"] = {filename = "Pagan Airstrip.ogg", duration = 0.961},
  ["Rota Intl"] = {filename = "Rota Intl.ogg", duration = 1.440},
  ["Saipan Intl"] = {filename = "Saipan Intl.ogg", duration = 1.608},
  ["Tinian Intl"] = {filename = "Tinian Intl.ogg", duration = 1.570},
}


AI_ATC_SoundFiles.ATIS.PhoneticAlphabet = {
  ["A"] = "Alpha",
  ["B"] = "Bravo",
  ["C"] = "Charlie",
  ["D"] = "Delta",
  ["E"] = "Echo",
  ["F"] = "Foxtrot",
  ["G"] = "Golf",
  ["H"] = "Hotel",
  ["I"] = "India",
  ["J"] = "Juliet",
  ["K"] = "Kilo",
  ["L"] = "Lima",
  ["M"] = "Mike",
  ["N"] = "November",
  ["O"] = "Oscar",
  ["P"] = "Papa",
  ["Q"] = "Quebec",
  ["R"] = "Romeo",
  ["S"] = "Sierra",
  ["T"] = "Tango",
  ["U"] = "Uniform",
  ["V"] = "Victor",
  ["W"] = "Whiskey",
  ["X"] = "Xray",
  ["Y"] = "Yankee",
  ["Z"] = "Zulu",
  }
  
AI_ATC_SoundFiles.ATIS.Phonetic = {
  Alpha = { filename = "Alpha.ogg", duration = 0.467 },
  Bravo = { filename = "Bravo.ogg", duration = 0.569 },
  Charlie = { filename = "Charlie.ogg", duration = 0.580 },
  Delta = { filename = "Delta.ogg", duration = 0.514 },
  Echo = { filename = "Echo.ogg", duration = 0.477 },
  Foxtrot = { filename = "Foxtrot.ogg", duration = 0.758 },
  Golf = { filename = "Golf.ogg", duration = 0.528 },
  Hotel = { filename = "Hotel.ogg", duration = 0.594 },
  India = { filename = "India.ogg", duration = 0.530 },
  Juliet = { filename = "Juliet.ogg", duration = 0.665 },
  Kilo = { filename = "Kilo.ogg", duration = 0.540 },
  Lima = { filename = "Lima.ogg", duration = 0.438 },
  Mike = { filename = "Mike.ogg", duration = 0.431 },
  November = { filename = "November.ogg", duration = 0.639 },
  Oscar = { filename = "Oscar.ogg", duration = 0.559 },
  Papa = { filename = "Papa.ogg", duration = 0.418 },
  Quebec = { filename = "Quebec.ogg", duration = 0.549 },
  Romeo = { filename = "Romeo.ogg", duration = 0.618 },
  Sierra = { filename = "Sierra.ogg", duration = 0.573 },
  Tango = { filename = "Tango.ogg", duration = 0.607 },
  Uniform = { filename = "Uniform.ogg", duration = 0.715 },
  Victor = { filename = "Victor.ogg", duration = 0.538 },
  Whiskey = { filename = "Whiskey.ogg", duration = 0.575 },
  Xray = { filename = "Xray.ogg", duration = 0.669 },
  Yankee = { filename = "Yankee.ogg", duration = 0.583 },
  Zulu = { filename = "Zulu.ogg", duration = 0.592 },
}
  
AI_ATC_SoundFiles.Ground.Phonetic = {
  Alpha = { filename = "Ground_Alpha.ogg", duration = 0.390 },
  Bravo = { filename = "Ground_Bravo.ogg", duration = 0.354 },
  Charlie = { filename = "Ground_Charlie.ogg", duration = 0.434 },
  Delta = { filename = "Ground_Delta.ogg", duration = 0.387 },
  Echo = { filename = "Ground_Echo.ogg", duration = 0.357 },
  Foxtrot = { filename = "Ground_Foxtrot.ogg", duration = 0.599 },
  Golf = { filename = "Ground_Golf.ogg", duration = 0.357 },
  Hotel = { filename = "Ground_Hotel.ogg", duration = 0.418 },
  India = { filename = "Ground_India.ogg", duration = 0.351 },
  Juliet = { filename = "Ground_Juliet.ogg", duration = 0.451 },
  Kilo = { filename = "Ground_Kilo.ogg", duration = 0.357 },
  Lima = { filename = "Ground_Lima.ogg", duration = 0.327 },
  Mike = { filename = "Ground_Mike.ogg", duration = 0.369 },
  November = { filename = "Ground_November.ogg", duration = 0.501 },
  Oscar = { filename = "Ground_Oscar.ogg", duration = 0.419 },
  Papa = { filename = "Ground_Papa.ogg", duration = 0.349 },
  Quebec = { filename = "Ground_Quebec.ogg", duration = 0.418 },
  Romeo = { filename = "Ground_Romeo.ogg", duration = 0.392 },
  Sierra = { filename = "Ground_Sierra.ogg", duration = 0.453 },
  Tango = { filename = "Ground_Tango.ogg", duration = 0.391 },
  Uniform = { filename = "Ground_Uniform.ogg", duration = 0.438 },
  Victor = { filename = "Ground_Victor.ogg", duration = 0.366 },
  Whiskey = { filename = "Ground_Whiskey.ogg", duration = 0.383 },
  Xray = { filename = "Ground_Xray.ogg", duration = 0.453 },
  Yankee = { filename = "Ground_Yankee.ogg", duration = 0.430 },
  Zulu = { filename = "Ground_Zulu.ogg", duration = 0.430 },
}

AI_ATC_SoundFiles.Ground.Aircraft = {
  ["Mi-28N"] = { filename = "Helo.ogg", duration = 0.673 },
  ["UH-60A"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Mi-24V"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Mi-8MT"] = { filename = "Helo.ogg", duration = 0.673 },
  ["CH-53E"] = { filename = "Helo.ogg", duration = 0.673 },
  ["SA342L"] = { filename = "Helo.ogg", duration = 0.673 },
  ["AH-64A"] = { filename = "Helo.ogg", duration = 0.673 },
  ["AH-64D"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Ka-50_3"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Ka-27"] = { filename = "Helo.ogg", duration = 0.673 },
  ["UH-1H"] = { filename = "Helo.ogg", duration = 0.673 },
  ["OH-58D"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Mi-24P"] = { filename = "Helo.ogg", duration = 0.673 },
  ["SH-60B"] = { filename = "Helo.ogg", duration = 0.673 },
  ["SA342Minigun"] = { filename = "Helo.ogg", duration = 0.673 },
  ["CH-47Fbl1"] = { filename = "Helo.ogg", duration = 0.673 },
  ["SA342Mistral"] = { filename = "Helo.ogg", duration = 0.673 },
  ["OH58D"] = { filename = "Helo.ogg", duration = 0.673 },
  ["SA342M"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Ka-50"] = { filename = "Helo.ogg", duration = 0.673 },
  ["AH-64D_BLK_II"] = { filename = "Helo.ogg", duration = 0.673 },
  ["AH-1W"] = { filename = "Helo.ogg", duration = 0.673 },
  ["CH-47D"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Mi-26"] = { filename = "Helo.ogg", duration = 0.673 },
  ["A-10A"] = { filename = "A10.ogg", duration = 0.430 },
  ["A-10C"] = { filename = "A10.ogg", duration = 0.430 },
  ["A-10C_2"] = { filename = "A10.ogg", duration = 0.430 },
  ["AJS37"] = { filename = "AJS37.ogg", duration = 0.300 },
  ["AV8BNA"] = { filename = "AV8B.ogg", duration = 0.615 },
  ["B-1B"] = { filename = "B1B.ogg", duration = 0.350 },
  ["B-52H"] = { filename = "B52.ogg", duration = 0.662 },
  ["C-101CC"] = { filename = "C101.ogg", duration = 0.673 },
  ["C-101EB"] = { filename = "C101.ogg", duration = 0.673 },
  ["F-117A"] = { filename = "F117.ogg", duration = 0.882 },
  ["F-4E"] = { filename = "F4E.ogg", duration = 0.500 },
  ["F-4E-45MC"] = { filename = "F4E.ogg", duration = 0.500 },
  ["F-5E"] = { filename = "F5E.ogg", duration = 0.580 },
  ["F-5E-3"] = { filename = "F5E.ogg", duration = 0.580 },
  ["F-14A"] = { filename = "F14.ogg", duration = 0.592 },
  ["F-14A-135-GR"] = { filename = "F14.ogg", duration = 0.592 },
  ["F-14B"] = { filename = "F14.ogg", duration = 0.592 },
  ["F-15C"] = { filename = "F15.ogg", duration = 0.557 },
  ["F-15E"] = { filename = "F15.ogg", duration = 0.557 },
  ["F-15ESE"] = { filename = "F15.ogg", duration = 0.557 },
  ["F-16A"] = { filename = "F16.ogg", duration = 0.627 },
  ["F-16A MLU"] = { filename = "F16.ogg", duration = 0.627 },
  ["F-16C bl.50"] = { filename = "F16.ogg", duration = 0.627 },
  ["F-16C bl.52d"] = { filename = "F16.ogg", duration = 0.627 },
  ["F-16C_50"] = { filename = "F16.ogg", duration = 0.627 },
  ["FA-18A"] = { filename = "F18.ogg", duration = 0.511 },
  ["FA-18C"] = { filename = "F18.ogg", duration = 0.511 },
  ["FA-18C_hornet"] = { filename = "F18.ogg", duration = 0.511 },
  ["F-86F Sabre"] = { filename = "F86.ogg", duration = 0.824 },
  ["J-11A"] = { filename = "J11.ogg", duration = 0.557 },
  ["JF-17"] = { filename = "JF17.ogg", duration = 0.917 },
  ["L-39C"] = { filename = "L39.ogg", duration = 0.720 },
  ["L-39ZA"] = { filename = "L39.ogg", duration = 0.720 },
  ["Mirage-F1B"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1BD"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1BE"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1BQ"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1C"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CE"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1C-200"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CG"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CH"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CJ"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CK"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CR"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CT"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CZ"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1DDA"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1ED"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1EE"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1EH"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1EQ"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1jA"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1M-CE"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1M-EE"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["M-2000C"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["MB-339A"] = { filename = "MB339.ogg", duration = 1.03 },
  ["MB-339A/PAN"] = { filename = "MB339.ogg", duration = 1.03 },
  ["MiG-15bis"] = { filename = "MIG15.ogg", duration = 0.604 },
  ["MiG-19P"] = { filename = "MIG19.ogg", duration = 0.627 },
  ["MiG-21Bis"] = { filename = "MIG21.ogg", duration = 0.673 },
  ["MiG-23LD"] = { filename = "MIG23.ogg", duration = 0.766 },
  ["MiG-25PD"] = { filename = "MIG25.ogg", duration = 0.906 },
  ["MiG-25RBT"] = { filename = "MIG25.ogg", duration = 0.906 },
  ["MiG-27K"] = { filename = "MIG27.ogg", duration = 0.789 },
  ["MiG-29A"] = { filename = "MIG29.ogg", duration = 0.766 },
  ["MiG-29G"] = { filename = "MIG29.ogg", duration = 0.766 },
  ["MiG-29S"] = { filename = "MIG29.ogg", duration = 0.766 },
  ["Su-17M4"] = { filename = "SU17.ogg", duration = 0.743 },
  ["Su-24M"] = { filename = "SU24.ogg", duration = 0.859 },
  ["Su-25"] = { filename = "SU25.ogg", duration = 0.882 },
  ["Su-25T"] = { filename = "SU25.ogg", duration = 0.882 },
  ["Su-25TM"] = { filename = "SU25.ogg", duration = 0.882 },
  ["Su-27"] = { filename = "SU27.ogg", duration = 0.857 },
  ["Su-30"] = { filename = "SU30.ogg", duration = 0.604 },
  ["Su-33"] = { filename = "SU33.ogg", duration = 0.801 },
  ["Su-34"] = { filename = "SU34.ogg", duration = 0.836 },
  ["Tornado GR4"] = { filename = "GR4.ogg", duration = 0.569 },
  ["Tornado IDS"] = { filename = "GR4.ogg", duration = 0.569 },
  ["Tu-22M3"] = { filename = "TU22.ogg", duration = 0.778 },
  ["A-4E-C"] = { filename = "A4.ogg", duration = 0.792 },
  ["T-45"] = { filename = "T45.ogg", duration = 0.923 },
  ["T-38C"] = { filename = "T38.ogg", duration = 0.760 },
  ["F-22A"] = { filename = "F22.ogg", duration = 0.698 },
  ["F-35"] = { filename = "F35.ogg", duration = 0.792 },
  ["FA-18E"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["FA-18F"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["EA-18G"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["KC130"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["KC-135"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["KC135MPRS"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["S-3B Tanker"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["S-3B"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["C-17A"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["E-2C"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["IL-76MD"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Tu-22M3"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Tu-160"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Tu-95MS"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Yak-40"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["C-130"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["IL-78M"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["WingLoong-I"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["E-3A"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Tu-142"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["H-6J"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["An-30M"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["KJ-2000"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["An-26B"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["P-47D-30"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["Yak-52"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["Bf-109K-4"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["C-47"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["I-16"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["P-51D"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["P-47D-40"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["SpitfireLFMkIXCW"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["TF-51D"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["B-17G"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["Ju-88A4"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["MosquitoFBMkVI"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["Christen Eagle II"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["P-51D-30-NA"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["SpitfireLFMkIX"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["FW-190D9"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["FW-190A8"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["P-47D-30bl1"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["A-20G"] = { filename = "WarBird.ogg", duration = 0.482 }
}

AI_ATC_SoundFiles.Clearance.Callsigns = {
  ["Cylon"] = { filename = "Cylon.ogg", duration = 0.589 },
  ["Chaos"] = { filename = "Chaos.ogg", duration = 0.586 },
  ["Nightmare"] = { filename = "Nightmare.ogg", duration = 0.615 },
  ["Mig"] = { filename = "Mig.ogg", duration = 0.372 },
  ["Stalin"] = { filename = "Stalin.ogg", duration = 0.557 },
  ["Flanker"] = { filename = "Flanker.ogg", duration = 0.575 },
  ["Fulcrum"] = { filename = "Fulcrum.ogg", duration = 0.559 },
  ["Flogger"] = { filename = "Flogger.ogg", duration = 0.579 },
  ["Ivan"] = { filename = "Ivan.ogg", duration = 0.441 },
  ["GunFighter"] = { filename = "GunFighter.ogg", duration = 0.620 },
  ["Dragon"] = { filename = "Dragon.ogg", duration = 0.498 },
  ["Aspen"] = { filename = "Aspen.ogg", duration = 0.499 },
  ["Boar"] = { filename = "Boar.ogg", duration = 0.415 },
  ["Chevy"] = { filename = "Chevy.ogg", duration = 0.441 },
  ["Colt"] = { filename = "Colt.ogg", duration = 0.438 },
  ["Dodge"] = { filename = "Dodge.ogg", duration = 0.485 },
  ["Enfield"] = { filename = "Enfield.ogg", duration = 0.602 },
  ["Ford"] = { filename = "Ford.ogg", duration = 0.444 },
  ["Hawg"] = { filename = "Hawg.ogg", duration = 0.328 },
  ["Pig"] = { filename = "Pig.ogg", duration = 0.315 },
  ["Pontiac"] = { filename = "Pontiac.ogg", duration = 0.464 },
  ["Springfield"] = { filename = "Springfield.ogg", duration = 0.673 },
  ["Tusk"] = { filename = "Tusk.ogg", duration = 0.340 },
  ["Uzi"] = { filename = "Uzi.ogg", duration = 0.308 },
  ["Bone"] = { filename = "Bone.ogg", duration = 0.260 },
  ["Dark"] = { filename = "Dark.ogg", duration = 0.311 },
  ["Vader"] = { filename = "Vader.ogg", duration = 0.316 },
  ["Buff"] = { filename = "Buff.ogg", duration = 0.206 },
  ["Dump"] = { filename = "Dump.ogg", duration = 0.255 },
  ["Kenworth"] = { filename = "Kenworth.ogg", duration = 0.406 },
  ["Dude"] = { filename = "Dude.ogg", duration = 0.348 },
  ["Thud"] = { filename = "Thud.ogg", duration = 0.438 },
  ["Gunny"] = { filename = "Gunny.ogg", duration = 0.306 },
  ["Mad"] = { filename = "Mad.ogg", duration = 0.374 },
  ["Trek"] = { filename = "Trek.ogg", duration = 0.377 },
  ["Sniper"] = { filename = "Sniper.ogg", duration = 0.534 },
  ["Sled"] = { filename = "Sled.ogg", duration = 0.438 },
  ["Best"] = { filename = "Best.ogg", duration = 0.411 },
  ["Jazz"] = { filename = "Jazz.ogg", duration = 0.605 },
  ["Rage"] = { filename = "Rage.ogg", duration = 0.457 },
  ["Tahoe"] = { filename = "Tahoe.ogg", duration = 0.543 },
  ["Viper"] = { filename = "Viper.ogg", duration = 0.398 },
  ["Venom"] = { filename = "Venom.ogg", duration = 0.372 },
  ["Lobo"] = { filename = "Lobo.ogg", duration = 0.502 },
  ["Cowboy"] = { filename = "Cowboy.ogg", duration = 0.562 },
  ["Python"] = { filename = "Python.ogg", duration = 0.527 },
  ["Rattler"] = { filename = "Rattler.ogg", duration = 0.479 },
  ["Panther"] = { filename = "Panther.ogg", duration = 0.437 },
  ["Wolf"] = { filename = "Wolf.ogg", duration = 0.492 },
  ["Weasel"] = { filename = "Weasel.ogg", duration = 0.405 },
  ["Wild"] = { filename = "Wild.ogg", duration = 0.524 },
  ["Ninja"] = { filename = "Ninja.ogg", duration = 0.459 },
  ["Jedi"] = { filename = "Jedi.ogg", duration = 0.383 },
  ["Hornet"] = { filename = "Hornet.ogg", duration = 0.334 },
  ["Squid"] = { filename = "Squid.ogg", duration = 0.411 },
  ["Ragin"] = { filename = "Ragin.ogg", duration = 0.491 },
  ["Roman"] = { filename = "Roman.ogg", duration = 0.372 },
  ["Sting"] = { filename = "Sting.ogg", duration = 0.457 },
  ["Jury"] = { filename = "Jury.ogg", duration = 0.421 },
  ["Joker"] = { filename = "Joker.ogg", duration = 0.460 },
  ["Ram"] = { filename = "Ram.ogg", duration = 0.370 },
  ["Hawk"] = { filename = "Hawk.ogg", duration = 0.489 },
  ["Devil"] = { filename = "Devil.ogg", duration = 0.270 },
  ["Check"] = { filename = "Check.ogg", duration = 0.296 },
  ["Snake"] = { filename = "Snake.ogg", duration = 0.440 },
  ["Overlord"] = { filename = "Overlord.ogg", duration = 0.665 },
  ["Magic"] = { filename = "Magic.ogg", duration = 0.543 },
  ["Wizard"] = { filename = "Wizard.ogg", duration = 0.456 },
  ["Focus"] = { filename = "Focus.ogg", duration = 0.582 },
  ["Darkstar"] = { filename = "DarkStar.ogg", duration = 0.627 },
  ["BlackJack"] = { filename = "BlackJack.ogg", duration = 0.615 },
  ["Roulette"] = { filename = "Roulette.ogg", duration = 0.470 },
  ["Axeman"] = { filename = "Axeman.ogg", duration = 0.515 },
  ["Darknight"] = { filename = "Darknight.ogg", duration = 0.463 },
  ["Warrior"] = { filename = "Warrior.ogg", duration = 0.586 },
  ["Pointer"] = { filename = "Pointer.ogg", duration = 0.500 },
  ["Eyeball"] = { filename = "Eyeball.ogg", duration = 0.559 },
  ["Moonbeam"] = { filename = "Moonbeam.ogg", duration = 0.668 },
  ["Whiplash"] = { filename = "Whiplash.ogg", duration = 0.644 },
  ["Finger"] = { filename = "Finger.ogg", duration = 0.512 },
  ["Pinpoint"] = { filename = "Pinpoint.ogg", duration = 0.522 },
  ["Ferret"] = { filename = "Ferret.ogg", duration = 0.438 },
  ["Shaba"] = { filename = "Shaba.ogg", duration = 0.493 },
  ["Playboy"] = { filename = "Playboy.ogg", duration = 0.599 },
  ["Hammer"] = { filename = "Hammer.ogg", duration = 0.463 },
  ["Jaguar"] = { filename = "Jaguar.ogg", duration = 0.747 },
  ["Deathstar"] = { filename = "Deathstar.ogg", duration = 0.702 },
  ["Anvil"] = { filename = "Anvil.ogg", duration = 0.537 },
  ["Firefly"] = { filename = "Firefly.ogg", duration = 0.697 },
  ["Mantis"] = { filename = "Mantis.ogg", duration = 0.670 },
  ["Badger"] = { filename = "Badger.ogg", duration = 0.525 },
  ["Sauron"] = { filename = "Sauron.ogg", duration = 0.685 },
  ["Texaco"] = { filename = "Texaco.ogg", duration = 0.531 },
  ["Arco"] = { filename = "Arco.ogg", duration = 0.486 },
  ["Shell"] = { filename = "Shell.ogg", duration = 0.469 },
  ["Navy One"] = { filename = "NavyOne.ogg", duration = 0.731 },
  ["Mauler"] = { filename = "Mauler.ogg", duration = 0.525 },
  ["Blood Hound"] = { filename = "BloodHound.ogg", duration = 0.573 },
  ["ArmyAir"] = { filename = "ArmyAir.ogg", duration = 0.662 },
  ["Apache"] = { filename = "Apache.ogg", duration = 0.673 },
  ["Crow"] = { filename = "Crow.ogg", duration = 0.502 },
  ["Crow"] = { filename = "Crow.ogg", duration = 0.502 },
  ["Sioux"] = { filename = "Sioux.ogg", duration = 0.502 },
  ["Gatling"] = { filename = "Gatling.ogg", duration = 0.537 },
  ["Gunslinger"] = { filename = "Gunslinger.ogg", duration = 0.670 },
  ["Hammerhead"] = { filename = "Hammerhead.ogg", duration = 0.576 },
  ["Bootleg"] = { filename = "Bootleg.ogg", duration = 0.760 },
  ["Palehorse"] = { filename = "Palehorse.ogg", duration = 0.682 },
  ["Carnivore"] = { filename = "Carnivore.ogg", duration = 0.644 },
  ["Saber"] = { filename = "Saber.ogg", duration = 0.538 },
  ["Azrael"] = { filename = "Saber.ogg", duration = 0.697 },
  ["Bam-Bam"] = { filename = "Bam-Bam.ogg", duration = 0.592 },
  ["Burnin' Stogie"] = { filename = "Burnin' Stogie.ogg", duration = 0.813 },
  ["Crazyhorse"] = { filename = "Crazyhorse.ogg", duration = 0.871 },
  ["Crusader"] = { filename = "Crusader.ogg", duration = 0.580 },
  ["Darkhorse"] = { filename = "Darkhorse.ogg", duration = 0.625 },
  ["Eagle"] = { filename = "Eagle.ogg", duration = 0.406 },
  ["Lighthorse"] = { filename = "Lighthorse.ogg", duration = 0.689 },
  ["Mustang"] = { filename = "Mustang.ogg", duration = 0.752 },
  ["Outcast"] = { filename = "Outcast.ogg", duration = 0.788 },
  ["Pegasus"] = { filename = "Pegasus.ogg", duration = 0.691 },
  ["Pistol"] = { filename = "Pistol.ogg", duration = 0.385 },
  ["Roughneck"] = { filename = "Roughneck.ogg", duration = 0.595 },
  ["Shamus"] = { filename = "Shamus.ogg", duration = 0.557 },
  ["Spur"] = { filename = "Spur.ogg", duration = 0.534 },
  ["Stetson"] = { filename = "Stetson.ogg", duration = 0.543 },
  ["Wrath"] = { filename = "Wrath.ogg", duration = 0.491 },
  ["Heavy"] = { filename = "Heavy.ogg", duration = 0.325 },
  ["Trash"] = { filename = "Trash.ogg", duration = 0.573 },
  ["Cargo"] = { filename = "Cargo.ogg", duration = 0.451 },
  ["Ascot"] = { filename = "Ascot.ogg", duration = 0.575 },
  ["Grape"] = { filename = "Grape.ogg", duration = 0.502 },
  ["Slayer"] = { filename = "Slayer.ogg", duration = 0.511 },
  ["Strelka"] = { filename = "Strelka.ogg", duration = 0.602 },
  ["Skalpel"] = { filename = "Skalpel.ogg", duration = 0.546 },
  ["Rapier"] = { filename = "Rapier.ogg", duration = 0.441 },
  ["Pedro"] = { filename = "Pedro.ogg", duration = 0.486 },
}

AI_ATC_SoundFiles.RangeControl.Callsigns = {
  ["Cylon"] = { filename = "Cylon.ogg", duration = 0.560 },
  ["Chaos"] = { filename = "Chaos.ogg", duration = 0.662 },
  ["Nightmare"] = { filename = "Nightmare.ogg", duration = 0.547 },
  ["Mig"] = { filename = "Mig.ogg", duration = 0.335 },
  ["Stalin"] = { filename = "Stalin.ogg", duration = 0.493 },
  ["Flanker"] = { filename = "Flanker.ogg", duration = 0.489 },
  ["Fulcrum"] = { filename = "Fulcrum.ogg", duration = 0.509 },
  ["Flogger"] = { filename = "Flogger.ogg", duration = 0.508 },
  ["Ivan"] = { filename = "Ivan.ogg", duration = 0.335 },
  ["GunFighter"] = { filename = "GunFighter.ogg", duration = 0.607 },
  ["Dragon"] = { filename = "Dragon.ogg", duration = 0.569 },
  ["Aspen"] = { filename = "Aspen.ogg", duration = 0.494 },
  ["Boar"] = { filename = "Boar.ogg", duration = 0.361 },
  ["Chevy"] = { filename = "Chevy.ogg", duration = 0.370 },
  ["Colt"] = { filename = "Colt.ogg", duration = 0.392 },
  ["Dodge"] = { filename = "Dodge.ogg", duration = 0.522 },
  ["Enfield"] = { filename = "Enfield.ogg", duration = 0.559 },
  ["Ford"] = { filename = "Ford.ogg", duration = 0.580 },
  ["Hawg"] = { filename = "Hawg.ogg", duration = 0.482 },
  ["Pig"] = { filename = "Pig.ogg", duration = 0.358 },
  ["Pontiac"] = { filename = "Pontiac.ogg", duration = 0.628 },
  ["Springfield"] = { filename = "SpringField.ogg", duration = 0.729 },
  ["Tusk"] = { filename = "Tusk.ogg", duration = 0.479 },
  ["Uzi"] = { filename = "Uzi.ogg", duration = 0.534 },
  ["Bone"] = { filename = "Bone.ogg", duration = 0.464 },
  ["Dark"] = { filename = "Dark.ogg", duration = 0.387 },
  ["Vader"] = { filename = "Vader.ogg", duration = 0.387 },
  ["Buff"] = { filename = "Buff.ogg", duration = 0.360 },
  ["Dump"] = { filename = "Dump.ogg", duration = 0.328 },
  ["Kenworth"] = { filename = "Kenworth.ogg", duration = 0.540 },
  ["Dude"] = { filename = "Dude.ogg", duration = 0.453 },
  ["Thud"] = { filename = "Thud.ogg", duration = 0.328 },
  ["Gunny"] = { filename = "Gunny.ogg", duration = 0.337 },
  ["Mad"] = { filename = "Mad.ogg", duration = 0.396 },
  ["Trek"] = { filename = "Trek.ogg", duration = 0.353 },
  ["Sniper"] = { filename = "Sniper.ogg", duration = 0.673 },
  ["Sled"] = { filename = "Sled.ogg", duration = 0.582 },
  ["Best"] = { filename = "Best.ogg", duration = 0.580 },
  ["Jazz"] = { filename = "Jazz.ogg", duration = 0.628 },
  ["Rage"] = { filename = "Rage.ogg", duration = 0.534 },
  ["Tahoe"] = { filename = "Tahoe.ogg", duration = 0.517 },
  ["Viper"] = { filename = "Viper.ogg", duration = 0.443 },
  ["Venom"] = { filename = "Venom.ogg", duration = 0.370 },
  ["Lobo"] = { filename = "Lobo.ogg", duration = 0.479 },
  ["Cowboy"] = { filename = "Cowboy.ogg", duration = 0.512 },
  ["Python"] = { filename = "Python.ogg", duration = 0.521 },
  ["Rattler"] = { filename = "Rattler.ogg", duration = 0.522 },
  ["Panther"] = { filename = "Panther.ogg", duration = 0.554 },
  ["Wolf"] = { filename = "Wolf.ogg", duration = 0.464 },
  ["Weasel"] = { filename = "Weasel.ogg", duration = 0.460 },
  ["Wild"] = { filename = "Wild.ogg", duration = 0.502 },
  ["Ninja"] = { filename = "Ninja.ogg", duration = 0.469 },
  ["Jedi"] = { filename = "Jedi.ogg", duration = 0.495 },
  ["Hornet"] = { filename = "Hornet.ogg", duration = 0.477 },
  ["Squid"] = { filename = "Squid.ogg", duration = 0.569 },
  ["Ragin"] = { filename = "Ragin.ogg", duration = 0.559 },
  ["Roman"] = { filename = "Roman.ogg", duration = 0.448 },
  ["Sting"] = { filename = "Sting.ogg", duration = 0.562 },
  ["Jury"] = { filename = "Jury.ogg", duration = 0.477 },
  ["Joker"] = { filename = "Joker.ogg", duration = 0.505 },
  ["Ram"] = { filename = "Ram.ogg", duration = 0.479 },
  ["Hawk"] = { filename = "Hawk.ogg", duration = 0.464 },
  ["Devil"] = { filename = "Devil.ogg", duration = 0.408 },
  ["Check"] = { filename = "Check.ogg", duration = 0.372 },
  ["Snake"] = { filename = "Snake.ogg", duration = 0.602 },
  ["Overlord"] = { filename = "Overlord.ogg", duration = 0.617 },
  ["Magic"] = { filename = "Magic.ogg", duration = 0.496 },
  ["Wizard"] = { filename = "Wizard.ogg", duration = 0.453 },
  ["Focus"] = { filename = "Focus.ogg", duration = 0.633 },
  ["Darkstar"] = { filename = "DarkStar.ogg", duration = 0.605 },
  ["BlackJack"] = { filename = "BlackJack.ogg", duration = 0.614 },
  ["Texaco"] = { filename = "Texaco.ogg", duration = 0.662 },
  ["Arco"] = { filename = "Arco.ogg", duration = 0.546 },
  ["Shell"] = { filename = "Arco.ogg", duration = 0.499 },
  ["Navy One"] = { filename = "NavyOne.ogg", duration = 0.731 },
  ["Mauler"] = { filename = "Mauler.ogg", duration = 0.615 },
  ["Blood Hound"] = { filename = "BloodHound.ogg", duration = 0.673 },
  ["ArmyAir"] = { filename = "ArmyAir.ogg", duration = 0.604 },
  ["Apache"] = { filename = "Apache.ogg", duration = 0.511 },
  ["Crow"] = { filename = "Crow.ogg", duration = 0.441 },
  ["Sioux"] = { filename = "Sioux.ogg", duration = 0.450 },
  ["Gatling"] = { filename = "Gatling.ogg", duration = 0.598 },
  ["Gunslinger"] = { filename = "Gunslinger.ogg", duration = 0.708 },
  ["Hammerhead"] = { filename = "Hammerhead.ogg", duration = 0.580 },
  ["Bootleg"] = { filename = "Bootleg.ogg", duration = 0.550 },
  ["Palehorse"] = { filename = "Palehorse.ogg", duration = 0.769 },
  ["Carnivore"] = { filename = "Carnivore.ogg", duration = 0.627 },
  ["Saber"] = { filename = "Saber.ogg", duration = 0.522 },
  ["Azrael"] = { filename = "Saber.ogg", duration = 0.604 },
  ["Bam-Bam"] = { filename = "Bam-Bam.ogg", duration = 0.501 },
  ["Burnin' Stogie"] = { filename = "Burnin' Stogie.ogg", duration = 0.720 },
  ["Crazyhorse"] = { filename = "Crazyhorse.ogg", duration = 0.697 },
  ["Crusader"] = { filename = "Crusader.ogg", duration = 0.615 },
  ["Darkhorse"] = { filename = "Darkhorse.ogg", duration = 0.755 },
  ["Eagle"] = { filename = "Eagle.ogg", duration = 0.383 },
  ["Lighthorse"] = { filename = "Lighthorse.ogg", duration = 0.714 },
  ["Mustang"] = { filename = "Mustang.ogg", duration = 0.586 },
  ["Outcast"] = { filename = "Outcast.ogg", duration = 0.670 },
  ["Pegasus"] = { filename = "Pegasus.ogg", duration = 0.612 },
  ["Pistol"] = { filename = "Pistol.ogg", duration = 0.461 },
  ["Roughneck"] = { filename = "Roughneck.ogg", duration = 0.557 },
  ["Shamus"] = { filename = "Shamus.ogg", duration = 0.615 },
  ["Spur"] = { filename = "Spur.ogg", duration = 0.485 },
  ["Stetson"] = { filename = "Stetson.ogg", duration = 0.589 },
  ["Wrath"] = { filename = "Wrath.ogg", duration = 0.461 },
  ["Heavy"] = { filename = "Heavy.ogg", duration = 0.360 },
  ["Trash"] = { filename = "Trash.ogg", duration = 0.493 },
  ["Cargo"] = { filename = "Cargo.ogg", duration = 0.467 },
  ["Ascot"] = { filename = "Ascot.ogg", duration = 0.572 },
  ["Grape"] = { filename = "Grape.ogg", duration = 0.387 },
  ["Slayer"] = { filename = "Slayer.ogg", duration = 0.549 },
  ["Strelka"] = { filename = "Strelka.ogg", duration = 0.592 },
  ["Skalpel"] = { filename = "Skalpel.ogg", duration = 0.566 },
  ["Rapier"] = { filename = "Rapier.ogg", duration = 0.554 },
  ["Pedro"] = { filename = "Pedro.ogg", duration = 0.485 },
}

AI_ATC_SoundFiles.Ground.Callsigns = {
  ["Cylon"] = { filename = "Cylon.ogg", duration = 0.463 },
  ["Chaos"] = { filename = "Chaos.ogg", duration = 0.517 },
  ["Nightmare"] = { filename = "Nightmare.ogg", duration = 0.531 },
  ["Mig"] = { filename = "Mig.ogg", duration = 0.328 },
  ["Stalin"] = { filename = "Stalin.ogg", duration = 0.644 },
  ["Flanker"] = { filename = "Flanker.ogg", duration = 0.502 },
  ["Fulcrum"] = { filename = "Fulcrum.ogg", duration = 0.636 },
  ["Flogger"] = { filename = "Flogger.ogg", duration = 0.511 },
  ["Ivan"] = { filename = "Ivan.ogg", duration = 0.366 },
  ["GunFighter"] = { filename = "Gunfighter.ogg", duration = 0.610 },
  ["Dragon"] = { filename = "Dragon.ogg", duration = 0.435 },
  ["Aspen"] = { filename = "Aspen.ogg", duration = 0.408 },
  ["Boar"] = { filename = "Boar.ogg", duration = 0.34 },
  ["Chevy"] = { filename = "Chevy.ogg", duration = 0.45 },
  ["Colt"] = { filename = "Colt.ogg", duration = 0.39 },
  ["Dodge"] = { filename = "Dodge.ogg", duration = 0.44 },
  ["Enfield"] = { filename = "Enfield.ogg", duration = 0.554 },
  ["Ford"] = { filename = "Ford.ogg", duration = 0.39 },
  ["Hawg"] = { filename = "Hawg.ogg", duration = 0.35 },
  ["Pig"] = { filename = "Pig.ogg", duration = 0.25 },
  ["Pontiac"] = { filename = "Pontiac.ogg", duration = 0.53 },
  ["Springfield"] = { filename = "SpringField.ogg", duration = 0.68 },
  ["Tusk"] = { filename = "Tusk.ogg", duration = 0.40 },
  ["Uzi"] = { filename = "Uzi.ogg", duration = 0.38 },
  ["Bone"] = { filename = "Bone.ogg", duration = 0.30 },
  ["Dark"] = { filename = "Dark.ogg", duration = 0.34 },
  ["Vader"] = { filename = "Vader.ogg", duration = 0.40 },
  ["Buff"] = { filename = "Buff.ogg", duration = 0.32 },
  ["Dump"] = { filename = "Dump.ogg", duration = 0.32 },
  ["Kenworth"] = { filename = "Kenworth.ogg", duration = 0.47 },
  ["Dude"] = { filename = "Dude.ogg", duration = 0.31 },
  ["Thud"] = { filename = "Thud.ogg", duration = 0.32 },
  ["Gunny"] = { filename = "Gunny.ogg", duration = 0.33 },
  ["Mad"] = { filename = "Mad.ogg", duration = 0.41 },
  ["Trek"] = { filename = "Trek.ogg", duration = 0.39 },
  ["Sniper"] = { filename = "Sniper.ogg", duration = 0.54 },
  ["Sled"] = { filename = "Sled.ogg", duration = 0.45 },
  ["Best"] = { filename = "Best.ogg", duration = 0.40 },
  ["Jazz"] = { filename = "Jazz.ogg", duration = 0.48 },
  ["Rage"] = { filename = "Rage.ogg", duration = 0.52 },
  ["Tahoe"] = { filename = "Tahoe.ogg", duration = 0.39 },
  ["Viper"] = { filename = "Viper.ogg", duration = 0.44 },
  ["Venom"] = { filename = "Venom.ogg", duration = 0.39 },
  ["Lobo"] = { filename = "Lobo.ogg", duration = 0.44 },
  ["Cowboy"] = { filename = "Cowboy.ogg", duration = 0.52 },
  ["Python"] = { filename = "Python.ogg", duration = 0.51 },
  ["Rattler"] = { filename = "Rattler.ogg", duration = 0.47 },
  ["Panther"] = { filename = "Panther.ogg", duration = 0.44 },
  ["Wolf"] = { filename = "Wolf.ogg", duration = 0.38 },
  ["Weasel"] = { filename = "Weasel.ogg", duration = 0.38 },
  ["Wild"] = { filename = "Wild.ogg", duration = 0.41 },
  ["Ninja"] = { filename = "Ninja.ogg", duration = 0.45 },
  ["Jedi"] = { filename = "Jedi.ogg", duration = 0.44 },
  ["Hornet"] = { filename = "Hornet.ogg", duration = 0.41 },
  ["Squid"] = { filename = "Squid.ogg", duration = 0.41 },
  ["Ragin"] = { filename = "Ragin.ogg", duration = 0.41 },
  ["Roman"] = { filename = "Roman.ogg", duration = 0.35 },
  ["Sting"] = { filename = "Sting.ogg", duration = 0.38 },
  ["Jury"] = { filename = "Jury.ogg", duration = 0.38 },
  ["Joker"] = { filename = "Joker.ogg", duration = 0.44 },
  ["Ram"] = { filename = "Ram.ogg", duration = 0.40 },
  ["Hawk"] = { filename = "Hawk.ogg", duration = 0.34 },
  ["Devil"] = { filename = "Devil.ogg", duration = 0.33 },
  ["Check"] = { filename = "Check.ogg", duration = 0.40 },
  ["Snake"] = { filename = "Snake.ogg", duration = 0.50 }, 
  ["ArmyAir"] = { filename = "ArmyAir.ogg", duration = 0.547 },
  ["Apache"] = { filename = "Apache.ogg", duration = 0.594 },
  ["Crow"] = { filename = "Crow.ogg", duration = 0.340 },
  ["Sioux"] = { filename = "Sioux.ogg", duration = 0.427 },
  ["Gatling"] = { filename = "Gatling.ogg", duration = 0.395 },
  ["Gunslinger"] = { filename = "Gunslinger.ogg", duration = 0.641 },
  ["Hammerhead"] = { filename = "Hammerhead.ogg", duration = 0.576 },
  ["Bootleg"] = { filename = "Bootleg.ogg", duration = 0.511 },
  ["Palehorse"] = { filename = "Palehorse.ogg", duration = 0.617 },
  ["Carnivore"] = { filename = "Carnivore.ogg", duration = 0.563 },
  ["Saber"] = { filename = "Saber.ogg", duration = 0.475 },
  ["Azrael"] = { filename = "Saber.ogg", duration = 0.554 },
  ["Bam-Bam"] = { filename = "Bam-Bam.ogg", duration = 0.512 },
  ["Burnin' Stogie"] = { filename = "Burnin' Stogie.ogg", duration = 0.791 },
  ["Crazyhorse"] = { filename = "Crazyhorse.ogg", duration = 0.819 },
  ["Crusader"] = { filename = "Crusader.ogg", duration = 0.602 },
  ["Darkhorse"] = { filename = "Darkhorse.ogg", duration = 0.657 },
  ["Eagle"] = { filename = "Eagle.ogg", duration = 0.382 },
  ["Lighthorse"] = { filename = "Lighthorse.ogg", duration = 0.676 },
  ["Mustang"] = { filename = "Mustang.ogg", duration = 0.463 },
  ["Outcast"] = { filename = "Outcast.ogg", duration = 0.700 },
  ["Pegasus"] = { filename = "Pegasus.ogg", duration = 0.665 },
  ["Pistol"] = { filename = "Pistol.ogg", duration = 0.450 },
  ["Roughneck"] = { filename = "Roughneck.ogg", duration = 0.515 },
  ["Shamus"] = { filename = "Shamus.ogg", duration = 0.631 },
  ["Spur"] = { filename = "Spur.ogg", duration = 0.447 },
  ["Stetson"] = { filename = "Stetson.ogg", duration = 0.547 },
  ["Wrath"] = { filename = "Wrath.ogg", duration = 0.431 },
  ["Heavy"] = { filename = "Heavy.ogg", duration = 0.360 },
  ["Trash"] = { filename = "Trash.ogg", duration = 0.601 },
  ["Cargo"] = { filename = "Cargo.ogg", duration = 0.459 },
  ["Ascot"] = { filename = "Ascot.ogg", duration = 0.533 },
  ["Grape"] = { filename = "Grape.ogg", duration = 0.421 },
  ["Slayer"] = { filename = "Slayer.ogg", duration = 0.546 },
  ["Strelka"] = { filename = "Strelka.ogg", duration = 0.569 },
  ["Skalpel"] = { filename = "Skalpel.ogg", duration = 0.569 },
  ["Rapier"] = { filename = "Rapier.ogg", duration = 0.483 },
  ["Pedro"] = { filename = "Pedro.ogg", duration = 0.421 },
  }
  
AI_ATC_SoundFiles.Departure.Callsigns = {
  ["Cylon"] = { filename = "Cylon.ogg", duration = 0.615 },
  ["Chaos"] = { filename = "Chaos.ogg", duration = 0.615 },
  ["Nightmare"] = { filename = "Nightmare.ogg", duration = 0.566 },
  ["Mig"] = { filename = "Mig.ogg", duration = 0.382 },
  ["Stalin"] = { filename = "Stalin.ogg", duration = 0.644 },
  ["Flanker"] = { filename = "Flanker.ogg", duration = 0.589 },
  ["Fulcrum"] = { filename = "Fulcrum.ogg", duration = 0.560 },
  ["Flogger"] = { filename = "Flogger.ogg", duration = 0.575 },
  ["Ivan"] = { filename = "Ivan.ogg", duration = 0.517 },
  ["GunFighter"] = { filename = "GunFighter.ogg", duration = 0.731 },
  ["Dragon"] = { filename = "Dragon.ogg", duration = 0.578 },
  ["Aspen"] = { filename = "Aspen.ogg", duration = 0.583 },
  ["Boar"] = { filename = "Boar.ogg", duration = 0.372 },
  ["Chevy"] = { filename = "Chevy.ogg", duration = 0.569 },
  ["Colt"] = { filename = "Colt.ogg", duration = 0.372 },
  ["Dodge"] = { filename = "Dodge.ogg", duration = 0.441 },
  ["Enfield"] = { filename = "Enfield.ogg", duration = 0.557 },
  ["Ford"] = { filename = "Ford.ogg", duration = 0.430 },
  ["Hawg"] = { filename = "Hawg.ogg", duration = 0.383 },
  ["Pig"] = { filename = "Pig.ogg", duration = 0.347 },
  ["Pontiac"] = { filename = "Pontiac.ogg", duration = 0.639 },
  ["Springfield"] = { filename = "SpringField.ogg", duration = 0.697 },
  ["Tusk"] = { filename = "Tusk.ogg", duration = 0.418 },
  ["Uzi"] = { filename = "Uzi.ogg", duration = 0.488 },
  ["Bone"] = { filename = "Bone.ogg", duration = 0.372 },
  ["Dark"] = { filename = "Dark.ogg", duration = 0.372 },
  ["Vader"] = { filename = "Vader.ogg", duration = 0.476 },
  ["Buff"] = { filename = "Buff.ogg", duration = 0.383 },
  ["Dump"] = { filename = "Dump.ogg", duration = 0.337 },
  ["Kenworth"] = { filename = "Kenworth.ogg", duration = 0.604 },
  ["Dude"] = { filename = "Dude.ogg", duration = 0.325 },
  ["Thud"] = { filename = "Thud.ogg", duration = 0.360 },
  ["Gunny"] = { filename = "Gunny.ogg", duration = 0.430 },
  ["Mad"] = { filename = "Mad.ogg", duration = 0.488 },
  ["Trek"] = { filename = "Trek.ogg", duration = 0.383 },
  ["Sniper"] = { filename = "Sniper.ogg", duration = 0.627 },
  ["Sled"] = { filename = "Sled.ogg", duration = 0.418 },
  ["Best"] = { filename = "Best.ogg", duration = 0.418 },
  ["Jazz"] = { filename = "Jazz.ogg", duration = 0.464 },
  ["Rage"] = { filename = "Rage.ogg", duration = 0.430 },
  ["Tahoe"] = { filename = "Tahoe.ogg", duration = 0.580 },
  ["Viper"] = { filename = "Viper.ogg", duration = 0.539 },
  ["Venom"] = { filename = "Venom.ogg", duration = 0.522 },
  ["Lobo"] = { filename = "Lobo.ogg", duration = 0.604 },
  ["Cowboy"] = { filename = "Cowboy.ogg", duration = 0.546 },
  ["Python"] = { filename = "Python.ogg", duration = 0.615 },
  ["Rattler"] = { filename = "Rattler.ogg", duration = 0.580 },
  ["Panther"] = { filename = "Panther.ogg", duration = 0.546 },
  ["Wolf"] = { filename = "Wolf.ogg", duration = 0.406 },
  ["Weasel"] = { filename = "Weasel.ogg", duration = 0.499 },
  ["Wild"] = { filename = "Wild.ogg", duration = 0.395 },
  ["Ninja"] = { filename = "Ninja.ogg", duration = 0.557 },
  ["Jedi"] = { filename = "Jedi.ogg", duration = 0.522 },
  ["Hornet"] = { filename = "Hornet.ogg", duration = 0.557 },
  ["Squid"] = { filename = "Squid.ogg", duration = 0.441 },
  ["Ragin"] = { filename = "Ragin.ogg", duration = 0.569 },
  ["Roman"] = { filename = "Roman.ogg", duration = 0.546 },
  ["Sting"] = { filename = "Sting.ogg", duration = 0.488 },
  ["Jury"] = { filename = "Jury.ogg", duration = 0.476 },
  ["Joker"] = { filename = "Joker.ogg", duration = 0.580 },
  ["Ram"] = { filename = "Ram.ogg", duration = 0.383 },
  ["Hawk"] = { filename = "Hawk.ogg", duration = 0.395 },
  ["Devil"] = { filename = "Devil.ogg", duration = 0.546 },
  ["Check"] = { filename = "Check.ogg", duration = 0.372 },
  ["Snake"] = { filename = "Snake.ogg", duration = 0.450 }, 
  ["ArmyAir"] = { filename = "ArmyAir.ogg", duration = 0.714 },
  ["Apache"] = { filename = "Apache.ogg", duration = 0.717 },
  ["Crow"] = { filename = "Crow.ogg", duration = 0.370 },
  ["Sioux"] = { filename = "Sioux.ogg", duration = 0.408 },
  ["Gatling"] = { filename = "Gatling.ogg", duration = 0.550 },
  ["Gunslinger"] = { filename = "Gunslinger.ogg", duration = 0.710 },
  ["Hammerhead"] = { filename = "Hammerhead.ogg", duration = 0.714 },
  ["Bootleg"] = { filename = "Bootleg.ogg", duration = 0.538 },
  ["Palehorse"] = { filename = "Palehorse.ogg", duration = 0.681 },
  ["Carnivore"] = { filename = "Carnivore.ogg", duration = 0.731 },
  ["Saber"] = { filename = "Saber.ogg", duration = 0.567 },
  ["Azrael"] = { filename = "Saber.ogg", duration = 0.554 },
  ["Bam-Bam"] = { filename = "Bam-Bam.ogg", duration = 0.628 },
  ["Burnin' Stogie"] = { filename = "Burnin' Stogie.ogg", duration = 0.843 },
  ["Crazyhorse"] = { filename = "Crazyhorse.ogg", duration = 0.830 },
  ["Crusader"] = { filename = "Crusader.ogg", duration = 0.734 },
  ["Darkhorse"] = { filename = "Darkhorse.ogg", duration = 0.656 },
  ["Eagle"] = { filename = "Eagle.ogg", duration = 0.527 },
  ["Lighthorse"] = { filename = "Lighthorse.ogg", duration = 0.652 },
  ["Mustang"] = { filename = "Mustang.ogg", duration = 0.598 },
  ["Outcast"] = { filename = "Outcast.ogg", duration = 0.631 },
  ["Pegasus"] = { filename = "Pegasus.ogg", duration = 0.747 },
  ["Pistol"] = { filename = "Pistol.ogg", duration = 0.562 },
  ["Roughneck"] = { filename = "Roughneck.ogg", duration = 0.562 },
  ["Shamus"] = { filename = "Shamus.ogg", duration = 0.623 },
  ["Spur"] = { filename = "Spur.ogg", duration = 0.448 },
  ["Stetson"] = { filename = "Stetson.ogg", duration = 0.657 },
  ["Wrath"] = { filename = "Wrath.ogg", duration = 0.377 },
  ["Heavy"] = { filename = "Heavy.ogg", duration = 0.525 },
  ["Trash"] = { filename = "Trash.ogg", duration = 0.505 },
  ["Cargo"] = { filename = "Cargo.ogg", duration = 0.456 },
  ["Ascot"] = { filename = "Ascot.ogg", duration = 0.546 },
  ["Grape"] = { filename = "Grape.ogg", duration = 0.403 },
  ["Slayer"] = { filename = "Slayer.ogg", duration = 0.554 },
  ["Strelka"] = { filename = "Strelka.ogg", duration = 0.673 },
  ["Skalpel"] = { filename = "Skalpel.ogg", duration = 0.656 },
  ["Rapier"] = { filename = "Rapier.ogg", duration = 0.627 },
  ["Pedro"] = { filename = "Pedro.ogg", duration = 0.554 },
}

AI_ATC_NatoTime = {
  [1] = "Alpha",
  [2] = "Bravo",
  [3] = "Charlie",
  [4] = "Delta",
  [5] = "Echo",
  [6] = "Foxtrot",
  [7] = "Golf",
  [8] = "Hotel",
  [9] = "India",
  [10] = "Juliett",
  [11] = "Kilo",
  [12] = "Lima",
  [13] = "Mike",
  [14] = "November",
  [15] = "Oscar",
  [16] = "Papa",
  [17] = "Quebec",
  [18] = "Romeo",
  [19] = "Sierra",
  [20] = "Tango",
  [21] = "Uniform",
  [22] = "Victor",
  [23] = "Whiskey",
  [24] = "Xray",
  [25] = "Yankee",
  [26] = "Zulu"
}

AI_ATC_CloudPresets = {
  [""] = { Cloud = "Clear clouds", Rain = "No significant weather", Humidity = 30 },
  ["Preset1"] = { Cloud = "Few clouds", Rain = "No significant weather", Humidity = 40 },
  ["Preset2"] = { Cloud = "Few clouds", Rain = "No significant weather", Humidity = 40 },
  ["Preset3"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset4"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset5"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset6"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset7"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset8"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset9"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset10"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset11"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset12"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset13"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset14"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset15"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset16"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset17"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset18"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset19"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset20"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset21"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset22"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset23"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset24"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset25"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset26"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset27"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["RainyPreset1"] = { Cloud = "Solid Cloud Layer", Rain = "Moderate rain", Humidity = 90 },
  ["RainyPreset2"] = { Cloud = "Solid Cloud Layer", Rain = "Moderate rain", Humidity = 90 },
  ["RainyPreset3"] = { Cloud = "Solid Cloud Layer", Rain = "Heavy rain", Humidity = 95 },
  ["RainyPreset4"] = { Cloud = "Solid Cloud Layer", Rain = "Light rain", Humidity = 85 },
  ["RainyPreset5"] = { Cloud = "Broken clouds", Rain = "Light rain", Humidity = 85 },
  ["RainyPreset6"] = { Cloud = "Broken clouds", Rain = "Light rain", Humidity = 85 },
  ["NEWRAINPRESET4"] = { Cloud = "Broken clouds", Rain = "Light rain", Humidity = 85 }
}
AI_ATC_SoundFiles.ATIS.Airbase = {
  ["Andersen"] = { filename = "Andersen.ogg", duration = 1.550 },
  ["Nellis"] = { filename = "Nellis.ogg", duration = 1.318 },
}

AI_ATC_SoundFiles.Ground.Airbase = {
  ["Andersen"] = { filename = "Andersen.ogg", duration = 0.476 },
  ["Nellis"] = { filename = "Nellis.ogg", duration = 0.395 },
}

AI_ATC_SoundFiles.Departure.Airbase = {
  ["Andersen"] = { filename = "Andersen.ogg", duration = 0.464 },
  ["Nellis"] = { filename = "Nellis.ogg", duration = 0.383 },
}

ATM = {}

ATM.ClientData = {}

ATM.AiData = {}

ATM.GroundControl ={}
       
ATM.TaxiQueue ={}

ATM.TaxiController = {}

ATM.TowerControl = {}

GENERIC_TRANSMITTER = {
  ["visible"] = false,
  ["lateActivation"] = false,
  ["taskSelected"] = true,
  ["route"] = {},
  ["groupId"] = 2,
  ["tasks"] = {},
  ["hidden"] = true,
  ["units"] = {
    [1] = {
      ["type"] = "TACAN_beacon",
      ["transportable"] = {
        ["randomTransportable"] = false,
      },
      ["unitId"] = 2,
      ["skill"] = "Average",
      ["y"] = -17210.511718656,
      ["x"] = -399080.06249991,
      ["name"] = "Nellis_ATIS",
      ["playerCanDrive"] = false,
      ["heading"] = 47,
    },
  },
  ["y"] = -17210.511718656,
  ["x"] = -399080.06249991,
  ["name"] = "Nellis_ATIS",
  ["start_time"] = 0,
  ["task"] = "Ground Nothing",
}

NAVAL_TRANSMITTER = 
{
  ["visible"] = false,
  ["route"] = 
    {
      ["points"] = 
      {
        [1] = 
        {
          ["alt"] = -0,
          ["type"] = "Turning Point",
          ["ETA"] = 0,
          ["alt_type"] = "BARO",
          ["formation_template"] = "",
          ["y"] = -120527.14285714,
          ["x"] = 46142.857142857,
          ["ETA_locked"] = true,
          ["speed"] = 0,
          ["action"] = "Turning Point",
          ["task"] = 
          {
            ["id"] = "ComboTask",
            ["params"] = 
            {
              ["tasks"] = {},
            }, -- end of ["params"]
          }, -- end of ["task"]
          ["speed_locked"] = true,
        }, -- end of [1]
      }, -- end of ["points"]
    }, -- end of ["route"]
  ["groupId"] = 1,
  ["tasks"] = 
  {
  }, -- end of ["tasks"]
  ["hidden"] = true,
  ["units"] = 
  {
    [1] = 
    {
      ["type"] = "speedboat",
      ["transportable"] = 
      {
        ["randomTransportable"] = false,
      }, -- end of ["transportable"]
      ["unitId"] = 1,
      ["skill"] = "Average",
      ["y"] = 530982.53257143,
      ["x"] = -311604.89142857,
      ["name"] = "Naval-1-1",
      ["heading"] = 4.98762867342,
      ["modulation"] = 0,
      ["frequency"] = 127500000,
    }, -- end of [1]

  }, -- end of ["units"]
  ["y"] = 530982.53257143,
  ["uncontrollable"] = false,
  ["name"] = "Naval-1",
  ["start_time"] = 0,
  ["x"] = -311604.89142857,
} 

AI_ATC_Transmitters = {
  [1] = {COMM1 = "COMM1Transmitter-1", COMM2 = "COMM2Transmitter-1", Repeater = "Repeater-1"},
  [2] = {COMM1 = "COMM1Transmitter-2", COMM2 = "COMM2Transmitter-2", Repeater = "Repeater-2"},
  [3] = {COMM1 = "COMM1Transmitter-3", COMM2 = "COMM2Transmitter-3", Repeater = "Repeater-3"},
  [4] = {COMM1 = "COMM1Transmitter-4", COMM2 = "COMM2Transmitter-4", Repeater = "Repeater-4"},
  [5] = {COMM1 = "COMM1Transmitter-5", COMM2 = "COMM2Transmitter-5", Repeater = "Repeater-5"},
  [6] = {COMM1 = "COMM1Transmitter-6", COMM2 = "COMM2Transmitter-6", Repeater = "Repeater-6"},
  [7] = {COMM1 = "COMM1Transmitter-7", COMM2 = "COMM2Transmitter-7", Repeater = "Repeater-7"},
  [8] = {COMM1 = "COMM1Transmitter-8", COMM2 = "COMM2Transmitter-8", Repeater = "Repeater-8"},
  [9] = {COMM1 = "COMM1Transmitter-9", COMM2 = "COMM2Transmitter-9", Repeater = "Repeater-9"},
  [10] = {COMM1 = "COMM1Transmitter-10", COMM2 = "COMM2Transmitter-10", Repeater = "Repeater-10"},
  [11] = {COMM1 = "COMM1Transmitter-11", COMM2 = "COMM2Transmitter-11", Repeater = "Repeater-11"},
}

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC INITIALIZATION********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do local Coord = AI_ATC_Airbase:GetCoordinate()
  if Coord:IsDay()==true then
    AI_ATC.Procedure = "VFR"
  elseif AI_ATC.Procedure==false then
    AI_ATC.Procedure = "IFR"
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************GLOBAL COROUTINE SCHEDULE***************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ATC_Coroutine = {
  CoroutineList     = {},
  MaxExecutionTime  = 0.01,
  YieldInterval     = 0.1,
  Scheduler         = nil
}

local function TracebackErrorHandler(err)
  return debug.traceback("Coroutine Error: " .. tostring(err), 2)
end

function ATC_Coroutine:AddCoroutine(func, checkInterval, ...)
  if type(checkInterval) ~= "number" then
    checkInterval = self.YieldInterval
  end

  local args = {...}
  local co

  local status, err = xpcall(function()
    co = coroutine.create(function()
      return func(unpack(args))
    end)
  end, TracebackErrorHandler)

  if not status then
    env.error(err, false)
    return
  end

  table.insert(self.CoroutineList, {
    co             = co,
    checkInterval  = checkInterval,
    lastCheckTime  = timer.getTime(),
  })
  if not self.Scheduler then
    self:Start()
  end
end

function ATC_Coroutine:ManageCoroutines()
  local currentTime = timer.getTime()
  local i = 1

  while i <= #self.CoroutineList do
    local coroutineData = self.CoroutineList[i]
    local co            = coroutineData.co
    if coroutine.status(co) == "dead" then
      table.remove(self.CoroutineList, i)
    else
      if (currentTime - coroutineData.lastCheckTime) >= coroutineData.checkInterval then
        local startTime = timer.getTime()

        local status, retval = xpcall(function()
          return coroutine.resume(co)
        end, TracebackErrorHandler)

        local endTime       = timer.getTime()
        local executionTime = endTime - startTime

        if not status then
          env.error(retval, false)
          table.remove(self.CoroutineList, i)
        else
          coroutineData.lastCheckTime = currentTime
          if coroutine.status(co) == "dead" then
            table.remove(self.CoroutineList, i)
          else
            i = i + 1
          end
        end

        if executionTime > self.MaxExecutionTime then
          env.warning(string.format("[ATC_Coroutine] WARNING: Coroutine took %.4f s, exceeding max of %.4f s",executionTime, self.MaxExecutionTime), false)
        end
      else
        i = i + 1
      end
    end
  end

  if #self.CoroutineList == 0 then
    self:Stop()
  end
end

function ATC_Coroutine:Start()
  if not self.Scheduler then
    self.Scheduler = SCHEDULER:New(
      nil,
      function()
        self:ManageCoroutines()
      end,
      {},
      self.YieldInterval,
      self.YieldInterval
    )
  end
end

function ATC_Coroutine:Stop()
  if self.Scheduler then
    self.Scheduler:Stop()
    self.Scheduler = nil
  end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************EXTRACT ZONE VERTICES*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function SaveVerticesToFile(ZoneObject, filename)
  if io then
    local Path = "C:\\Users\\Avala\\Saved Games\\DCS.openbeta\\Mods\\"
    local Vertices = ZoneObject:GetVerticiesCoordinates() -- Get vertices from the zone

    -- Function to serialize only Vec3 data (x, y, z) into Lua code
    local function SerializeVec3Table(val, name, depth)
      local tmp = string.rep(" ", depth * 2)
      
      -- If there is a name, format it correctly as a table key
      if name then
        if type(name) == "number" then
          tmp = tmp .. "[" .. name .. "] = "
        else
          tmp = tmp .. '["' .. name .. '"] = '
        end
      end

      -- Serialize the Vec3 data (x, y, z)
      if type(val) == "table" and val.x and val.y and val.z then
        tmp = tmp .. string.format("{x = %.6f, y = %.6f, z = %.6f}", val.x, val.y, val.z)
      end
      
      return tmp
    end
    
    -- Serialize only the x, y, z values of the vertices into a Lua-compatible string
    local serializedData = "local vertices = {\n"
    for i, vertex in ipairs(Vertices) do
      serializedData = serializedData .. SerializeVec3Table(vertex, i, 1) .. ",\n"
    end
    serializedData = serializedData .. "}\nreturn vertices"
    
    -- Attempt to write the serialized data to the file
    local fullPath = Path .. "\\" .. filename
    local file, err = io.open(fullPath, "w")
    if not file then
      env.info("Error opening file for writing: " .. err)
      return false
    end
    
    file:write(serializedData)
    file:close()
    
    env.info("Successfully saved vertices data (Vec3) to " .. fullPath)
    return true
  else
    env.info("*****Note - Mission Lua Environment is Sanitised, Some features unavailable.")
    return false
  end
end
-- Example usage
--local ZoneObject = AI_ATC.TaxiWay["Alpha"].Zone
--SaveVerticesToFile(ZoneObject, "TAXIWAY_ALPHA.lua")
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************PRE CALCULATE TERMINAL COORDS***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:PrecalculateCoords(filename)
  if AI_ATC.TerminalCoordinates then
    env.info("AI_ATC.TerminalCoordinates already exists, not reinitializing.")
  else
    env.info("AI_ATC.TerminalCoordinates does not exist, initializing with default values.")
  end

  AI_ATC.TerminalCoordinates = AI_ATC.TerminalCoordinates or {
    ["Alpha"] = {Foxtrot = {}, Golf = {}},
    ["Charlie"] = {Golf = {}},
    ["Delta"] = {Foxtrot = {}},
    ["Echo"] = {Foxtrot = {}, Golf = {}},
    ["Foxtrot"] = {Alpha = {}, Hotel = {}},
    ["Golf"] = {Alpha = {}, Echo = {}},
    ["Hotel"] = {Foxtrot = {}},
  }
  
  for startTaxiway, connections in pairs(AI_ATC.TerminalCoordinates) do
    local PrimaryVertices = AI_ATC.TaxiWay[startTaxiway].Zone

    for endTaxiway, _ in pairs(connections) do
      local TerminalVertices = AI_ATC.TaxiWay[endTaxiway].Zone
      local shortestDistance = math.huge
      local TerminalCoord = nil

      if PrimaryVertices and TerminalVertices then
        for _, primaryVertex in ipairs(PrimaryVertices) do
          for _, terminalVertex in ipairs(TerminalVertices) do
            local distance = primaryVertex:Get2DDistance(terminalVertex)
            if distance < shortestDistance then
              shortestDistance = distance
              TerminalCoord = {x = terminalVertex.x, y = terminalVertex.y, z = terminalVertex.z}
            end
          end
        end
      end
      AI_ATC.TerminalCoordinates[startTaxiway][endTaxiway] = TerminalCoord
    end
  end

  return self:SaveTableToFile(AI_ATC.TerminalCoordinates, filename)
end

function AI_ATC:SaveTableToFile(tbl, filename)
  if io then
    local Path = "C:\\Users\\Avala\\Saved Games\\DCS.openbeta\\Mods\\"

    local function SerializeTable(val, name, depth)
      local tmp = string.rep(" ", depth * 2)
      if name then
        if type(name) == "number" then
          tmp = tmp .. "[" .. name .. "] = "
        else
          tmp = tmp .. '["' .. name .. '"] = '
        end
      end

      if type(val) == "table" and not (val.x and val.y and val.z) then
        tmp = tmp .. "{\n"
        for k, v in pairs(val) do
          tmp = tmp .. SerializeTable(v, k, depth + 1) .. ",\n"
        end
        tmp = tmp .. string.rep(" ", depth * 2) .. "}"
      elseif type(val) == "table" and val.x and val.y and val.z then
        tmp = tmp .. string.format("{x = %.6f, y = %.6f, z = %.6f}", val.x, val.y, val.z)
      elseif type(val) == "number" then
        tmp = tmp .. string.format("%.6f", val)
      else
        tmp = tmp .. tostring(val)
      end
      return tmp
    end
    local serializedData = "local ATC_TerminalCoordinates = {\n"
    serializedData = serializedData .. SerializeTable(tbl, nil, 1)
    serializedData = serializedData .. "\n}\nreturn ATC_TerminalCoordinates"

    local fullPath = Path .. "\\" .. filename
    local file, err = io.open(fullPath, "w")
    if not file then
      env.info("Error opening file for writing: " .. err)
      return false
    end
    
    file:write(serializedData)
    file:close()
    
    env.info("Successfully saved terminal coordinates to " .. fullPath)
    return true
  else
    env.info("*****Note - Mission Lua Environment is Sanitised, Some features unavailable.")
    return false
  end
end

--AI_ATC:PrecalculateCoords("TerminalCoords.lua")
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************INITIALISE TAXIWAY TABLE****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CoordConstructor(inputTable)
  local coords = {}

  ATC_Coroutine:AddCoroutine(function()
    local batchSize = 10
    local i = 1

    while i <= #inputTable do
      for j = i, math.min(i + batchSize - 1, #inputTable) do
        local vec3 = inputTable[j]
        local coord = COORDINATE:NewFromVec3({x = vec3.x, y = vec3.y, z = vec3.z})
        table.insert(coords, coord)
      end
      i = i + batchSize
      coroutine.yield()
    end
  end)

  return coords
end

function AI_ATC:InitTaxiwayCoords()
  for taxiwayName, taxiwayData in pairs(AI_ATC.TaxiWay) do
    local zoneData = taxiwayData.Zone
    local coordinates = AI_ATC:CoordConstructor(zoneData)
    AI_ATC.TaxiWay[taxiwayName].Zone = coordinates
  end
end

AI_ATC:InitTaxiwayCoords()

RUNWAY_06L = AI_ATC:CoordConstructor(RUNWAY_06L)
RUNWAY_06R = AI_ATC:CoordConstructor(RUNWAY_06R)
AI_ATC_Vec3 = COORDINATE:NewFromVec3({x=10881.108398438, y=165.52432250977, z=14591.631835938})
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************EXTRACT ZONE DATA********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ExtractNavpointCoordinatesAndSave()
  local NavpointCoordinates = {}

  for navpointName, zoneObject in pairs(AI_ATC_Navpoints) do
    local vec2 = zoneObject:GetVec2()
    NavpointCoordinates[navpointName] = {x = vec2.x, y = vec2.y}
  end

  AI_ATC:SaveTableToFile(NavpointCoordinates, "NavpointCoordinates.lua")
end
--AI_ATC:ExtractNavpointCoordinatesAndSave()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************GENERATE NAVPOINTS*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenerateNavpoints()
  local startTime = timer.getTime()

  ATC_Coroutine:AddCoroutine(function()
    local batchSize = 10  
    local count = 0

    for navpointName, coordData in pairs(AI_ATC_Navpoints) do
      AI_ATC_Navpoints[navpointName] = ZONE_RADIUS:New(navpointName, coordData, 16, false)
      count = count + 1
      
      if count==batchSize then
        count = 0
        coroutine.yield()
      end
    end
    local endTime = timer.getTime() 
    local elapsedTime = endTime - startTime
    env.info(string.format("Completed processing all navpoints in %.2f seconds.", elapsedTime))
    
    ATC_Coroutine:AddCoroutine(function()
      --AI_ATC:GenerateSID()
      --coroutine.yield()
      --AI_ATC:GenerateVFR()
      --coroutine.yield()
      AI_ATC:GeneratePlates()
      --coroutine.yield()
      AI_ATC:GenerateCharts()
    end)
    --UTILS.PrintTableToLog(AI_ATC_Navpoints, 2, false)
  end)
end

AI_ATC:GenerateNavpoints()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************SPAWN TRANSMITTERS*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--AI_ATC_Transmitter_Data = AI_ATC:CoordConstructor(AI_ATC_Transmitter_Data)
--AI_ATC_Repeater_Data = AI_ATC:CoordConstructor(AI_ATC_Repeater_Data)

local Template = GENERIC_TRANSMITTER
Template.name = "Andersen_ATIS"
Template.x = ATIS_Coord.x
Template.y = ATIS_Coord.y
Template.units[1].x = ATIS_Coord.x
Template.units[1].y = ATIS_Coord.y
Template.units[1].name = "Andersen_ATIS"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Andersen_Tower"
Template.x = Tower_Coord.x
Template.y = Tower_Coord.y
Template.units[1].x = Tower_Coord.x
Template.units[1].y = Tower_Coord.y
Template.units[1].name = "Andersen_Tower"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Andersen_Ground"
Template.x = Ground_Coord.x
Template.y = Ground_Coord.y
Template.units[1].x = Ground_Coord.x
Template.units[1].y = Ground_Coord.y
Template.units[1].name = "Andersen_Ground"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Andersen_Approach"
Template.x = Approach_Coord.x
Template.y = Approach_Coord.y
Template.units[1].x = Approach_Coord.x
Template.units[1].y = Approach_Coord.y
Template.units[1].name = "Andersen_Approach"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Andersen_Departure"
Template.x = Departure_Coord.x
Template.y = Departure_Coord.y
Template.units[1].x = Departure_Coord.x
Template.units[1].y = Departure_Coord.y
Template.units[1].name = "Andersen_Departure"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Andersen_Clearance"
Template.x = Clearance_Coord.x
Template.y = Clearance_Coord.y
Template.units[1].x = Clearance_Coord.x
Template.units[1].y = Clearance_Coord.y
Template.units[1].name = "Andersen_Clearance"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "ATIS_Repeater"
Template.x = ATIS_REPEATER_Coord.x
Template.y = ATIS_REPEATER_Coord.y
Template.units[1].x = ATIS_REPEATER_Coord.x
Template.units[1].y = ATIS_REPEATER_Coord.y
Template.units[1].name = "ATIS_Repeater"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Generic_Repeater"
Template.x = Generic_Repeater_Coord.x
Template.y = Generic_Repeater_Coord.y
Template.units[1].x = Generic_Repeater_Coord.x
Template.units[1].y = Generic_Repeater_Coord.y
Template.units[1].name = "Generic_Repeater"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)


for index, transmitterData in pairs(AI_ATC_Transmitters) do
  local CoordData = AI_ATC_Transmitter_Data[index]
  local Template
  if index >6 then
    Template = NAVAL_TRANSMITTER
  else
    Template = GENERIC_TRANSMITTER
  end
  Template.name = string.format("Transmitter-%s", index)
  Template.visible = false
  Template.x = CoordData.x
  Template.y = CoordData.z
  Template.units[1].x = CoordData.x
  Template.units[1].y = CoordData.z
  Template.units[1].name = string.format("Transmitter-%s", index)
  if index >6 then
    coalition.addGroup(country.id.CJTF_BLUE, Group.Category.SHIP, Template)
  else
    coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)
  end
  AI_ATC_Transmitters[index].COMM1 = Template.units[1].name
end

for index, transmitterData in pairs(AI_ATC_Transmitters) do
  local CoordData = AI_ATC_Repeater_Data[index]
  local Template
  if index >6 then
    Template = NAVAL_TRANSMITTER
  else
    Template = GENERIC_TRANSMITTER
  end
  Template.name = string.format("Repeater-%s", index)
  Template.visible = false
  Template.x = CoordData.x
  Template.y = CoordData.z
  Template.units[1].x = CoordData.x
  Template.units[1].y = CoordData.z
  Template.units[1].name = string.format("Repeater-%s", index)
  if index >6 then
    coalition.addGroup(country.id.CJTF_BLUE, Group.Category.SHIP, Template)
  else
    coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)
  end
  AI_ATC_Transmitters[index].Repeater = Template.units[1].name
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************INITIALISE TERMINAL COORDINATES*************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ConvertTerminalCoordinates()
  for startTaxiway, destinations in pairs(AI_ATC_TerminalCoordinates) do
    for endTaxiway, vec3Data in pairs(destinations) do
      AI_ATC_TerminalCoordinates[startTaxiway][endTaxiway] = COORDINATE:New(vec3Data.x, vec3Data.y, vec3Data.z)
    end
  end
end
AI_ATC:ConvertTerminalCoordinates()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************HOLD SHORT ZONES********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoldShortZones()
  for runway, positions in pairs(HoldShortData) do
    for index, coord in ipairs(positions) do
      local zoneName = string.format("HoldShort_%s_%d", runway, index)
      local zone = ZONE_RADIUS:New(zoneName, {x = coord.x, y = coord.y}, 50)
      HoldShortData[runway][index] = zone
    end
  end
end
AI_ATC:HoldShortZones()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************HOLD SHORT ZONES********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RunwayGuardZones()
  for runway, positions in pairs(RunwayGuard) do
    for index, coord in ipairs(positions) do
      local zoneName = string.format("RunwayGuard_%s_%d", runway, index)
      local zone = ZONE_RADIUS:New(zoneName, {x = coord.x, y = coord.y}, 50)
      RunwayGuard[runway][index] = zone
    end
  end
end
AI_ATC:RunwayGuardZones()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************ATC STANDARD INTERNATIONAL DEPARTURE***************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenerateSID()
  AI_ATC.SID = {}
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**********************************************************************ATC LOCAL DEPARTURE PROCEEDURES**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenerateVFR()
  AI_ATC.VFR = {}

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************ATC LOCAL APPROACH PROCEDURES**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GeneratePlates()
  AI_ATC.ApproachPlates = {
    ["06L"] = {
      Altitude = "6000",
      NAVPOINTS = {
        [1] = AI_ATC_Navpoints.IAF_06L,
      }
    },
    ["06R"] = {
      Altitude = "6000",
      NAVPOINTS = {
        [1] = AI_ATC_Navpoints.IAF_06R,
      }
    },  
    ["24L"] = {
      Altitude = "6000",
      NAVPOINTS = {
        [1] = AI_ATC_Navpoints.IAF_24L,
      }
    },
    ["24R"] = {
      Altitude = "6000",
      NAVPOINTS = {
        [1] = AI_ATC_Navpoints.IAF_24R,
      }
    },
  }
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC APPROACH CHARTS********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenerateCharts()
  AI_ATC.Charts = {
    ["06L"] = {
      ["HI-TACAN X"] = {
        Altitude = "17",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.FOVEM,
          [2] = AI_ATC_Navpoints.ARKEE,
          [3] = AI_ATC_Navpoints.HURUG,
          [4] = AI_ATC_Navpoints.FOMOD,
          [5] = AI_ATC_Navpoints.ITUME,
        }
      },
      ["HI-ILS Y"] = {
        Altitude = "17",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.FOVEM,
          [2] = AI_ATC_Navpoints.ARKEE,
          [3] = AI_ATC_Navpoints.LOGLE,
          [4] = AI_ATC_Navpoints.JORUN,
          [5] = AI_ATC_Navpoints.KATNE,
        }
      },
      ["TACAN"] = {
        Altitude = "5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.FOVEM,
          [2] = AI_ATC_Navpoints.ARKEE,
          [3] = AI_ATC_Navpoints.HURUG,
          [4] = AI_ATC_Navpoints.FOMOD,
          [5] = AI_ATC_Navpoints.ITUME,
        }
      },
      ["ILS"] = {
        Altitude = "5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.FOVEM,
          [2] = AI_ATC_Navpoints.ARKEE,
          [3] = AI_ATC_Navpoints.LOGLE,
          [4] = AI_ATC_Navpoints.JORUN,
          [5] = AI_ATC_Navpoints.KATNE,
        }
      },
    },
    ["06R"] = {
      ["TACAN"] = {
        Altitude = "5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.FOVEM,
          [2] = AI_ATC_Navpoints.ARKEE,
          [3] = AI_ATC_Navpoints.ADTIN,
          [4] = AI_ATC_Navpoints.COLMA,
          [5] = AI_ATC_Navpoints.FAXEL,
        }
      },
      ["ILS"] = {
        Altitude = "5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.FOVEM,
          [2] = AI_ATC_Navpoints.ARKEE,
          [3] = AI_ATC_Navpoints.HILRI,
          [4] = AI_ATC_Navpoints.ANIKA,
          [5] = AI_ATC_Navpoints.SULUE,
        }
      },
    },
    ["24L"] = {
      ["TACAN"] = {
        Altitude = "5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.WELKU,
          [2] = AI_ATC_Navpoints.OKIBE,
          [3] = AI_ATC_Navpoints.BAVAC,
        }
      },
      ["ILS"] = {
        Altitude = "5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.PANNS,
          [2] = AI_ATC_Navpoints.WESOK,
          [3] = AI_ATC_Navpoints.ACUYU,
        }
      },
    },
    ["24R"] = {
      ["TACAN"] = {
        Altitude = "5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.WELKU,
          [2] = AI_ATC_Navpoints.EVEBE,
          [3] = AI_ATC_Navpoints.JIPRO,
        }
      },
      ["ILS"] = {
        Altitude = "5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.FABED,
          [2] = AI_ATC_Navpoints.HASRA,
          [3] = AI_ATC_Navpoints.INIME,
        }
      },
    },
  }
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************NELLIS RUNWAY INITIALISE****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RUNWAY_24L = RUNWAY_06R
RUNWAY_24R = RUNWAY_06L

AI_ATC.Runways.Landing = {"06L", true}
AI_ATC.Runways.LandingZone = RUNWAY_06L
AI_ATC.Runways.Takeoff = {"06L", false}
AI_ATC.Runways.TakeoffZone = RUNWAY_06L
AI_ATC.Runways.TakeoffHold = false
--AI_ATC.Runways.HoldShort = {"03R_HoldShort_1", "03R_HoldShort_2"}
--AI_ATC.Runways.RunwayGuard = {"03R_Guard_1", "03R_Guard_2"}
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SCHEDULER:New(nil, function()
  coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Runway_init)
end, {}, 1)

SCHEDULER:New(nil, function()

  local ReferenceTable = {
    ["06L"] = {ZoneObject = RUNWAY_06L, Coordinate = RUNWAY_06L[1], Waypoint = "JWILL"},
    ["06R"] = {ZoneObject = RUNWAY_06R, Coordinate = RUNWAY_06R[1], Waypoint = "WESOK"},
    ["24R"] = {ZoneObject = RUNWAY_24R, Coordinate = RUNWAY_24R[8], Waypoint = "JORUN"},
    ["24L"] = {ZoneObject = RUNWAY_24L, Coordinate = RUNWAY_24L[10], Waypoint = "COLMA"},
  }
   
  local shortestDistance = math.huge
  local Unit = UNIT:FindByName("Runway_init")
  local Coord = Unit:GetCoordinate()
  local ActiveRunway, Waypoint
   
  for runway, data in pairs(ReferenceTable) do
    local Distance = Coord:Get2DDistance(data.Coordinate)
    if Distance < shortestDistance then
      shortestDistance = Distance
      ActiveRunway = runway
      AI_ATC.Runways.Takeoff = {runway, true, data.Coordinate}
      AI_ATC.Runways.TakeoffZone = data.ZoneObject
      Waypoint = data.Waypoint
      Unit:Destroy()
    end
  end
  
  AI_ATC.Runways.Waypoint = AI_ATC_Navpoints[Waypoint]:GetCoordinate()
  AI_ATC.Runways.Waypoint:MarkToAll("Waypoint")

  if ActiveRunway=="06L" then
    AI_ATC.Runways.Landing = {"06L", false, RUNWAY_06L[1]}
    AI_ATC.Runways.LandingZone = RUNWAY_06L
  elseif ActiveRunway=="06R" then
    AI_ATC.Runways.Landing = {"06R", false, RUNWAY_06R[1]}
    AI_ATC.Runways.LandingZone = RUNWAY_06R
  elseif ActiveRunway=="24L" then
    AI_ATC.Runways.Landing = {"24L", false, RUNWAY_24L[10]}
    AI_ATC.Runways.LandingZone = RUNWAY_24L
  elseif ActiveRunway=="24R" then
    AI_ATC.Runways.Landing = {"24R", false, RUNWAY_24R[8]}
    AI_ATC.Runways.LandingZone = RUNWAY_24R
  end
end, {}, 2)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATIS STOP**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:StopATIS()
  AI_ATC.ATIS.Data.FC3switch = true
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************NELLIS ATIS***************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AI_ATC.ATIS.Data = {
  AirBase       = AI_ATC.Airbase,
  Information   = nil,
  ZULU          = nil,
  WindSpeed     = nil,
  WindDirection = nil,
  Gusting       = nil,
  Preset        = nil,
  Fog           = nil,
  Dust          = nil,
  Rain          = false,
  Visibility    = nil,
  Cloud         = nil,
  Base          = nil,
  Temperature   = nil,
  Humidity      = nil,
  DewPoint      = nil,
  QNH           = nil,
  QFE           = nil,
  Departure     = nil,
  Arrival       = nil,
  Active        = nil,
  Approach      = nil,
  FC3switch     = false,
  Count         = nil,
}

function AI_ATC:InitATIS()
  local Frequecy = AI_ATC.Radio.ATIS[AI_ATC.Radio.ATIS.UserFreq]
  local startTime = timer.getTime()
  local atisRepeaterUnit = UNIT:FindByName("ATIS_Repeater")
  if atisRepeaterUnit then
    local transmitterRadio = atisRepeaterUnit:GetRadio()
    if transmitterRadio then
      local radioObject = transmitterRadio:NewUnitTransmission("UHF_NOISE.ogg", nil, nil, AI_ATC.Radio.ATIS[Frequecy], radio.modulation.AM, true)
      radioObject:Broadcast()
    end
  end

  ATC_Coroutine:AddCoroutine(function()
    local data   = AI_ATC.ATIS.Data
    local base   = AI_ATC_Airbase
    local pres   = AI_ATC_CloudPresets
    local runDep = AI_ATC.Runways and AI_ATC.Runways.Takeoff
    local runArr = AI_ATC.Runways and AI_ATC.Runways.Landing

    if not base or not runDep or not runArr then
      env.warning("AI_ATC:InitATIS -> Missing essential references (AI_ATC_Airbase or Runways).")
      return
    end

    ATIS_RESTART   = false
    data.Count     = 0

    local coord    = base:GetCoordinate()
    local landHt   = coord:GetLandHeight()
    local tempCalc = coord:GetTemperature(landHt + 10)
    local temperature = math.floor(tempCalc + 0.5)

    local qfePressure = UTILS.hPa2inHg(coord:GetPressure(landHt))
    local qfe = math.floor(qfePressure * 100 + 0.5) / 100

    local qnhPressure = UTILS.hPa2inHg(coord:GetPressure(0))
    local qnh = math.floor(qnhPressure * 100 + 0.5) / 100

    local timeAbs    = timer.getAbsTime()
    local localShift = UTILS.GMTToLocalTimeDifference() * 60 * 60
    local zuluSec    = timeAbs - localShift
    if zuluSec < 0 then
      zuluSec = 24 * 3600 + zuluSec
    end

    local clockStr = UTILS.SecondsToClock(zuluSec)
    local clockParts = UTILS.Split(clockStr, ":") 
    local zuluTime = string.format("%s%s", clockParts[1], clockParts[2])

    local hourIdx = tonumber(clockParts[1]) + 1
    local natoLetter = AI_ATC_NatoTime[hourIdx]

    data.Information  = natoLetter
    data.ZULU         = zuluTime
    data.Temperature  = tostring(temperature)
    data.QFE          = string.format("%.2f", qfe)
    data.QNH          = string.format("%.2f", qnh)

    coroutine.yield()

    local weather = env.mission and env.mission.weather or {}
    local windDirRaw, windSpdRaw = coord:GetWind(landHt + 10)
    local windDirection = AI_ATC:RectifyHeading(tostring(math.floor(windDirRaw + 0.5)))
    local windSpeedKnots

    if windSpdRaw >= 1 then
      windSpeedKnots = tostring(math.floor(UTILS.MpsToKnots(windSpdRaw) - 0.5))
    else
      windSpeedKnots = "0"
    end

    data.WindDirection = windDirection
    data.WindSpeed     = windSpeedKnots

    data.Gusting = (weather.groundTurbulence and weather.groundTurbulence > 0) or false

    local fogEnabled  = weather.enable_fog or false
    local dustEnabled = weather.enable_dust or false
    local preset      = weather.clouds and weather.clouds.preset or ""

    data.Fog    = fogEnabled
    data.Dust   = dustEnabled
    data.Preset = preset

    if not pres[preset] then
      preset = ""
    end

    if fogEnabled then
      local thicknessFt = weather.fog and weather.fog.thickness or 0
      local thicknessConv = math.floor((thicknessFt * 3.28084 + 500) / 1000) * 1000
      data.FogThickness = tostring(thicknessConv)
      data.FogVisibility = weather.fog and weather.fog.visibility or 0
    else
      data.FogThickness  = nil
      data.FogVisibility = nil
    end


    if weather.fog2 then
      data.Fog = true
      local thickness2 = world.weather.getFogThickness() or 0
      local fogVis2    = world.weather.getFogVisibilityDistance() or 0

      if thickness2 == 0 then
        local fallbackBase = weather.clouds and weather.clouds.base or 0
        data.FogThickness = tostring(math.floor((fallbackBase * 3.28084 + 500) / 1000) * 1000)
      else
        data.FogThickness = tostring(math.floor((thickness2 * 3.28084 + 500) / 1000) * 1000)
      end

      if fogVis2 == 0 then
        data.FogVisibility = 5
      else
        data.FogVisibility = fogVis2
      end
    end

    if dustEnabled then
      data.DustDensity = weather.dust_density or 0
    else
      data.DustDensity = nil
    end

    coroutine.yield()

    local rawVisibility = (weather.visibility and weather.visibility.distance) or 0

    if data.Fog and data.FogVisibility then
      if data.FogVisibility < rawVisibility then
        rawVisibility = data.FogVisibility
      end
    end

    if dustEnabled and weather.dust_density then
      if weather.dust_density < rawVisibility then
        rawVisibility = weather.dust_density
      end
    end

    local finalVisSM = UTILS.Round(UTILS.MetersToSM(rawVisibility))
    if finalVisSM > 10 then
      finalVisSM = 10
    end
    data.Visibility = string.format("%d", finalVisSM)

    local precip = pres[preset] and pres[preset].Rain or "No significant weather"
    if precip ~= "No significant weather" then
      data.Rain = true
    end

    local baseCloudsFt = weather.clouds and weather.clouds.base or 0
    local baseAltFt = math.floor((baseCloudsFt * 3.28084 + 500) / 1000) * 1000

    data.Cloud = pres[preset] and pres[preset].Cloud or nil
    data.Base  = tostring(baseAltFt)

    local humidityVal = pres[preset] and pres[preset].Humidity or 0
    data.Humidity = tostring(humidityVal)

    local dewPoint = temperature - ((100 - humidityVal) / 5)
    data.DewPoint = string.format("%s", dewPoint)

    data.Departure = runDep and runDep[1] or "Unknown"
    data.Arrival   = runArr and runArr[1] or "Unknown"

    if data.Arrival == data.Departure then
      data.Active = data.Departure
    else
      data.Active = nil
    end

    if coord:IsDay() and (not data.Rain) and (finalVisSM >= 5) then
      data.Approach  = "VFR"
      AI_ATC.Procedure = "VFR"
    else
      data.Approach  = "IFR"
      AI_ATC.Procedure = "IFR"
    end

    local endTime = timer.getTime()
    local duration = endTime - startTime
    env.info(string.format("AI_ATC:InitATIS -> ATIS data calculated in %.2f seconds.", duration))
  end)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************INITIALISE RADIOS**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:InitRadios()
  local Frequency = AI_ATC.RadioFrequency
  
  ATIS_RADIO = RADIOQUEUE:New(AI_ATC.Radio.ATIS[AI_ATC.Radio.ATIS.UserFreq], 0)
  ATIS_RADIO:SetSenderUnitName(AI_ATC.Radio.ATIS.Transmitter)
  ATIS_RADIO:Start()

  ATIS_REPEATER = RADIOQUEUE:New(AI_ATC.Radio.ATIS[AI_ATC.Radio.ATIS.UserFreq], 0)
  ATIS_REPEATER:SetSenderUnitName("ATIS_Repeater")
  ATIS_REPEATER:Start()
  
  GROUND_RADIO = RADIOQUEUE:New(AI_ATC.Radio.Ground[AI_ATC.Radio.Ground.UserFreq], 0)
  GROUND_RADIO:SetSenderUnitName(AI_ATC.Radio.Ground.Transmitter)
  GROUND_RADIO:Start()
  
  CLEARANCE_RADIO = RADIOQUEUE:New(AI_ATC.Radio.Clearance[AI_ATC.Radio.Clearance.UserFreq], 0)
  CLEARANCE_RADIO:SetSenderUnitName(AI_ATC.Radio.Clearance.Transmitter)
  CLEARANCE_RADIO:Start()
  
  TOWER_RADIO = RADIOQUEUE:New(AI_ATC.Radio.Tower[AI_ATC.Radio.Tower.UserFreq], 0)
  TOWER_RADIO:SetSenderUnitName(AI_ATC.Radio.Tower.Transmitter)
  TOWER_RADIO:Start()
  
  DEPARTURE_RADIO = RADIOQUEUE:New(AI_ATC.Radio.Departure[AI_ATC.Radio.Departure.UserFreq], 0)
  DEPARTURE_RADIO:SetSenderUnitName(AI_ATC.Radio.Departure.Transmitter)
  DEPARTURE_RADIO:Start()

  APPROACH_RADIO = RADIOQUEUE:New(AI_ATC.Radio.Approach[AI_ATC.Radio.Approach.UserFreq], 0)
  APPROACH_RADIO:SetSenderUnitName(AI_ATC.Radio.Approach.Transmitter)
  APPROACH_RADIO:Start()
  
  ATCRepeater = "Generic_Repeater"

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************SET RADIOS TO VHF **************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SetRadioFrequency(Agency, Range)
  if AI_ATC.Radio[Agency] and (Range=="UHF" or Range=="VHF") then
    AI_ATC.Radio[Agency].UserFreq = Range
  else
    local Txt = string.format("****************INVALID FREQUENCY RANGE %s FOR %s*********************", Range, Agency)
    env.info(Txt)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************FUNCTION DELAY******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:FunctionDelay(Alias, Object, Transmitter)
  local Delay = 3.0
  local currentTime = timer.getTime()
  
  AI_ATC[Transmitter] = AI_ATC[Transmitter] or {}
  AI_ATC[Transmitter].TimeSinceLastCall = AI_ATC[Transmitter].TimeSinceLastCall or 0
  if currentTime < AI_ATC[Transmitter].TimeSinceLastCall + Delay then
    if Object~=nil then
      SCHEDULER:New(nil, function()
        Object()
      end, {}, Delay)
    end
    return false
  else
    if Object then
      AI_ATC[Transmitter].TimeSinceLastCall = currentTime
    end
    return true
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************INIT MENUS************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:InitMenus(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Menu = ATM.ClientData[Alias].ParentMenu
   
  local AI_ATC_Clearance_Menu = MENU_GROUP:New(Group, "Clearance", AI_ATC_Menu)
  local AI_ATC_Ground_Menu = MENU_GROUP:New(Group, "Ground", AI_ATC_Menu)
  local AI_ATC_Tower_Menu = MENU_GROUP:New(Group, "Tower", AI_ATC_Menu)
  local DepartureMenu = MENU_GROUP:New(Group, "Departure", AI_ATC_Menu)
  local ApproachMenu = MENU_GROUP:New(Group, "Approach", AI_ATC_Menu)
  local Agency = MENU_GROUP:New(Group, "Other Agency", AI_ATC_Menu)
  local RepeatMenu =  MENU_GROUP:New(Group, "Repeat transmission", Agency)

  
  ATM.ClientData[Alias].ClearanceMenu = AI_ATC_Clearance_Menu
  ATM.ClientData[Alias].GroundMenu = AI_ATC_Ground_Menu
  ATM.ClientData[Alias].TowerMenu = AI_ATC_Tower_Menu
  ATM.ClientData[Alias].DepartureMenu = DepartureMenu
  ATM.ClientData[Alias].OtherAgency = Agency
  ATM.ClientData[Alias].ApproachMenu = ApproachMenu
  ATM.ClientData[Alias].RepeatMenu = RepeatMenu
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************RESET MENUS***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ResetMenus(Alias)
  local Client = ATM.ClientData[Alias]
  
  Client.ClearanceMenu:RemoveSubMenus()
  Client.GroundMenu:RemoveSubMenus()
  Client.TowerMenu:RemoveSubMenus()
  Client.DepartureMenu:RemoveSubMenus()
  Client.ApproachMenu:RemoveSubMenus()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************RESET MENUS***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenerateEmptyMenu(Alias, Transmitter)
  local Unit = ATM.ClientData[Alias].Unit
  local Group = Unit:GetGroup()
  local MenuObject
  
  if Transmitter == "Approach" then
    MenuObject = ATM.ClientData[Alias].ApproachMenu
  end
  
  MENU_GROUP_COMMAND:New(Group, "", MenuObject, function()  end, Group)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************REPEAT LAST TRANSMISSION**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RepeatLastTransmission(Alias, Object)
  local Unit = ATM.ClientData[Alias].Unit
  local Group = Unit:GetGroup()
  local MenuObject = ATM.ClientData[Alias].RepeatMenu
  
  if MenuObject and MenuObject.MenuCount then
    --UTILS.PrintTableToLog(MenuObject, 2, false)
    MenuObject:RemoveSubMenus()
  end

  local commandFunction
  if Object then
    commandFunction = function() Object() end
  else
    commandFunction = function() end
  end
  MENU_GROUP_COMMAND:New(Group, "Repeat last transmission", MenuObject, commandFunction, Group )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************CLEARANCE SUB MENU**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ClearanceSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Helo = ATM.ClientData[Alias].Helo
  local AI_ATC_Menu = ATM.ClientData[Alias].ParentMenu
  local AI_ATC_Clearance_Menu = ATM.ClientData[Alias].ClearanceMenu
  local AI_ATC_Departure_Menu = MENU_GROUP:New(Group, "Departure...", AI_ATC_Clearance_Menu)
  
  if Helo==false then
    if AI_ATC.Procedure == "VFR" then
      MENU_GROUP_COMMAND:New(Group, "VFR", AI_ATC_Departure_Menu, function() AI_ATC:VFR_Clearance(Alias) end, Group)
      
      MENU_GROUP_COMMAND:New(Group, "IFR", AI_ATC_Departure_Menu, function() AI_ATC:IFR_Clearance(Alias) end, Group)

    elseif AI_ATC.Procedure == "IFR" then
      MENU_GROUP_COMMAND:New(Group, "IFR", AI_ATC_Departure_Menu, function() AI_ATC:IFR_Clearance(Alias) end, Group)
    end
  elseif Helo==true then
    if AI_ATC.Procedure == "VFR" then
      MENU_GROUP_COMMAND:New(Group, "VFR", AI_ATC_Departure_Menu, function() AI_ATC:VFR_Clearance(Alias) end, Group)
    elseif AI_ATC.Procedure == "IFR" then
      MENU_GROUP_COMMAND:New(Group, "IFR", AI_ATC_Departure_Menu, function() AI_ATC:IFR_Clearance(Alias) end, Group)
    end
  end
  
  local OptionsMenu = MENU_GROUP:New(Group, "Options...", AI_ATC_Clearance_Menu)
  local CallsignMenu = MENU_GROUP:New(Group, "Set Callsign...", OptionsMenu)
  local Menu1 = MENU_GROUP:New(Group, "Bluefor...", CallsignMenu)
  local Menu2 = MENU_GROUP:New(Group, "Redfor...", CallsignMenu)
  
  if not Helo then
    MENU_GROUP_COMMAND:New(Group, "Aspen", Menu1, function() AI_ATC:SetCallsign(Alias, "Aspen",   "11") end, Group)
  else
    MENU_GROUP_COMMAND:New(Group, "Pedro", Menu1, function() AI_ATC:SetCallsign(Alias, "Pedro",   "11") end, Group)
  end
  MENU_GROUP_COMMAND:New(Group, "Chaos", Menu1, function() AI_ATC:SetCallsign(Alias, "Chaos",   "21") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Cylon", Menu1, function() AI_ATC:SetCallsign(Alias, "Cylon",   "31") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Dragon", Menu1, function() AI_ATC:SetCallsign(Alias, "Dragon", "41") end, Group)
  MENU_GROUP_COMMAND:New(Group, "GunFighter", Menu1, function() AI_ATC:SetCallsign(Alias, "GunFighter", "51") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Nightmare", Menu1, function() AI_ATC:SetCallsign(Alias, "Nightmare", "61") end, Group)
  
  MENU_GROUP_COMMAND:New(Group, "Eagle",  Menu1, function() AI_ATC:SetCallsign(Alias, "Eagle",  "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Viper",  Menu1, function() AI_ATC:SetCallsign(Alias, "Viper",  "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Hornet", Menu1, function() AI_ATC:SetCallsign(Alias, "Hornet", "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Slayer", Menu1, function() AI_ATC:SetCallsign(Alias, "Slayer", "11") end, Group)

  MENU_GROUP_COMMAND:New(Group, "Mig",     Menu2, function() AI_ATC:SetCallsign(Alias, "Mig",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Stalin",  Menu2, function() AI_ATC:SetCallsign(Alias, "Stalin",  "21") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Flanker", Menu2, function() AI_ATC:SetCallsign(Alias, "Flanker", "31") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Fulcrum", Menu2, function() AI_ATC:SetCallsign(Alias, "Fulcrum", "41") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Flogger", Menu2, function() AI_ATC:SetCallsign(Alias, "Flogger", "51") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Ivan",    Menu2, function() AI_ATC:SetCallsign(Alias, "Ivan",    "61") end, Group)
  
  MENU_GROUP_COMMAND:New(Group, "Grape",    Menu2, function() AI_ATC:SetCallsign(Alias, "Grape",  "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Strelka",  Menu2, function() AI_ATC:SetCallsign(Alias, "Strelka","11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Skalpel",  Menu2, function() AI_ATC:SetCallsign(Alias, "Skalpel","11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Rapier",   Menu2, function() AI_ATC:SetCallsign(Alias, "Rapier", "11") end, Group)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************GROUND -  ENGINE START SUBMENU**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GroundStartSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Ground_Menu = ATM.ClientData[Alias].GroundMenu
  MENU_GROUP_COMMAND:New(Group, "Request Engine Start", AI_ATC_Ground_Menu, function() AI_ATC:EngineStart(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************GROUND - TAXI SUB MENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Helo = ATM.ClientData[Alias].Helo
  
  local AI_ATC_Ground_Menu = ATM.ClientData[Alias].GroundMenu
  if Helo==false then
    local TAXI_MENU = MENU_GROUP_COMMAND:New( Group, "Request Taxi clearance", AI_ATC_Ground_Menu, function()AI_ATC:TaxiClearance(Alias) end, Group)
  elseif Helo==true then
    local TAXI_MENU = MENU_GROUP_COMMAND:New( Group, "Request Taxi clearance", AI_ATC_Ground_Menu, function()AI_ATC:HeloTaxi(Alias) end, Group)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER TAKEOFF SUB MENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CrossRunwaySubMenu(Alias, Runway)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  
  local Menu = string.format("Request clearance to cross %s", Runway)
  MENU_GROUP_COMMAND:New(Group, Menu, AI_ATC_Tower_Menu, function() AI_ATC:CrossRunway(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER TAKEOFF SUB MENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:LandingHoldSubMenu(Alias, Runway)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Ground_Menu = ATM.ClientData[Alias].GroundMenu
  
  local Menu = string.format("Request clearance to cross %s", Runway)
  MENU_GROUP_COMMAND:New(Group, Menu, AI_ATC_Ground_Menu, function() AI_ATC:CrossRunwayLanding(Alias, Runway) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER JOLLYPAD SUBMENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CrossPadSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  
  MENU_GROUP_COMMAND:New(Group, "Request clearance to pad", AI_ATC_Tower_Menu, function() AI_ATC:TakePad(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************GROUND - HOVER CHECK**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoverSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  local HoverMenu = MENU_GROUP_COMMAND:New( Group, "Request hover check", AI_ATC_Tower_Menu, function()AI_ATC:HoverCheck(Alias) end, Group)
  
  ATM.ClientData[Alias].TowerMenu = AI_ATC_Tower_Menu
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER TAKEOFF SUB MENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloTakeOffSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  
  MENU_GROUP_COMMAND:New(Group, "Request Takeoff", AI_ATC_Tower_Menu, function()AI_ATC:HeloTakeoff(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER TAKEOFF SUB MENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TakeOffSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  
  MENU_GROUP_COMMAND:New(Group, "Request Takeoff", AI_ATC_Tower_Menu, function()AI_ATC:TakeoffClearance(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************DEPARTURE SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:DepartureSubMenu(Alias, missed)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local DepartureMenu = ATM.ClientData[Alias].DepartureMenu
  local AppraochMenu = ATM.ClientData[Alias].ApproachMenu
  local Randomizer = math.random(1,3)
  
  if Randomizer==1 and missed~=true then
    MENU_GROUP_COMMAND:New(Group, "Check in", DepartureMenu, function() AI_ATC:DepartureIdent(Alias) end, Group)
  elseif Randomizer~=1 and missed~=true then
    MENU_GROUP_COMMAND:New(Group, "Check in", DepartureMenu, function() AI_ATC:DepartureCheckin(Alias) end, Group)
  elseif missed==true then
    MENU_GROUP_COMMAND:New(Group, "Check in", AppraochMenu, function() AI_ATC:MissedApproach(Alias) end, Group)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************DEPARTURE IDENT SUB MENU********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IdentSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local DepartureMenu = ATM.ClientData[Alias].DepartureMenu
  
  MENU_GROUP_COMMAND:New(Group, "Flash", DepartureMenu, function() AI_ATC:DepartureCheckin(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************DEPARTURE SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:NavigationSubMenu(Alias, Modifier)
  local Transmitter = "Departure"
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Runway = AI_ATC.Runways.Takeoff[1]
  
  local Procedure, DepartureMenu, VFR, SID, Navpoint1, Navpoint2, Report, Subtitle1, Subtitle2
  Procedure = ATM.ClientData[Alias].RequestedProcedure
  
  DepartureMenu = ATM.ClientData[Alias].DepartureMenu
  local ReportMenu = MENU_GROUP:New(Group, "Report...", DepartureMenu)
  local VectorMenu = MENU_GROUP:New(Group, "Vector to...", DepartureMenu)

  if Procedure=="VFR" then
    
  
  elseif Procedure=="IFR" then
    
  end
  
  local AirfieldMenu = MENU_GROUP:New(Group, "Airfield", VectorMenu)
  AI_ATC:AirfieldMenus(Transmitter, Alias, AirfieldMenu)
  

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************APPROACH SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Procedure = AI_ATC.Procedure
  
  local AppraochMenu = ATM.ClientData[Alias].ApproachMenu
  local CheckInMenu = MENU_GROUP:New(Group, "Check in...", AppraochMenu)
  if Procedure=="VFR" then
    MENU_GROUP_COMMAND:New(Group, "VFR", CheckInMenu, function() AI_ATC:ApproachCheckIn(Alias, "VFR") end, Group)
    MENU_GROUP_COMMAND:New(Group, "IFR", CheckInMenu, function() AI_ATC:ApproachCheckIn(Alias, "IFR") end, Group)
  else
    MENU_GROUP_COMMAND:New(Group, "", CheckInMenu, function()  end, Group)
    MENU_GROUP_COMMAND:New(Group, "IFR", CheckInMenu, function() AI_ATC:ApproachCheckIn(Alias, "IFR") end, Group)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************APPROACH TYPE MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachTypeMenu(Alias)
  local Group          = ATM.ClientData[Alias].Unit:GetGroup()
  local ApproachMenu   = ATM.ClientData[Alias].ApproachMenu
  local ActiveRunway   = AI_ATC.Runways.Landing[1]
  local Charts         = AI_ATC.Charts[ActiveRunway]
  local approachSub
  if not Charts then
    env.info("No approach data found for runway "..tostring(ActiveRunway))
    return
  end
  
  if ActiveRunway=="24L" or ActiveRunway=="24R" then
    MENU_GROUP_COMMAND:New(Group, "", ApproachMenu, function()  end, Group)
  end
 
  for approachName, approachData in pairs(Charts) do
    if approachName=="TACAN" then
      approachSub = "TAC"..ActiveRunway
    elseif approachName=="ILS" then
      approachSub="ILS\\LOC"
    else
      approachSub=approachName
    end
    MENU_GROUP_COMMAND:New(Group, approachSub, ApproachMenu, function()AI_ATC:ApproachManager(Alias, approachName)end, Group)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************APPROACH BACK TO RADAR SUB MENU******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:BackToRadarSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local ActiveRunway = AI_ATC.Runways.Landing[1]
  local TacSub = "TAC"..ActiveRunway
  
  local ApproachMenu = ATM.ClientData[Alias].ApproachMenu
  MENU_GROUP_COMMAND:New(Group, "", ApproachMenu, function()  end, Group)
  MENU_GROUP_COMMAND:New(Group, "ILS\\LOC", ApproachMenu, function() AI_ATC:ApproachBackToRadar(Alias, "ILS") end, Group)
  MENU_GROUP_COMMAND:New(Group, TacSub, ApproachMenu, function() AI_ATC:ApproachBackToRadar(Alias, "TACAN") end, Group)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************APPROACH NAV ASSIST*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachAssistMenu(Alias, report)
  local Transmitter = "Approach"
  local CleintData = ATM.ClientData[Alias]
  local Group = CleintData.Unit:GetGroup()
  local AI_ATC_Menu = CleintData.ParentMenu
  local Procedure = CleintData.Approach.Type
  local Runway = AI_ATC.Runways.Landing[1] 
  
  local ReportTable, ReferenceTable, Navpoint, Plate, Chart, Recovery
  
  local AppraochMenu = ATM.ClientData[Alias].ApproachMenu
  local VectorMenu = MENU_GROUP:New(Group, "Vector to Navpoint", AppraochMenu)
  
  if Procedure=="VFR" then
    ReferenceTable = AI_ATC.ApproachPlates[Runway].NAVPOINTS
    MENU_GROUP_COMMAND:New(Group, "Request IFR Pickup", AppraochMenu, function() AI_ATC:ApproachReportFix(Alias, true) end, Group)
  elseif Procedure=="IFR" then
    Recovery = ATM.ClientData[Alias].Recovery
    Chart = ATM.ClientData[Alias].Chart
    ReferenceTable = AI_ATC.Charts[Runway][Chart].NAVPOINTS
    if report then
      Navpoint = Recovery
      local MenuTxt = "Report "..Navpoint
      MENU_GROUP_COMMAND:New(Group, MenuTxt, AppraochMenu, function() AI_ATC:ApproachReportFix(Alias, true) end, Group)
    else
      MENU_GROUP_COMMAND:New(Group, "Cancel IFR", AppraochMenu, function() AI_ATC:CancelIFR(Alias) end, Group)
    end

  end
  
  
  for index, navpoint in ipairs(ReferenceTable) do
    if navpoint and navpoint.GetName then
      local Name = navpoint:GetName()
      local Subtitle = "Vectors for " .. Name
      MENU_GROUP_COMMAND:New(Group, Subtitle, VectorMenu, function() AI_ATC:NavAssist(Alias, Name, Transmitter) end, Group)
    end
  end
  
  local AirfieldMenu = MENU_GROUP:New(Group, "Vector to Airfield", AppraochMenu)
  AI_ATC:AirfieldMenus(Transmitter, Alias, AirfieldMenu)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************APPROACH SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CancelIFRSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  
  local AppraochMenu = ATM.ClientData[Alias].ApproachMenu
  MENU_GROUP_COMMAND:New(Group, "Cancel IFR", AppraochMenu, function() AI_ATC:CancelIFR(Alias) end, Group)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************MISSED APPROACH SUB MENU*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:MissedApproachMenu(Alias)
  local Transmitter = "Approach"
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AppraochMenu = ATM.ClientData[Alias].ApproachMenu
  local Type = ATM.ClientData[Alias].Chart
  local Runway = AI_ATC.Runways.Landing[1]
  local ApproachData = ApproachSettings[Runway][Type]
  local Navpoint = ApproachData.Final
  local Procedure1 = "Vector for "..Navpoint
  local Procedure2 = "Request ILS\\LOC"
  local Procedure3 = "Request TAC"..Runway
  local Procedure4 = "Request Departure"
  
  MENU_GROUP_COMMAND:New(Group, Procedure1, AppraochMenu, function()AI_ATC:NavAssist(Alias, Navpoint, Transmitter) end, Group)
  MENU_GROUP_COMMAND:New(Group, Procedure2, AppraochMenu, function()AI_ATC:ApproachManager(Alias, "ILS", true) end, Group)
  MENU_GROUP_COMMAND:New(Group, Procedure3, AppraochMenu, function()AI_ATC:ApproachManager(Alias,"TACAN", true) end, Group)
  MENU_GROUP_COMMAND:New(Group, Procedure4, AppraochMenu, function()AI_ATC:RequestDeparture(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************TOWER LANDING SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:LandingSubMenu(Alias, Modifier)
  local Group         = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu     = ATM.ClientData[Alias].TowerMenu
  local ApproachType  = ATM.ClientData[Alias].Approach.Type
  local Procedure     = AI_ATC.Procedure
  
  if ApproachType == "Generic" then
    ApproachType = Procedure
  end

  if ApproachType == "VFR" then
    MENU_GROUP_COMMAND:New(Group, "Straight In", TowerMenu, function() AI_ATC:StraightIn(Alias) end, Group)
    MENU_GROUP_COMMAND:New(Group, "Overhead", TowerMenu, function() AI_ATC:Overhead(Alias) end, Group)
    if Modifier then
      MENU_GROUP_COMMAND:New(Group, "Request Departure", TowerMenu, function() AI_ATC:RadarVectorDeparture(Alias) end, Group)
    end
  elseif ApproachType == "IFR" then
    MENU_GROUP_COMMAND:New(Group, "Instrument Straight In", TowerMenu, function() AI_ATC:InstrumentStraightIn(Alias) end, Group)
    if Modifier then
      MENU_GROUP_COMMAND:New(Group, "Request Back to Radar", TowerMenu, function() AI_ATC:RadarVectorDeparture(Alias) end, Group)
    end
  end
  ATM.ClientData[Alias].TowerMenu = TowerMenu
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER REPORT INITIAL************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:InitialSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  
  local InitalMenu = MENU_GROUP:New(Group, "Report 5 mile", TowerMenu)
  MENU_GROUP_COMMAND:New(Group, "Full Stop", InitalMenu, function() AI_ATC:RequestFullStop(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Touch and Go", InitalMenu, function() AI_ATC:RequestTouchGo(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Low Approach", InitalMenu, function() AI_ATC:RequestLowApproach(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Option", InitalMenu, function() AI_ATC:RequestOption(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER REPORT INITIAL************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:OverheadInitialSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  
  MENU_GROUP_COMMAND:New(Group, "Report initial", TowerMenu, function() AI_ATC:Report5MileInital(Alias) end, Group)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER REPORT INITIAL************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReportBaseSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  
  local BaseMenu = MENU_GROUP:New(Group, "Report base", TowerMenu)
  MENU_GROUP_COMMAND:New(Group, "Full Stop", BaseMenu, function() AI_ATC:RequestFullStop(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Touch and Go", BaseMenu, function() AI_ATC:RequestTouchGo(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Low Approach", BaseMenu, function() AI_ATC:RequestLowApproach(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Option", BaseMenu, function() AI_ATC:RequestOption(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************************************TOWER GO AROUND**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GoAroundSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  local Runway = AI_ATC.Runways.Landing[1]
  local ApproachType = ATM.ClientData[Alias].Approach.Type
  local Proceedure = AI_ATC.Procedure
  
  local Recovery, Approach, Subtitle
  
  if ApproachType=="Generic" then
    ApproachType = Proceedure
  end
  
  local function SetApproachType(type)
    ATM.ClientData[Alias].RequestedProcedure = type
    ATM.ClientData[Alias].Recovery =Recovery
    ATM.ClientData[Alias].Approach = type
    ATM.ClientData[Alias].Approach.Type = type
    ATM.ClientData[Alias].Chart = "TACAN"
  end
  
  if Runway=="06L" then
    Recovery = "FOVEM"
    Approach = "HI-TACAN X"
  elseif Runway=="06R" then
    Recovery = "FOVEM"
    Approach = "TACAN"
  elseif Runway=="24L" then
    Recovery = "WELKU"
    Approach = "TACAN"
  elseif Runway=="24R" then
    Recovery = "FOVEM"
    Approach = "TACAN"
  end
  
  Subtitle = "Break out"

  if Proceedure=="VFR" then
    MENU_GROUP_COMMAND:New(Group, "Request closed traffic", TowerMenu, function() SetApproachType("VFR") AI_ATC:ClosedTraffic(Alias) end, Group)
    MENU_GROUP_COMMAND:New(Group, Subtitle, TowerMenu, function() SetApproachType("VFR") AI_ATC:GoAround(Alias) end, Group)
    MENU_GROUP_COMMAND:New(Group, "Missed Approach", TowerMenu, function() SetApproachType("IFR") AI_ATC:GoAround(Alias) end, Group)
    MENU_GROUP_COMMAND:New(Group, "Request Back to Radar", TowerMenu, function() SetApproachType("IFR") AI_ATC:BackToRadar(Alias) end, Group)
  elseif Proceedure=="IFR" then
    MENU_GROUP_COMMAND:New(Group, "", TowerMenu, function()  end, Group)
    MENU_GROUP_COMMAND:New(Group, "", TowerMenu, function()  end, Group)
    MENU_GROUP_COMMAND:New(Group, "Missed Approach", TowerMenu, function()SetApproachType("IFR") AI_ATC:GoAround(Alias) end, Group)
    MENU_GROUP_COMMAND:New(Group, "Request Back to Radar", TowerMenu, function()SetApproachType("IFR") AI_ATC:BackToRadar(Alias) end, Group)
  end
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**********************************************************************TOWER REPORT NAVPOINT************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:NavpointSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Runway = AI_ATC.Runways.Landing[1]
  local Subtitle = "Report initial"
  
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  MENU_GROUP_COMMAND:New(Group, Subtitle, TowerMenu, function() AI_ATC:SayIntentions(Alias) end, Group)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************PARKING SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ParkingSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local GroundMenu = ATM.ClientData[Alias].GroundMenu
  
  MENU_GROUP_COMMAND:New(Group, "Taxi to Parking", GroundMenu, function() AI_ATC:TaxiParking(Alias) end, Group)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC CLEARANCE_CHECKIN_FUNCTIONS*****************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:VFR_Clearance(Alias)
  ATM.ClientData[Alias].RequestedProcedure = "VFR"
  AI_ATC:ClearanceDelivery(Alias)
end


function AI_ATC:IFR_Clearance(Alias)
  ATM.ClientData[Alias].RequestedProcedure = "IFR"
  AI_ATC:ClearanceDelivery(Alias)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC TOWER CHECKIN MENU*****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:InstrumentStraightIn(Alias)
  ATM.ClientData[Alias].Landing.Procedure = "Instrument Straight in"
  AI_ATC:Tower_Checkin(Alias)
end

function AI_ATC:StraightIn(Alias)
  ATM.ClientData[Alias].Landing.Procedure = "Straight in"
  AI_ATC:Tower_Checkin(Alias)
end

function AI_ATC:Overhead(Alias)
  ATM.ClientData[Alias].Landing.Procedure = "Overhead"
  AI_ATC:Tower_Checkin(Alias)
end

function AI_ATC:RequestFullStop(Alias)
  ATM.ClientData[Alias].Landing.Type = "Full Stop"
  AI_ATC:ReportInital(Alias)
end

function AI_ATC:RequestTouchGo(Alias)
  ATM.ClientData[Alias].Landing.Type = "Touch and Go"
  AI_ATC:ReportInital(Alias)
end

function AI_ATC:RequestLowApproach(Alias)
  ATM.ClientData[Alias].Landing.Type = "Low Approach"
  AI_ATC:ReportInital(Alias)
end

function AI_ATC:RequestOption(Alias)
  ATM.ClientData[Alias].Landing.Type = "Option"
  AI_ATC:ReportInital(Alias)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************AI_ATC SET CALLSIGN*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SetCallsign(Alias, Callsign, Integer)
  local NewCallsign
  AI_ATC.CustomCallsigns[Alias] = {}
  if Integer then 
    NewCallsign = Callsign..Integer
  else
    NewCallsign = Callsign.."11"
  end
  AI_ATC.CustomCallsigns[Alias].Callsign = NewCallsign
  env.info(string.format("Registering unique Callsign %s for %s", NewCallsign, Alias))
  if ATM.ClientData[Alias] then
    local Unit = ATM.ClientData[Alias].Unit
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    ATM.ClientData[Alias].Callsign = NewCallsign
    AI_ATC:UpdateFlightCallsign(Alias)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************AI_ATC SET GROUP************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AddPlayerToGroup(GroupName, Player)
  local Grp = GROUP:FindByName(GroupName)
  local Plyr = GROUP:FindByName(Player)
  if not Grp then
    env.info(("AI_ATC:AddPlayerToGroup -> Group not found '%s'."):format(GroupName))
    return
  end
  
  if not Plyr then
    env.info(("AI_ATC:AddPlayerToGroup -> Group not found '%s'."):format(Player))
    return
  end
  
  if not AI_ATC.FlightGroup[GroupName] then
    AI_ATC.FlightGroup[GroupName] = {
      [Player] = {}
    }
  else
    AI_ATC.FlightGroup[GroupName][Player] = {}
  end
  
  if ATM.ClientData[Player] then
    local Unit = ATM.ClientData[Player].Unit
    local AI_ATC_Menu = ATM.ClientData[Player].ParentMenu
    AI_ATC:TerminateSchedules(Player)
    AI_ATC_Menu:Remove()
    AI_ATC:SeperateFromGroup(Player)
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    ATM.ClientData[Player] = nil
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************AI_ATC SEPERATE GROUP*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SeperateGroup(Alias, Menu)
  local function TableIsEmpty(t)
    for _, _ in pairs(t) do
      return false
    end
    return true
  end
  
  local Group = GROUP:FindByName(Alias)
  if Group then
    local Unit = Group:GetUnit(1)
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
      if groupTable[Alias] then
        AI_ATC.FlightGroup[groupName][Alias] = nil
        Menu:Remove()
        if TableIsEmpty(AI_ATC.FlightGroup[groupName]) then
          AI_ATC.FlightGroup[groupName] = nil
        end
      end
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************FIND TRANSMITTER************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:FindTransmitter(Alias, Agency)

  if not ATM.ClientData[Alias] or not AI_ATC.Radio[Agency] then
    return
  end
  
  local Frequecy = AI_ATC.Radio[Agency].UserFreq
  local TransmitFrequency = AI_ATC.Radio[Agency][Frequecy]
  local PlayerCoord = ATM.ClientData[Alias].Unit:GetCoordinate()
  local UnitObject, ClosestTransmitter, Coord
  local shortestDistance = math.huge
  
  for _, entry in ipairs(AI_ATC_Transmitters) do
    local TransmitterName = entry.COMM1
    local Transmitter = UNIT:FindByName(TransmitterName)
    local TransmitterCoord = Transmitter:GetCoordinate()
    local Range = PlayerCoord:Get2DDistance(TransmitterCoord)
    if Range < shortestDistance then
      shortestDistance = Range
      ClosestTransmitter = TransmitterName
      Coord = TransmitterCoord
      ATCRepeater = entry.Repeater
      UnitObject = Transmitter
    end
  end
  
  UnitObject:CommandSetFrequency(TransmitFrequency, 0, 100)

  local RadioObject = RADIOQUEUE:New(TransmitFrequency, 0)
  RadioObject:SetSenderUnitName(ClosestTransmitter)
  RadioObject:Start()

  return RadioObject

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************CHANNEL OPEN*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ChannelOpen(delay, agency, Alias)
  local Type = ATM.ClientData[Alias].Type
  local Frequency, TransmitFrequency
  
  if agency ~= nil then 
    Frequency = AI_ATC.Radio[agency].UserFreq
    TransmitFrequency = AI_ATC.Radio[agency][Frequency]
  end
  
  if Type == "F-16C_50" or Type == "AH-64D_BLK_II" then
    if (agency=="Clearance" or agency=="Ground" or agency=="Tower") then
      local Unit = UNIT:FindByName("Generic_Repeater")
      Unit:CommandSetFrequency(TransmitFrequency, 0, 100)
      local AI_ATC_Transmitter = Unit:GetRadio()
      AI_ATC_ChannelOpen = AI_ATC_Transmitter:NewUnitTransmission("UHF_NOISE.ogg", nil, nil, TransmitFrequency, radio.modulation.AM, true)
      AI_ATC_ChannelOpen:Broadcast()
    else
      local Unit = UNIT:FindByName(ATCRepeater)
      Unit:CommandSetFrequency(TransmitFrequency, 0, 100)
      local AI_ATC_Transmitter = Unit:GetRadio()
      AI_ATC_ChannelOpen = AI_ATC_Transmitter:NewUnitTransmission("UHF_NOISE.ogg", nil, nil, TransmitFrequency, radio.modulation.AM, true)
      AI_ATC_ChannelOpen:Broadcast()
      SCHEDULER:New( nil, function()
        if AI_ATC_ChannelOpen then
          AI_ATC_ChannelOpen:StopBroadcast()
          AI_ATC_ChannelOpen = nil
        end
      end,{}, delay)
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************FIND AAR TANKERS**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:FindTankerUnits()
  AI_ATC.Tankers = {
    [0] = {},
    [1] = {},
  }
  
  local TankerUnits = SET_UNIT:New():FilterActive():FilterCategories("plane"):FilterOnce()
  TankerUnits:ForEach(function(UnitObject)
    local UnitName = UnitObject:GetName()
    local TypeName = UnitObject:GetTypeName()
    if TypeName=="KC130" then 
      table.insert(AI_ATC.Tankers[1], UnitName)
    elseif TypeName=="KC-135" then 
      table.insert(AI_ATC.Tankers[0], UnitName)
    elseif TypeName=="KC135MPRS" then
      table.insert(AI_ATC.Tankers[1], UnitName)
    elseif TypeName=="S-3B Tanker" then
      table.insert(AI_ATC.Tankers[1], UnitName)
    end
  end)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************ENABLE CREW CHIEF***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:EnableCrewChief(Boolean)
  if Boolean==true then
    AI_ATC.CrewChief = true
  else
    AI_ATC.CrewChief = false
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************SPAWN CREW CHIEF*********-**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SpawnCrewChief(Alias)
  if AI_ATC.CrewChief~=true then
    return
  end
  
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()

  local unitCoord   = Unit:GetCoordinate()
  local unitHeading = Unit:GetHeading()
  local offsetFront = 19 
  local offsetSide  = 10
  local sideAngle   = -90

  local frontCoord  = unitCoord:Translate(offsetFront, unitHeading, false, false)
  local chiefCoord  = frontCoord:Translate(offsetSide, unitHeading + sideAngle, false, false)

  local headingToUnit = chiefCoord:HeadingTo(unitCoord)
  local name          = Alias .. "_CrewChief"

  local chiefTemplate = GROUP:FindByName("CrewChief")
  if not chiefTemplate then
    env.info("AI_ATC: 'CrewChief' template not found. Using default static object.")

    local vec2 = chiefCoord:GetVec2()
    local fallbackObject = {
      heading    = math.rad(headingToUnit),
      groupId    = 0,
      shape_name = "carrier_tech_USA",
      type       = "us carrier tech",
      unitId     = 0,
      rate       = 1,
      name       = name,
      category   = "Personnel",
      y          = vec2.y,
      x          = vec2.x,
      dead       = false,
    }

    local staticObj = coalition.addStaticObject(country.id.CJTF_BLUE, fallbackObject)

    if not staticObj then
      env.warning("AI_ATC: Failed to spawn default static object for '" .. tostring(Alias) .. "'.")
      return
    else
      SCHEDULER:New(nil, function()
        ATM.ClientData[Alias].CrewChief = STATIC:FindByName(name)
      end, {}, 1)
    end
    
  else
    local ChiefSchedule
    local CrewChief = SPAWN:NewWithAlias("CrewChief", name)
    CrewChief:InitCountry(country.id.CJTF_BLUE)
    CrewChief:InitHeading(headingToUnit)

    CrewChief:OnSpawnGroup(function(spawnGroup)
      local chiefUnit = spawnGroup:GetUnit(1)
      ATM.ClientData[Alias].CrewChief = chiefUnit

      ChiefSchedule = SCHEDULER:New(nil, function()

        if not ATM.ClientData[Alias] then
          spawnGroup:Destroy()
          ChiefSchedule:Stop()
          return
        end

        local velocity = Unit:GetVelocityKNOTS()
        if velocity > 1 then
          spawnGroup:OptionAlarmStateRed()
          SCHEDULER:New(nil, function()
            spawnGroup:OptionAlarmStateGreen()
          end, {}, 5)
          ChiefSchedule:Stop()
        end
      end, {}, 1, 1)
    end)

    CrewChief:SpawnFromCoordinate(chiefCoord)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************INITIALISE CLIENTS**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:InitClients()

  ATC_CLIENTS = SET_CLIENT:New():FilterActive():FilterStart()
  local TCN = AI_ATC_Navpoints.UAMTCN and AI_ATC_Navpoints.UAMTCN:GetCoordinate()
  if not TCN then
    env.warning("AI_ATC:InitClients -> 'AI_ATC_Navpoints.UAMTCN' or its coordinate is nil.")
  end
  
  local function CheckFlightGroups(Alias)
    for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
      for ClientName, _ in pairs(groupTable) do
        if ClientName==Alias then
          return true
        end
      end
    end
    return false
  end
  
  local function LogClients()
    local activeClients = {}
    ATC_CLIENTS:ForEachClient(function(clientObject)
      if not clientObject then
        return
      end

      local clientAlias = clientObject:GetClientGroupName()
      activeClients[clientAlias] = true

      if ATM.ClientData[clientAlias] then
        local group  = clientObject:GetGroup()
        if group and group:IsAlive() then
          local flightUnits = group:CountAliveUnits()
          local wingmanAlive = 
            (AI_Wingman_2_Unit and AI_Wingman_2_Unit:IsAlive()) or
            (AI_Wingman_3_Unit and AI_Wingman_3_Unit:IsAlive()) or
            (AI_Wingman_4_Unit and AI_Wingman_4_Unit:IsAlive())
          local hasFlightGroup = AI_ATC.FlightGroup[clientAlias] ~= nil
          if flightUnits > 1 or wingmanAlive or hasFlightGroup then
            ATM.ClientData[clientAlias].Flight = true
            AI_ATC:UpdateFlightCallsign(clientAlias)
          else
            ATM.ClientData[clientAlias].Flight = false
          end
        end

      else
        if CheckFlightGroups(clientAlias) then
          return
        end
        
        local group = clientObject:GetGroup()
        local unit  = clientObject:GetClientGroupUnit()

        if not group or not unit or not unit:IsAlive() then
          return
        end

        local flightUnits = group:CountAliveUnits()
        local coord       = unit:GetCoordinate()
        local callsign    = unit:GetCallsign()
        local typeName    = unit:GetTypeName()
        local isHelo      = unit:IsHelicopter()

        if AI_ATC.CustomCallsigns[clientAlias] and AI_ATC.CustomCallsigns[clientAlias].Callsign then
          callsign = AI_ATC.CustomCallsigns[clientAlias].Callsign
        end

        ATM.ClientData[clientAlias] = {
          Unit              = unit,
          Coord             = coord,
          Callsign          = callsign,
          Type              = typeName,
          Helo              = isHelo,
          Flight            = (flightUnits > 1),
          FlightCallsign    = "",
          Procedure         = AI_ATC.Procedure,
          RequestedProcedure= "IFR",
          State             = "Parked",
          Chart             = "TACAN",
          Recovery          = "FOVEM",
          Approach          = { Type = AI_ATC.Procedure },
          Landing           = { Procedure = "Straight in", Type = "Option" },
          SchedulerObjects  = {},
          ParkingSpace = "76",
          Squawk = "",
        }

        if isHelo then
          ATM.ClientData[clientAlias].RequestedProcedure = "VFR"
        end
        
        local Random = tostring(math.random(1, 7))
        local Squawk = string.format("%s001", Random)
        ATM.ClientData[clientAlias].Squawk = Squawk

        AI_ATC:UpdateFlightCallsign(clientAlias)

        if group:IsAirborne() then

          ATM.ClientData[clientAlias].State = "AirBorne"
          --local parentMenu = MENU_GROUP:New(group, "ATC")
          local parentMenu = AI_ATC.ParentMenu
          ATM.ClientData[clientAlias].ParentMenu = parentMenu
          AI_ATC:InitMenus(clientAlias)

          if TCN then
            local range = coord:Get2DDistance(TCN)
            if range >= 24076 then
              
              --ATM.ClientData[clientAlias].Approach.Type = "Generic"
              ATM.ClientData[clientAlias].Approach.Type = "IFR"
              AI_ATC:ApproachSubMenu(clientAlias)
            else
              AI_ATC:LandingSubMenu(clientAlias)
              AI_ATC:DepartureSubMenu(clientAlias)
            end
          end

        else
          --local parentMenu = MENU_GROUP:New(group, "ATC")
          local parentMenu = AI_ATC.ParentMenu
          ATM.ClientData[clientAlias].ParentMenu = parentMenu
          AI_ATC:InitMenus(clientAlias)
          AI_ATC:ClearanceSubMenu(clientAlias)
          AI_ATC:GroundStartSubMenu(clientAlias)
          if not isHelo then
            AI_ATC:SpawnCrewChief(clientAlias)
          end
        end

        local Iterations = 10

        local function ProcessingComplete(clientAlias)
          local cdata = ATM.ClientData[clientAlias]
          if not cdata then return end
          local taxiway = cdata.Taxi
          if taxiway and taxiway[1] then
            local zone = AI_ATC.TaxiWay[taxiway[1]] and AI_ATC.TaxiWay[taxiway[1]].Zone
            if zone then
              AI_ATC:CalculateTaxiEntry(clientAlias, cdata.Coord, zone, true)
            end
          end
        end

        local function process()
          local completed = false
          while not completed do
            local startTime = timer.getTime()
            local count     = 0

            local cdata = ATM.ClientData[clientAlias]
            if not cdata or not cdata.Unit then
              env.info("AI_ATC:InitClients -> Missing client data or unit, stopping coroutine.")
              return
            end

            local groupObj = cdata.Unit:GetGroup()
            if not groupObj then
              env.info("AI_ATC:InitClients -> Missing group object, stopping coroutine.")
              return
            end

            local closestCoord, terminalID, distance, parkingSpotInfo = cdata.Coord:GetClosestParkingSpot(AI_ATC_Airbase)

            if not groupObj:IsAirborne() then
              cdata.SpotCoord  = closestCoord
              cdata.SpotNumber = terminalID
            else
              cdata.SpotNumber = 11
              local spotData   = AI_ATC_Airbase:GetParkingSpotData(11)
              if spotData then
                cdata.SpotCoord = spotData.Coordinate
              end
            end

            for spot, info in pairs(Andersen_ParkingSpot) do
              if info.Number == cdata.SpotNumber then
                cdata.Taxi = info.Taxi[AI_ATC.Runways.Takeoff[1]]
                ProcessingComplete(clientAlias)

                local endTime  = timer.getTime()
                local duration = endTime - startTime
                env.info(string.format("Parking data for %s calculated in %.2f seconds in spot %s.", clientAlias, duration, spot))
                completed = true
                break
              end

              count = count + 1
              if count >= Iterations then
                coroutine.yield()
                count = 0
              end
            end

            if completed then
              return
            end
          end
        end
        ATC_Coroutine:AddCoroutine(process)
      end
    end)

    for oldAlias in pairs(ATM.ClientData) do
      if not activeClients[oldAlias] and oldAlias~="Test F-16" then
        env.info("Removing inactive client: " .. oldAlias)
        if ATM.ClientData[oldAlias].CrewChief then
          ATM.ClientData[oldAlias].CrewChief:Destroy()
        end
        ATM.ClientData[oldAlias]    = nil
        ATM.GroundControl[oldAlias] = nil
      end
    end
  end

  LogClients()

  SCHEDULER:New(nil, function()
    LogClients()
  end, {}, 10, 10)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************CALCULATE TAXI ENTRY *******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:UpdateClient(Alias, Debug)

  if not ATM.ClientData or not ATM.ClientData[Alias] then
    if Debug then
      env.info(("AI_ATC:UpdateClient -> No data found for alias '%s'."):format(Alias))
    end
    return
  end

  local clientData = ATM.ClientData[Alias]
  local Unit       = clientData.Unit
  local Group      = Unit and Unit:GetGroup()
  local UnitCoord  = Unit and Unit:GetCoordinate()
  local airbase    = AI_ATC_Airbase
  local spotsTable = Andersen_ParkingSpot
  local runways    = AI_ATC.Runways and AI_ATC.Runways.Takeoff or {}


  if not (Unit and Group and UnitCoord and airbase and runways[1] and spotsTable) then
    if Debug then
      env.info(("AI_ATC:UpdateClient -> Missing essential data for alias '%s'."):format(Alias))
    end
    return
  end


  local MAX_ITERATIONS = 10
  local updateRequired = false
  local function ProcessingComplete()
    local taxiway = clientData.Taxi
    if taxiway and taxiway[1] then
      local zone = AI_ATC.TaxiWay[taxiway[1]] and AI_ATC.TaxiWay[taxiway[1]].Zone
      if zone then
        AI_ATC:CalculateTaxiEntry(Alias, UnitCoord, zone, false)
      end
    end
  end

  local function process()
    local completed = false
    local count     = 0
    while not completed do
      if not Group:IsAirborne() then
        local ClosestCoord, TerminalID, Distance, ParkingSpotInfo = UnitCoord:GetClosestParkingSpot(airbase)

        if Distance and Distance <= 10 then
          clientData.SpotCoord = ClosestCoord
          clientData.SpotNumber = TerminalID
          clientData.Coord = UnitCoord
          updateRequired = true
        end

        if clientData.SpotNumber ~= nil and updateRequired then
          local startTime = timer.getTime()
          for spot, info in pairs(spotsTable) do
            if info.Number == clientData.SpotNumber then
              clientData.Taxi = info.Taxi[runways[1]]
              ProcessingComplete()
              if clientData.Mark ~= nil then
                clientData.Mark = ClosestCoord:MarkToGroup(spot, Group, true)
              end
              if Debug then
                local endTime  = timer.getTime()
                local duration = endTime - startTime
                env.info(("Parking data for %s calculated in %.2f seconds in spot %s."):format(Alias, duration, spot))
              end
              completed = true
              break
            end
          end
          count = count + 1
          if count >= MAX_ITERATIONS and not completed then
            coroutine.yield()
            count = 0
          end
        else
          completed = true
        end
      else
        completed = true
      end
      if completed then
        return
      end
    end
  end

  ATC_Coroutine:AddCoroutine(process)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************CALCULATE TAXI ENTRY *******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CalculateTaxiEntry(Alias, Coordinate, PolyZone, Debug)

  if not Alias or not Coordinate or not PolyZone or #PolyZone == 0 then
    if Debug then
      env.info(
        ("AI_ATC:CalculateTaxiEntry -> Missing required parameters for alias '%s'."):format(tostring(Alias))
      )
    end
    return
  end

  local clientData = ATM.ClientData and ATM.ClientData[Alias]
  if not clientData then
    if Debug then
      env.info(("AI_ATC:CalculateTaxiEntry -> No client data found for alias '%s'."):format(tostring(Alias)))
    end
    return
  end

  local startTime        = timer.getTime()
  local closestPoint     = nil
  local closestDistance  = math.huge
  local MAX_ITERATIONS   = 10

  ATC_Coroutine:AddCoroutine(function()
    local iterationCount = 0
    local index          = 1
    local completed      = false

    while not completed do
      for i = index, #PolyZone do
        local vertex   = PolyZone[i]
        local distance = Coordinate:Get2DDistance(vertex)
        if distance < closestDistance then
          closestDistance = distance
          closestPoint    = vertex
        end

        iterationCount = iterationCount + 1
        if iterationCount >= MAX_ITERATIONS then
          index          = i + 1
          iterationCount = 0
          coroutine.yield()
        end
      end

      if index > #PolyZone then
        completed = true
      end
    end

    clientData.TaxiEntry = closestPoint

    local endTime  = timer.getTime()
    local duration = endTime - startTime
    if Debug then
      env.info(("Taxi Entry Calculation for '%s' completed in %.2f seconds at distance %.1f."):format(Alias, duration, closestDistance))
    end
  end)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************GET PARKINGSPOT*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GetParkingSpot(Alias, Coord, Debug)

  if not Alias or not Coord then
    if Debug then
      env.info(("AI_ATC:GetParkingSpot -> Missing Alias or Coord. Alias='%s'"):format(tostring(Alias)))
    end
    return false
  end

  if not AI_ATC_Airbase or not ATM.GroundControl or not ATM.GroundControl[Alias] then
    if Debug then
      env.info(("AI_ATC:GetParkingSpot -> Missing required data or ground control for alias '%s'."):format(Alias))
    end
    return false
  end

  local startTime = timer.getTime()

  local closestCoord, terminalID, distance, parkingSpotInfo = Coord:GetClosestParkingSpot(AI_ATC_Airbase)
  if not distance or distance > 10 then
    return false
  end

  ATM.GroundControl[Alias].SpotNumber = terminalID

  ATC_Coroutine:AddCoroutine(function()
    local MAX_ITERATIONS = 10
    local count          = 0
    local foundSpot      = false

    while not foundSpot do
      for spot, info in pairs(Andersen_ParkingSpot) do
        if info.Number == ATM.GroundControl[Alias].SpotNumber then
          local runways = AI_ATC.Runways and AI_ATC.Runways.Takeoff
          if runways and runways[1] and info.Taxi then
            ATM.GroundControl[Alias].Taxi = info.Taxi[runways[1]]
          end

          ATM.GroundControl[Alias].Spot = spot

          if AI_ATC.Runways and AI_ATC.Runways.TakeoffZone and AI_ATC.Runways.TakeoffZone[2] then
            local distance2Runway = Coord:Get2DDistance(AI_ATC.Runways.TakeoffZone[2])
            ATM.GroundControl[Alias].Distance2Runway = math.floor(distance2Runway + 0.5)
          end

          if Debug then
            local endTime  = timer.getTime()
            local duration = endTime - startTime
            env.info(("Parking spot for '%s' calculated in %.2f seconds."):format(Alias, duration))
          end
          foundSpot = true
          break
        end

        count = count + 1
        if count >= MAX_ITERATIONS then
          count = 0
          coroutine.yield()
        end
      end
    end
  end)

  return true
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************TOWER CONTROLLER***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TowerController(Debug)
  if Debug then
    SCHEDULER:New(nil, function()
      for alias, data in pairs(ATM.TowerControl) do
        local Subtitle = string.format("%s is %s", alias, data.State)
        MESSAGE:New(Subtitle, 4.5):ToAll()
      end
    end, {}, 5, 5)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************GROUND CONTROLLER*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GroundController(Debug)
  
  local AirbaseVec2 = AI_ATC_Vec3:GetVec2()
  local AirbaseZone = ZONE_RADIUS:New("AirbaseZone", AirbaseVec2, 2500)
  local TakeoffRunway = AI_ATC.Runways.Takeoff[1]
  local LandingRunway = AI_ATC.Runways.Landing[1]
  local GroundControlSet = SET_GROUP:New():FilterZones({AirbaseZone}):FilterCategoryAirplane():FilterCategoryHelicopter():FilterActive(true):FilterStart()
  
  local function CheckFlightGroups()
    for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
      for ClientName, _ in pairs(groupTable) do
        GroundControlSet:RemoveGroupsByName(ClientName)
      end
    end
  end

  local function CheckGroupSet()
    ATC_Coroutine:AddCoroutine(function()
      GroundControlSet:ForEachGroupAlive(function(GroupObject)
        
        local alias    = GroupObject:GetName()
        local isHelo   = GroupObject:IsHelicopter()
        local altitude = GroupObject:GetAltitude(true)
        local velocity = GroupObject:GetVelocityKNOTS()

        if (not isHelo and not GroupObject:IsAirborne()) or (isHelo and altitude <= 50) then
          if not ATM.GroundControl[alias] then
            local coord = GroupObject:GetCoordinate()

            ATM.GroundControl[alias] = {
              GroupObject   = GroupObject,
              Type          = GroupObject:GetTypeName(),
              Callsign      = GroupObject:GetCallsign(),
              State         = "Cold",
              StartedTaxi   = false,
              Stopped       = false,
              TaxiAuthority = false,
              TaxiRequested = false,
              Helo          = isHelo,
              TimeActive    = UTILS:SecondsOfToday(),
              IsPlayer      = GroupObject:IsPlayer()
            }

            if velocity <= 1 then
              ATC_Coroutine:AddCoroutine(function()
                AI_ATC:GetParkingSpot(alias, coord, true)
              end)
            else
              ATM.GroundControl[alias].Taxi            = { "Bravo", "Foxtrot" }
              ATM.GroundControl[alias].Spot            = "76"
              ATM.GroundControl[alias].SpotNumber      = 11
              ATM.GroundControl[alias].Distance2Runway = 372
            end

            coroutine.yield()
          end
        end
      end)
    end)
  end
  
  SCHEDULER:New(nil, function()
    TakeoffRunway = AI_ATC.Runways.Takeoff[1]
    LandingRunway = AI_ATC.Runways.Landing[1]
    local Groups, Units = GroundControlSet:CountAlive()
    if Groups >= 1 then
      CheckFlightGroups()
      GroundControlSet:RemoveGroupsByName(AI_Wingman_1)
      GroundControlSet:RemoveGroupsByName(AI_Wingman_2)
      GroundControlSet:RemoveGroupsByName(AI_Wingman_3)
      GroundControlSet:RemoveGroupsByName(AI_Wingman_4)
      CheckGroupSet()
    end
  end, {}, 2, 10)
  

  SCHEDULER:New(nil, function()
    local groupCount, unitCount = GroundControlSet:CountAlive()
    if groupCount < 1 then
      return
    end
    --ATC_Coroutine:AddCoroutine(function()
      for alias, data in pairs(ATM.GroundControl) do
        local groupObject = data.GroupObject
        if not groupObject then
          --coroutine.yield()
        else
          local coord      = groupObject:GetCoordinate()
          local isAirborne = groupObject:IsAirborne()
          local isHelo     = groupObject:IsHelicopter()
          local altitude   = groupObject:GetAltitude(true)
          local velocity   = groupObject:GetVelocityKNOTS()
          local client     = ATM.ClientData[alias]
          local taxi       = data.Taxi

          if taxi and ((not isHelo and not isAirborne) or (isHelo and altitude <= 50)) then
            if velocity < 1 and data.State ~= "Parked" and data.State ~= "Taxiing to runway" then
              local gotSpot = AI_ATC:GetParkingSpot(alias, coord, false)
              if gotSpot then
                data.State    = "Parked"
                data.Subtitle = string.format("%s is %s in spot %s", alias, data.State, data.Spot or "Unknown")
  
                if client and client.State ~= "Parked" then
                  AI_ATC:RepeatLastTransmission(alias, nil)
                  AI_ATC:UpdateClient(alias, false)
                  client.State        = "Parked"
                  data.CurrentTaxiway = data.Taxi and data.Taxi[1]
                  if ATM.TaxiQueue[alias] then
                    ATM.TaxiQueue[alias] = nil
                  end
                end
              end
  
            elseif velocity > 1 and velocity < 30 and data.State == "Landing" then
              data.State    = "Taxiing to Parking"
              data.Subtitle = string.format("%s is %s", alias, data.State)
              if client then
                client.State = "Taxiing to Parking"
              end
              
            elseif((velocity > 1 and velocity < 30) and data.State == "Parked")
            or (client and data.TaxiRequested and data.TaxiAuthority and data.State == "Parked")
            or ((velocity > 1 and velocity < 30) and (data.State == "Cold" and not client )) then
              data.State         = "Taxiing to runway"
              data.TaxiAuthority = true
              data.StartedTaxi   = true
              data.TaxiRequested = true
              AI_ATC:TaxiManager(alias)
              if client then
                client.State = "Taxiing to runway"
              end
              data.Subtitle = string.format("%s is %s %s via taxiway %s", alias, data.State, TakeoffRunway, data.Taxi[1] or "?")

            elseif velocity > 30 and data.State == "Taxiing to runway" then
              data.State = "Takeoff"
              if client then
                client.State = "Takeoff"
              end
              local runway  = TakeoffRunway or "Unknown"
              data.Subtitle = string.format("%s is %s via runway %s", alias, data.State, runway)
              AI_ATC.Runways.TakeoffHold = true
              if ATM.ClientData[alias].CrewChief then
                ATM.ClientData[alias].CrewChief:Destroy()
              end
            elseif velocity > 30 and data.State == "Cold" then
              data.State = "Landing"
              if client then
                client.State = "Landing"
              end
              local runway  = LandingRunway or "Unknown"
              data.Subtitle = string.format("%s is %s on runway %s", alias, data.State, runway)
            end

          else
            if data.State == "Takeoff" and isAirborne then
              data.State = "Airborne"
              local runway  = LandingRunway or "Unknown"
              data.Subtitle = string.format("%s is %s off runway %s", alias, data.State, runway)
              AI_ATC.Runways.TakeoffHold = false
              if client then
                client.State = "Airborne"
              end

            elseif data.State == "Landing" and isAirborne then
              data.State = "Airborne"
              data.Subtitle = string.format("%s is %s and going around", alias, data.State)
              AI_ATC.Runways.TakeoffHold = false
              if client then
                client.State = "Airborne"
              end
              
            elseif data.State == "Airborne" and isAirborne then
              ATM.GroundControl[alias] = nil
              if ATM.TaxiQueue[alias] then
                ATM.TaxiQueue[alias] = nil
              end
            end
          end

          if Debug and data.State == "Parked" then
            data.Subtitle = string.format("%s is %s in spot %s", alias, data.State, data.Spot or "Unknown")
          end
  
          if Debug and data.Subtitle then
            MESSAGE:New(data.Subtitle, 4.5):ToAll()
          end

          --coroutine.yield()
        end
      end
    --end)
  end, {}, 5, 5)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************TAXI MANAGER****************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiManager(Alias)

  if not Alias then
    env.info("AI_ATC:TaxiManager -> Alias is nil. Aborting.")
    return
  end

  local groundData = ATM.GroundControl and ATM.GroundControl[Alias]
  if not groundData then
    env.info(("AI_ATC:TaxiManager -> No ground control data found for alias '%s'."):format(tostring(Alias)))
    return
  end

  local groupObject = groundData.GroupObject
  if not groupObject then
    env.info(("AI_ATC:TaxiManager -> No group object for alias '%s'."):format(tostring(Alias)))
    return
  end

  local initiatorTaxiWay = groundData.Taxi and groundData.Taxi[1] or nil
  local initiatorParking = groundData.Distance2Runway
  local initiatorType    = groupObject:GetTypeName()

  if not ATM.TaxiQueue then
    ATM.TaxiQueue = {}
  end

  local function UpdateTaxiQueue(targetAlias)
    ATM.TaxiQueue[targetAlias] = {
      Name     = Alias,
      Type     = initiatorType,
      Taxi     = initiatorTaxiWay,
      Stopped  = false,
      Distance = initiatorParking
    }
    ATM.GroundControl[targetAlias].TaxiAuthority = false
  end

  for otherAlias, otherData in pairs(ATM.GroundControl) do

    if otherAlias ~= Alias then
      if otherData.IsPlayer then
        local otherCoord      = otherData.GroupObject and otherData.GroupObject:GetCoordinate()
        local otherDistance   = otherData.Distance2Runway
        local otherTaxiWay    = otherData.Taxi and otherData.Taxi[1] or nil
        local otherSpot       = otherData.Spot

        if otherData.TaxiAuthority == false then

          if not ATM.TaxiQueue[otherAlias] then
            UpdateTaxiQueue(otherAlias)

          elseif
            ATM.TaxiQueue[otherAlias]
            and ATM.TaxiQueue[otherAlias].Taxi ~= otherTaxiWay
            and initiatorTaxiWay == otherTaxiWay
          then
           UpdateTaxiQueue(otherAlias)


          elseif
            ATM.TaxiQueue[otherAlias]
            and ATM.TaxiQueue[otherAlias].Taxi == otherTaxiWay
            and initiatorTaxiWay == otherTaxiWay
            and initiatorParking >= ATM.TaxiQueue[otherAlias].Distance
            and ATM.TaxiQueue[otherAlias].Name ~= Alias
          then
              UpdateTaxiQueue(otherAlias)
          end

          local queuedTaxi    = ATM.TaxiQueue[otherAlias].Taxi
          local queuedGroup   = ATM.TaxiQueue[otherAlias].Name

          if queuedTaxi == otherTaxiWay then
            self:TaxiControl(otherAlias, otherTaxiWay, queuedGroup)
          end

        end
      end
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************TAXI CONTROLLER*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiControl(Client, Taxiway, Alias)

  if not Client or not Taxiway or not Alias then
    env.warning("AI_ATC:TaxiControl -> Missing Client, Taxiway, or Alias.")
    return
  end

  ATM.TaxiController[Client] = ATM.TaxiController[Client] or {}
  if ATM.TaxiController[Client][Alias] then
    ATM.TaxiController[Client][Alias]:Start()
    return
  end

  local clientData = ATM.ClientData[Client]
  local groundData = ATM.GroundControl[Alias]
  local ownGround  = ATM.GroundControl[Client]

  if not clientData or not groundData or not ownGround then
    env.warning(("AI_ATC:TaxiControl -> Missing data for Client='%s' or Alias='%s'."):format(tostring(Client), tostring(Alias)))
    return
  end

  local groupObject = groundData.GroupObject
  if not groupObject then
    env.warning(("AI_ATC:TaxiControl -> GroupObject is nil for Alias='%s'."):format(tostring(Alias)))
    return
  end

  if ownGround.TaxiAuthority == true then
    return
  end

  local firstUnit  = groupObject:GetUnit(1)
  local entryCoord = clientData.TaxiEntry
  local terminalCoord
  if clientData.Taxi and #clientData.Taxi > 1 then
    local terminalTaxiZone = clientData.Taxi[2]
    terminalCoord = AI_ATC_TerminalCoordinates[Taxiway]
                and AI_ATC_TerminalCoordinates[Taxiway][terminalTaxiZone]
  else
    terminalCoord = AI_ATC.Runways.TakeoffZone[2]
  end

  if not terminalCoord then
    env.warning(("AI_ATC:TaxiControl -> TerminalCoord is nil for Client='%s' at Taxiway='%s'"):format(Client, Taxiway))
    return
  end

  local hasAccelerated = false

  local newScheduler
  newScheduler = SCHEDULER:New(nil, function()

    if firstUnit 
       and firstUnit:IsAlive() 
       and ATM.GroundControl[Client] 
       and ATM.TaxiQueue[Client]
    then
      local taxiSpeed        = firstUnit:GetVelocityKNOTS()
      local terminalDistance = entryCoord:Get2DDistance(terminalCoord)
      local objectDistance   = firstUnit:GetCoordinate():Get2DDistance(terminalCoord)

      if not hasAccelerated and taxiSpeed >= 12 then
        hasAccelerated = true
      end
      local hasStopped = hasAccelerated and (taxiSpeed <= 3)

      if objectDistance <= terminalDistance or hasStopped then
        ownGround.TaxiAuthority = true
        ATM.TaxiQueue[Client].Stopped = hasStopped
        newScheduler:Stop()
      end
    else
      newScheduler:Stop()
    end

  end, {}, 1, 1)
  ATM.TaxiController[Client][Alias] = newScheduler
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************TAXI SUBTITLE*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiSubtitle(Alias)
  if not ATM.ClientData or not ATM.ClientData[Alias] then
    env.warning(("AI_ATC:TaxiSubtitle -> No ClientData found for alias '%s'."):format(tostring(Alias)))
    return ""
  end

  local taxiways = ATM.ClientData[Alias].Taxi
  if not taxiways or #taxiways == 0 then
    return ""
  end
  return table.concat(taxiways, ", ")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************HOLD SHORT**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoldShort(Alias)

  if not Alias then
    env.warning("AI_ATC:HoldShort -> Alias is nil.")
    return "06L" 
  end

  if not (ATM and ATM.ClientData and ATM.ClientData[Alias]) then
    env.warning(("AI_ATC:HoldShort -> Missing ATM.ClientData for alias '%s'."):format(tostring(Alias)))
    return "06L"
  end

  local clientData      = ATM.ClientData[Alias]
  local taxiways        = clientData.Taxi
  local primaryTaxiway  = taxiways and taxiways[1] or nil
  local parkingSpot     = clientData.Spot

  local activeRunway    = (AI_ATC.Runways and AI_ATC.Runways.Takeoff and AI_ATC.Runways.Takeoff[1]) or "06L"
  local holdShort       = activeRunway

  local HoldTable  = {
    ["06L"] = {
      Hold = "06R",
      ["Alpha"]=nil, 
      ["Bravo"]=nil
    },
    ["06R"] = { 
      Hold = "06L",
      ["Delta"]=nil, 
      ["Foxtrot"]=nil
    },
    ["24L"] = { 
      Hold = "06L",
      ["Delta"]=nil, 
      ["Foxtrot"]=nil
    },
  }

  if taxiways then
    for _, taxiway in ipairs(taxiways) do
      if HoldTable[activeRunway][taxiway] then
        holdShort = HoldTable[activeRunway].Hold
        break
      end
    end
  end

  if ATM.GroundControl and ATM.GroundControl[Alias] then
    ATM.GroundControl[Alias].HoldShort = holdShort
  end

  return holdShort
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************HOLD SHORT POST LANDING**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoldShortLanding(Alias)

  local DEFAULT_RUNWAY = "06L"
  if not Alias then
    env.warning("AI_ATC:HoldShortLanding -> 'Alias' is nil.")
    return DEFAULT_RUNWAY
  end

  if not (ATM and ATM.ClientData and ATM.ClientData[Alias]) then
    env.warning(("AI_ATC:HoldShortLanding -> Missing ATM.ClientData for alias '%s'."):format(tostring(Alias)))
    return DEFAULT_RUNWAY
  end

  local clientData   = ATM.ClientData[Alias]
  local taxiways     = clientData.Taxi
  local parkingSpot  = clientData.Spot
  local activeRunway = (AI_ATC.Runways and AI_ATC.Runways.Landing and AI_ATC.Runways.Landing[1]) or DEFAULT_RUNWAY
  local holdShort    = activeRunway 
  local turnDirection, Hold

  local runwayLogic = {
    ["06L"] = {
      ["Alpha"]   = { holdShort = "24L", direction = "Right", Hold = true},
      ["Bravo"]   = { holdShort = "24L", direction = "Right", Hold = true },
      ["Charlie"] = { holdShort = "06L", direction = "Right"},
      ["Delta"]   = { holdShort = "06L", direction = "Right" },
      ["Foxtrot"] = { holdShort = "06L", direction = "Right" },
    },
    ["06R"] = {
      ["Alpha"]   = { holdShort = "06R", direction = "Right" },
      ["Bravo"]   = { holdShort = "06R", direction = "Right" },
      ["Charlie"] = { holdShort = "06R", direction = "Left"  },
      ["Delta"]   = { holdShort = "06L", direction = "Left", Hold = true  },
      ["Foxtrot"] = { holdShort = "06L", direction = "Left", Hold = true  },
    },
    ["24L"] = {
      ["Alpha"]   = { holdShort = "24L", direction = "Left" },
      ["Bravo"]   = { holdShort = "24L", direction = "Left" },
      ["Charlie"] = { holdShort = "24L", direction = "Right" },
      ["Delta"]   = { holdShort = "06L", direction = "Right", Hold = true },
      ["Foxtrot"] = { holdShort = "06L", direction = "Right", Hold = true },
    },
    ["24R"] = {
      ["Alpha"]   = { holdShort = "06R", direction = "Left", Hold = true },
      ["Bravo"]   = { holdShort = "06R", direction = "Left", Hold = true },
      ["Charlie"] = { holdShort = "24R", direction = "Left" },
      ["Delta"]   = { holdShort = "24R", direction = "Right" },
      ["Foxtrot"] = { holdShort = "24R", direction = "Right" },
    },
  }

  if taxiways and runwayLogic[activeRunway] then
    local logicForRunway = runwayLogic[activeRunway]
    for _, taxiway in ipairs(taxiways) do
      local rule = logicForRunway[taxiway]
      if rule then
        holdShort    = rule.holdShort
        turnDirection = rule.direction
        Hold = rule.Hold
        break
      end
    end
  end

  if ATM.GroundControl and ATM.GroundControl[Alias] then
    ATM.GroundControl[Alias].HoldShortLanding = holdShort
  end

  return holdShort, turnDirection, Hold
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC EXTRACT RUNWAY HEADING******************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ExtractRunwayHeading(runway)
  local MagDec = UTILS.GetMagneticDeclination(UTILS.GetDCSMap())
  local heading = tonumber(runway:sub(1, 2)) * 10
  return heading + MagDec
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC EXTRACT RUNWAY HEADING******************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AngularDifference(heading1, heading2)
  local diff = math.abs(heading1 - heading2)
  if diff > 180 then diff = 360 - diff end
  return diff
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC TERMINATE SCHEDULER OBJECTS******************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TerminateSchedules(Alias)
local SchedulerObjects = ATM.ClientData[Alias].SchedulerObjects

  for i = #SchedulerObjects, 1, -1 do
    local scheduler = SchedulerObjects[i]
    scheduler:Stop()
    table.remove(SchedulerObjects, i)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC CLOCK BEARING***************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeadingToClockBearing(heading)
  heading = heading % 360
  local clockBearing = math.floor((heading + 15) / 30)
  if clockBearing == 0 then
    clockBearing = 12
  elseif clockBearing > 12 then
    clockBearing = clockBearing - 12
  end
  
  return clockBearing
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC RECTIFY HEADING*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RectifyHeading(String)
  if #String == 1 then
    String = "00" .. String
  end
  
  if #String == 2 then
    String = "0" .. String
  end
  
  return String
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC MAGNETIC HEADING*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CorrectHeading(heading)
  local MagDec = UTILS.GetMagneticDeclination(UTILS.GetDCSMap())
  local Heading = math.floor(heading)
  Heading = (Heading - MagDec) % 360
  if Heading < 0 then Heading = Heading + 360 end
  
  return tostring(Heading)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC TRAFFIC CARDINAL*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadCardinal(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Cardinal[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Cardinal/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC CLOSEST AIRBASES*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GetClosestAirbase(coord)

  local distances = {}

  for _, airfieldName in ipairs(Marianas_Airfields) do
    local Navpoint = AI_ATC_Navpoints[airfieldName]
    if Navpoint then
      local distance = coord:Get2DDistance(Navpoint)
      table.insert(distances, {
        Name = airfieldName,
        Distance = distance
      })
    end
  end

  table.sort(distances, function(a, b)
    return a.Distance < b.Distance
  end)

  local closest10 = {}
  for i = 1, math.min(10, #distances) do
    table.insert(closest10, distances[i])
  end

  return closest10
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************GENERATE AIRFIELD MENUS***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AirfieldMenus(Agency, Alias, Menu)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local SchedulerObject
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if Unit and Unit:IsAlive() then
      local Coord = Unit:GetCoordinate()
      Menu:RemoveSubMenus()
      local closestAirfields = AI_ATC:GetClosestAirbase(Coord)
      for i, data in ipairs(closestAirfields) do
        local airfieldName = data.Name
        MENU_GROUP_COMMAND:New(Group, airfieldName, Menu, function() AI_ATC:NavAssist(Alias, airfieldName, Agency) end, Group)
      end
    else 
      SchedulerObject:Stop()
    end
  end,{}, 0.5, 120)
  table.insert(SchedulerObjects, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************************************ATC DEPARTURE CARDINAL*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:DepartureCardinal(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Cardinal2[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Cardinal2/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC HEADING*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Heading(String, RadioObject, transmitter, audio)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  --local num = tonumber(String)
  --num = math.floor((num + 2.5) / 5) * 5
  --String = tostring(num)
  
  if #String == 2 then
    String = "0" .. String
  end
  
  if audio==true then  
    for i = 1, #String do
      local digit = string.sub(String, i, i)
      local matchedValue = AI_ATC_SoundFiles[RadioKey][digit]
      
      if matchedValue then
        RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
      end
    end
  else
    return String
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************ATC READ HEADING*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadHeading(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  
  if #String == 1 then
    String = "00" .. String
  end
  
  if #String == 2 then
    String = "0" .. String
  end
  
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Heading[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Heading/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC READ DIGITS*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadDigits(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  
  for i = 1, #String do
    local digit = String:sub(i, i)
    local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]

    if matchedValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC READ NUMBER*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadNumber(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
  else
    AI_ATC:ReadDigits(String, RadioObject, transmitter)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC READ RANGE*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadRange(numberString, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter] and AI_ATC.Radio[transmitter].Key 
  local length = #numberString
  local i = 1

  while i <= length do
    local digit = string.sub(numberString, i, i)
    local positionFromRight = length - i
    local soundKey

    if positionFromRight == 0 then
      if digit ~= "0" then
        soundKey = digit
      end

    elseif positionFromRight == 1 then
      if digit == "1" then
        local teenNumber = string.sub(numberString, i, i + 1)
        soundKey = teenNumber
        i = i + 1
      elseif tonumber(digit) > 1 then
        soundKey = tostring(tonumber(digit) * 10)
      end

    else
      if tonumber(digit) > 0 then
        soundKey = digit .. string.rep("0", positionFromRight)
      end
    end

    if soundKey and AI_ATC_SoundFiles[RadioKey].Numerical[soundKey] then
      local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[soundKey]
      local FileName = matchedValue.filename
      local Duration = matchedValue.duration
      RadioObject:NewTransmission(string.format("Numerical/%s", FileName), Duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
    end
    i = i + 1
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC READ THOUSANDS******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadThousands(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local firstDigit = string.sub(String, 1, 1)
  local firstValue = AI_ATC_SoundFiles[RadioKey].Numerical[firstDigit]
  if firstValue then
    RadioObject:NewTransmission(string.format("Numerical/%s", firstValue.filename), firstValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
  end
  if tonumber(String) >= 10000 then
    local secondDigit = string.sub(String, 2, 2)
    local secondValue = AI_ATC_SoundFiles[RadioKey].Numerical[secondDigit]
    if secondValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", secondValue.filename), secondValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
    end
  end
  
  RadioObject:NewTransmission("Numerical/ATIS_Thousand.ogg", 0.557, "Airbase_ATC/ATIS/", nil, 0.01)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC READ FLIGHT LEVEL***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadFlightLevel(String, RadioObject, transmitter, audio)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local Hundreds, FlightLevel

  local beforeDecimal, afterDecimal
  if string.find(String, "%.") then
    beforeDecimal = string.match(String, "^(%d+)%..*") 
    afterDecimal = string.match(String, "%.(%d+)$")
    Hundreds = afterDecimal .. "00"
  else
    beforeDecimal = String
  end

  local audioKey = string.format("%s0", beforeDecimal)

  local matchedValue = AI_ATC_SoundFiles[RadioKey].FlightLevel[audioKey]
  if matchedValue and audio then
    RadioObject:NewTransmission(string.format("FlightLevel/%s", matchedValue.filename),matchedValue.duration,string.format("Airbase_ATC/%s/", RadioKey),nil,0.02)
  end

  if Hundreds then
    local matchedValue2 = AI_ATC_SoundFiles[RadioKey].Numerical[Hundreds]
    if matchedValue2 and audio then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue2.filename),matchedValue2.duration,string.format("Airbase_ATC/%s/", RadioKey),nil,0.02)
    end
  end

  if afterDecimal then
    if tonumber(beforeDecimal) < 18 then
      FlightLevel = string.format("%s,%s00", beforeDecimal, afterDecimal)
    else
      FlightLevel = string.format("FL%s%s", beforeDecimal, afterDecimal)
    end
  else
    if tonumber(beforeDecimal) < 18 then
      FlightLevel = string.format("%s000", beforeDecimal)
    else
      FlightLevel = string.format("FL%s0", beforeDecimal)
    end
  end

  return FlightLevel
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC READ DIGITS*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ClockBearing(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Oclock[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Oclock/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.02)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC READ SID*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadSID(string, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].SID[string]
  if matchedValue then
    RadioObject:NewTransmission(string.format("SoundFiles/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.02)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC READ VFR*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadVFR(string, RadioObject, transmitter, audio)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].VFR[string]
  if matchedValue then
    if audio==true then
      RadioObject:NewTransmission(string.format("SoundFiles/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.02)
    end
    return matchedValue.Subtitle
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC AIRBASE NAME****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AirbaseName(string, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Airbase[string]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Airbase/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.02)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************ATC CALLSIGN*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Callsign(inputString, RadioObject, transmitter, flight)
  local ExcludedStrings = {
  ["BlackJack"] = true,
  ["Overlord"]  = true,
  ["Magic"]     = true,
  ["Wizard"]    = true,
  ["Focus"]     = true,
  ["Darkstar"]  = true
  }

  local substrings = {}
  local RadioKey, File, Duration, firstPart, secondPart, firstDigit, character1, character2, CountNumerical, Name
  RadioKey = AI_ATC.Radio[transmitter].Key
  
  local function splitAtFirstNumeric(str)
    local position = string.find(str, "%d")
    if position then
        local prefix = string.sub(str, 1, position - 1)
        local numericPart = string.sub(str, position)
        return prefix, numericPart, string.sub(str, position, position)
    else
        return str, nil, nil
    end
  end

  inputString = string.gsub(inputString, "-", "")
  local prefix, numerical, firstDigit = splitAtFirstNumeric(inputString)

  if flight and firstDigit then
    numerical = firstDigit .. " flight"
  end
  
  table.insert(substrings, prefix)
  table.insert(substrings, numerical)
  local Entry = AI_ATC_SoundFiles[RadioKey].Callsigns[prefix]
  
  if not ExcludedStrings[inputString] then
    CountNumerical = #numerical
  end

  if Entry then
    RadioObject:NewTransmission(string.format("CallSigns/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
    if not ExcludedStrings[inputString] and CountNumerical==2 and not flight then
      File = AI_ATC_SoundFiles[RadioKey].CallsignsNumerical[numerical].filename
      Duration = AI_ATC_SoundFiles[RadioKey].CallsignsNumerical[numerical].duration
      RadioObject:NewTransmission(string.format("CallsignsNumerical/%s", File), Duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
    elseif not ExcludedStrings[inputString] and CountNumerical>2 and not flight then
      for i = 1, #numerical do
        local digit = string.sub(numerical, i, i)
        local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]
        if matchedValue then
          RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
        end
      end
    elseif flight and numerical then
      local File = AI_ATC_SoundFiles[RadioKey].CallsignsNumerical[numerical]
      if File then
        RadioObject:NewTransmission(string.format("CallsignsNumerical/%s", File.filename), File.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
      end
    end
  else
    File = AI_ATC_SoundFiles[RadioKey].CallsignsNumerical["11"].filename
    Name = File.filename
    Duration = File.duration
    RadioObject:NewTransmission("Aircraft/Colt.ogg", 1.3, string.format("Airbase_ATC/%s/", RadioKey))
    RadioObject:NewTransmission(string.format("CallsignsNumerical/%s", File), Duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
  end
      
  return substrings
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC FLIGHT CALLSIGN********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:UpdateFlightCallsign(Alias)

  local ClientObject = ATM.ClientData[Alias]
  local Callsign = ClientObject.Callsign

  local function splitAtFirstNumeric(str)
    local position = string.find(str, "%d")
    if position then
        local prefix = string.sub(str, 1, position - 1)
        local numericPart = string.sub(str, position)
        return prefix, numericPart, string.sub(str, position, position)
    else
        return str, nil, nil
    end
  end
  
  local String = string.gsub(Callsign, "-", "")
  local prefix, numerical, firstDigit = splitAtFirstNumeric(String)
  
  ClientObject.FlightCallsign = prefix.."-"..firstDigit.." flight"
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC WIND DIRECTION*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:WindDirection(numberString, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  
  if #numberString == 2 then
    numberString = "0" .. numberString
  end
    
  local length = #numberString 
  for i = 1, length do
    local digit = string.sub(numberString, i, i)
    local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]
    if matchedValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************ATC WIND SPEED*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:WindSpeed(number, String, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local Title = string.format("%s %s", AI_ATC.Airbase, transmitter)

  if number >= 0 and number <= 3 then
    local Subtitle = string.format("%s: Winds Calm", Title)
    RadioObject:NewTransmission("WindsCalm.ogg", 1.18, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 1.1)
  end
  if number >= 4 and number <= 12 then
    local Subtitle = string.format("%s: Light winds", Title)
    RadioObject:NewTransmission("WindsLight.ogg", 0.662, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 0.6)
  end
  if number >= 13 and number <= 24 then
    local Subtitle = string.format("%s: Moderate winds blowing %s", Title, String)
    RadioObject:NewTransmission("WindsModerate.ogg", 0.825, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 1.4)
    RadioObject:NewTransmission("Blowing.ogg", 0.350, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, nil)
    AI_ATC:WindDirection(String, RadioObject, transmitter)
  end
  if number >= 25 then
    local Subtitle = string.format("%s: Strong winds blowing %s", Title, String)
    RadioObject:NewTransmission("WindsStrong.ogg", 0.766, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 1.4)
    RadioObject:NewTransmission("Blowing.ogg", 0.350, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, nil)
    AI_ATC:WindDirection(String, RadioObject, transmitter)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************ATC PRESSURE*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Pressure(number, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local roundedNum = math.floor(number * 100 + 0.5) / 100
  local numStr = tostring(roundedNum)
  local lastCharWasNine = false

  for i = 1, #numStr do
    local c = numStr:sub(i, i)
    if c == '9' then
      RadioObject:NewTransmission("Niner.ogg", 0.434, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, nil)
      lastCharWasNine = true
    elseif c == '.' then
      if not lastCharWasNine then
        local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[c]
        if matchedValue then
          RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
        end
      end
      lastCharWasNine = false
    elseif c ~= '.' then
      local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[c]
      if matchedValue then
        RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
      end
      lastCharWasNine = false
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC PROCESS TIME*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ProcessTime(String, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local SanitizedString = string.gsub(String, ":", "")
  local HHMM = string.sub(SanitizedString, 1, 4)
  
  for i = 1, #HHMM do
    local digit = string.sub(HHMM, i, i)
    local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]
    
    if matchedValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC ANGLE DELTA*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AngleDelta(angle1, angle2)

  local a1 = (angle1 % 360 + 360) % 360
  local a2 = (angle2 % 360 + 360) % 360

  local diff = math.abs(a1 - a2) % 360

  if diff > 180 then
    diff = 360 - diff
  end
  
  return diff
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC RUNWAY*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Runway(String, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Runway[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Runway/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC NAVPOINT-*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadNavpoint(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].NavPoint[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("NavPoint/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC RUNWAY*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Runway2(String, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local length = #String
  local NumericString = ""
  local AlphaString = ""
    
  if length == 3 then
    local lastChar = string.sub(String, length, length)
    AlphaString = lastChar
    local NumberString = string.sub(String, 1, length - 1)
    NumericString = string.sub(String, 1, length - 1)
  else
    NumericString = String
  end

  for i = 1, #NumericString do
    local digit = string.sub(NumericString, i, i)
    local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]
    if matchedValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
    end
  end
    
  if #AlphaString > 0 then
    local matchedValue = AI_ATC_SoundFiles[RadioKey].Direction[AlphaString]
    if matchedValue then
      RadioObject:NewTransmission(string.format("SoundFiles/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
    end
  end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************READ TAXI INSTRUCTIONS****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadTaxiInstructions(Alias, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local TaxiData = ATM.ClientData[Alias].Taxi
  local NumberOfTaxiways = #TaxiData
  
  for i = 1, NumberOfTaxiways do
    local TaxiName = TaxiData[i]
    local Entry = AI_ATC_SoundFiles[RadioKey].Phonetic[TaxiName]
    
    if Entry then
      RadioObject:NewTransmission(string.format("Phonetic/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
    end  
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC SPOT NUMBER*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SpotNumber(spot, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local Iteration = 10
  local Count = 0
  local inputString
  
  local function Execute(inputString)
    local length = #inputString
    local NumericString = ""
    local AlphaString = ""
    local FirstCharecter
    
    local FirstCharecter = string.sub(inputString, 1, 1)
    if string.match(FirstCharecter, "%a") then
      AlphaString = FirstCharecter
      NumericString = string.sub(inputString, 2)
    else
      NumericString = inputString
    end
    
    local Phonetic = AI_ATC_SoundFiles.ATIS.PhoneticAlphabet[AlphaString]
    if Phonetic then 
      AI_ATC:Phonetic(Phonetic, RadioObject, transmitter)
    end
    
    for i = 1, #NumericString do
      local digit = string.sub(NumericString, i, i)
      local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]
    
      if matchedValue then
        RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
      end
    end
  end

  ATC_Coroutine:AddCoroutine(function()
    local inputString = nil
    for key, value in pairs(Andersen_ParkingSpot) do
      Count = Count + 1
      if value.Number == spot then
        inputString = key
        Execute(inputString)
        break
      end
      if Count >= Iteration then
        Count = 0
        coroutine.yield()
      end
    end
  end)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC PHONETIC*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Phonetic(AlphaString, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key

  local Entry = AI_ATC_SoundFiles[RadioKey].Phonetic[AlphaString]
  if Entry then
    RadioObject:NewTransmission(string.format("Phonetic/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC TAXI QUEUE*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiQueue(Alias, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local Title = string.format("%s %s", AI_ATC.Airbase, transmitter)
  local Count = 0

  for alias, data in pairs(ATM.GroundControl) do
    if data.IsPlayer==false and data.State=="Taxiing to runway" then 
      Count = Count + 1
    elseif data.IsPlayer==true and data.TaxiAuthority==true then
      Count = Count + 1
    end
  end

  if Count > 1 and ATM.TaxiQueue[Alias] then
    local Type = ATM.TaxiQueue[Alias].Type
    local Taxiway = ATM.TaxiQueue[Alias].Taxi
    local Queue = tostring(Count)
    local Subtitle = string.format("%s: Your number %s in line for departure,", Title, Queue)
    RadioObject:NewTransmission("YourNumber.ogg", 0.522, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.3, Subtitle, 2)

    local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[Queue]
    if matchedValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
      RadioObject:NewTransmission("InLine.ogg", 1.068, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.3)
    end

    if Taxiway == ATM.ClientData[Alias].Taxi[1] then
      local UnitType = ATM.TaxiQueue[Alias].Type
      local Entry = AI_ATC_SoundFiles[RadioKey].Aircraft[UnitType]
      if Entry then
        local Subtitle = string.format("%s: follow the %s in front of you", Title, Type)
        RadioObject:NewTransmission("FollowThe.ogg", 0.480, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1, Subtitle, 1.5)
        RadioObject:NewTransmission(string.format("Aircraft/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
        RadioObject:NewTransmission("InFront.ogg", 0.615, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, nil)
      end
    else
      local UnitType = ATM.TaxiQueue[Alias].Type
      local Entry = AI_ATC_SoundFiles[RadioKey].Aircraft[UnitType]
      if Entry then
        local Subtitle = string.format("%s: Behind the %s on taxiway %s", Title, Type, Taxiway)
        RadioObject:NewTransmission("Behind.ogg", 0.557, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1, Subtitle, 1.6)
        RadioObject:NewTransmission(string.format("Aircraft/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
        RadioObject:NewTransmission("OnTaxiway.ogg", 0.708, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, nil)
      end

      local Entry = AI_ATC_SoundFiles[RadioKey].Phonetic[Taxiway]
      if Entry then
        RadioObject:NewTransmission(string.format("Phonetic/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
      end
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************TAXI TO PARKING*****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiToParking(Alias, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local Title = string.format("%s %s", AI_ATC.Airbase, transmitter)
  local Unit = ATM.ClientData[Alias].Unit
  local UnitHeading = 210 --Unit:GetHeading()
  local InitiatorCoord = ATM.ClientData[Alias].Coord
  local TaxiData = ATM.ClientData[Alias].Taxi[1]
  local PlayerEntry = ATM.ClientData[Alias].TaxiEntry
  local ActiveRunway = AI_ATC.Runways.LandingZone
  local TerminalCoordinates ={}
  local subtitles = {}
  local Subtitle= ""

  -------------------------------------------
  local function ReverseTable(tbl)
    local reversedTable = {}
    for i = #tbl, 1, -1 do
      table.insert(reversedTable, tbl[i])
    end
    return reversedTable
  end
  -------------------------------------------
  local TaxiTable = AI_ATC_TaxiToPark[AI_ATC.Runways.Landing[1]][TaxiData]
  local NumberOfTaxiways = #TaxiTable
  local currentZone = ActiveRunway
  local currentTaxiway = "RunwayExit"
  local currentVertices = currentZone--:GetVerticiesCoordinates()
  local compareZone = AI_ATC.TaxiWay[TaxiTable[1]].Zone
  local compareVertices = compareZone--:GetVerticiesCoordinates()
  
  local shortestDistance = math.huge
  local TerminalCoord = nil
  for _, vertex1 in pairs(currentVertices) do
      for _, vertex2 in pairs(compareVertices) do
        local distance = vertex1:Get2DDistance(vertex2)
        if distance < shortestDistance then
          shortestDistance = distance
          TerminalCoord = vertex1
        end
      end
    TerminalCoordinates[currentTaxiway] = { Coord = TerminalCoord }
  end

  for i = 1, NumberOfTaxiways do
    local currentTaxiway = TaxiTable[i]
    local currentZone = AI_ATC.TaxiWay[currentTaxiway].Zone
    local currentVertices = currentZone

    local compareZone
    local compareVertices
    if i < NumberOfTaxiways then
      compareZone = AI_ATC.TaxiWay[TaxiTable[i + 1]].Zone
      compareVertices = compareZone
    else
      compareZone = AI_ATC.Runways.TakeoffZone
      compareVertices = PlayerEntry
    end
    
    local shortestDistance = math.huge
    local TerminalCoord = nil
    if i < NumberOfTaxiways then
      for _, vertex1 in pairs(currentVertices) do
        for _, vertex2 in pairs(compareVertices) do
          local distance = vertex1:Get2DDistance(vertex2)
          if distance < shortestDistance then
            shortestDistance = distance
            TerminalCoord = vertex1
          end
        end
      end
      TerminalCoordinates[currentTaxiway] = { Coord = TerminalCoord }
    else
       for _, vertex1 in pairs(currentVertices) do
          local vertex2 = compareVertices
          local distance = vertex1:Get2DDistance(vertex2)
          if distance < shortestDistance then
            shortestDistance = distance
            TerminalCoord = vertex1
        end
      end
      TerminalCoordinates[currentTaxiway] = { Coord = TerminalCoord }
    end
  end
  --------------------MARK TERMINAL COORDINATES--------------------------
  --local UniqueStrings = {}
  --for key, _ in pairs(TerminalCoordinates) do
    --local uniqueString = key .. "_Terminal"
    --UniqueStrings[key] = uniqueString
  --end
  --for key, coordinate in pairs(TerminalCoordinates) do
    --local uniqueString = UniqueStrings[key]
    --coordinate.Coord:MarkToAll(uniqueString)
  --end
  ----------------------------------------------------------------------
  for i = 1, NumberOfTaxiways do
    local PrimaryTaxiway
    local PrimaryTerminal
    local SecondaryTaxiway
    local SecondaryTerminal
    local SecondaryHeading
    local ReferenceHeading
    local TerminalHeading
    local HeadingDiff
    local TurnDirection
    if i == 1 then
      PrimaryTaxiway = TaxiTable[i]
      PrimaryTerminal = TerminalCoordinates[PrimaryTaxiway].Coord
      SecondaryTaxiway = "RunwayExit"
      SecondaryTerminal = TerminalCoordinates[SecondaryTaxiway].Coord
      ReferenceHeading = UnitHeading
      TerminalHeading =  SecondaryTerminal:HeadingTo(PrimaryTerminal)
      HeadingDiff = TerminalHeading - ReferenceHeading
      TerminalCoordinates[PrimaryTaxiway].Heading = TerminalHeading
    end
    if i > 1 then
      PrimaryTaxiway = TaxiTable[i]
      PrimaryTerminal = TerminalCoordinates[PrimaryTaxiway].Coord
      SecondaryTaxiway = TaxiTable[i-1]
      SecondaryTerminal = TerminalCoordinates[SecondaryTaxiway].Coord
      SecondaryHeading = TerminalCoordinates[SecondaryTaxiway].Heading
      ReferenceHeading = SecondaryHeading
      TerminalHeading = SecondaryTerminal:HeadingTo(PrimaryTerminal)     
      HeadingDiff = TerminalHeading - ReferenceHeading
      TerminalCoordinates[PrimaryTaxiway].Heading = TerminalHeading
    end
    if HeadingDiff > 180 then
     HeadingDiff = HeadingDiff - 360
    elseif HeadingDiff < -180 then
      HeadingDiff = HeadingDiff + 360
    end
    if HeadingDiff > 0 then
      TurnDirection = "Right"
    elseif HeadingDiff < 0 then
      TurnDirection = "Left"
    end
    TerminalCoordinates[PrimaryTaxiway].Direction = TurnDirection
  end
 
  local iterations = 0
  for i = 1, NumberOfTaxiways do
    local TaxiName = TaxiTable[i]
    local TurnDirection = TerminalCoordinates[TaxiName].Direction
    local Subtitle -- Define Subtitle here
    iterations = iterations + 1
    if iterations == 1 then
      Subtitle = TurnDirection .. " turn " .. TaxiName
    else
      Subtitle = TurnDirection .. " " .. TaxiName
    end
    if iterations < NumberOfTaxiways then
      Subtitle = Subtitle .. ", " 
    end
    if iterations == NumberOfTaxiways then
      Subtitle = Subtitle .. ". " 
    end
    table.insert(subtitles, Subtitle)
  end

  local concatenatedSubtitles = table.concat(subtitles, " ")
  Subtitle = concatenatedSubtitles
  local Count = 0
  for i = 1, NumberOfTaxiways do
    local TaxiName = TaxiTable[i]
    local TurnDirection = TerminalCoordinates[TaxiName].Direction
    if Count == 0 then
      if TurnDirection == "Left" then
        RadioObject:NewTransmission("LeftTurn.ogg", 0.522, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 1.5)
        Count = Count + 1
      end
      if TurnDirection == "Right" then
        RadioObject:NewTransmission("RightTurn.ogg", 0.546, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 1.5)
        Count = Count + 1
      end
    else
      if TurnDirection == "Left" then
        RadioObject:NewTransmission("Left.ogg", 0.395, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1)
        Count = Count + 1
      end
      if TurnDirection == "Right" then
        RadioObject:NewTransmission("Right.ogg", 0.430, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1)
        Count = Count + 1
      end
    end
    
    local matchingKey
    for key, _ in pairs(AI_ATC_SoundFiles[RadioKey].Phonetic) do
      if key == TaxiName then
        matchingKey = key
        break
      end
    end
    if matchingKey then
      local matchedEntry = AI_ATC_SoundFiles[RadioKey].Phonetic[matchingKey]
      RadioObject:NewTransmission(string.format("Phonetic/%s", matchedEntry.filename), matchedEntry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
    end  
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************TAXI REQUEST********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiRequest(Alias)
  local groundControl = ATM.GroundControl
  local currentControl = groundControl[Alias]
  
  if not currentControl then
    env.info(string.format("AI_ATC:TaxiRequest - Alias '%s' not found in GroundControl.", Alias))
    return
  end

  local count = 0
  for _ in pairs(groundControl) do
    count = count + 1
  end

  if count == 1 then
    currentControl.TaxiAuthority = true
    return
  end

  local Taxiway = currentControl.Taxi and currentControl.Taxi[1]
 
  if not Taxiway then
    env.info(string.format("AI_ATC:TaxiRequest: %s does not have a valid Taxiway.", Alias))
    return
  end

  local restrictedTaxiways = { Alpha = true }
  if restrictedTaxiways[Taxiway] then
    currentControl.TaxiAuthority = false
    return
  end

  for otherAlias, data in pairs(groundControl) do
    if data and otherAlias ~= Alias and data.TaxiAuthority and data.Taxi and data.Taxi[1] == Taxiway then
      local Distance = data.Distance2Runway
      if Distance >= currentControl.Distance2Runway then
        currentControl.TaxiAuthority = false
        AI_ATC:TaxiControl(Alias, Taxiway, otherAlias)
        return
      end
    end
  end

  currentControl.TaxiAuthority = true

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC NAVIGATION ASSISTANCE**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:NavAssist(Alias, NavPoint, Transmitter)

  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientObject.Callsign
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:NavAssist(Alias, NavPoint, Transmitter) end, Transmitter)==false then
    return
  end

  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:NavAssist(Alias, NavPoint, Transmitter) end)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)

  SCHEDULER:New( nil, function()
    local UnitCoord = Unit:GetCoord()
    local UnitHeading = Unit:GetHeading()
    local Destination = AI_ATC_Navpoints[NavPoint]:GetCoordinate()
    local Heading = AI_ATC:CorrectHeading(UnitCoord:HeadingTo(Destination))
    local HeadingSub = AI_ATC:Heading(Heading, RadioObject, Transmitter, false)
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, Vectors for %s, fly heading %s", Transmitter, CallsignSub, NavPoint, HeadingSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("VectorsFor.ogg", 0.952, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    AI_ATC:ReadNavpoint(NavPoint, RadioObject, Transmitter)
    RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.03)
    AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
  end,{}, Delay)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATIS START**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:StartATIS()

  if AI_ATC.ATIS.Active or AI_ATC.ATIS.Data.FC3switch then
    return
  end
  AI_ATC.ATIS.Active = true

  local RadioObject  = ATIS_RADIO
  local AirbaseName  = AI_ATC.Airbase or "Unknown"
  local Airbase      = string.format("%s Airforce base", AirbaseName)
  local Title        = "ATIS"

  local function ATISCoroutine()

    do
      local Time = timer.getAbsTime() - UTILS.GMTToLocalTimeDifference() * 60 * 60
      if Time < 0 then Time = 24 * 60 * 60 + Time end
      local Clock = UTILS.SecondsToClock(Time)
      local Zulu = UTILS.Split(Clock, ":")
      local ZULU = string.format("%s00", Zulu[1])
      local NATO = AI_ATC_NatoTime[tonumber(Zulu[1]) + 1]
      AI_ATC.ATIS.Data.Information = NATO
      AI_ATC.ATIS.Data.ZULU = ZULU
    end
    coroutine.yield()

    do
      local depRunway = AI_ATC.Runways.Takeoff and AI_ATC.Runways.Takeoff[1] or "03L"
      local arrRunway = AI_ATC.Runways.Landing and AI_ATC.Runways.Landing[1] or "21L"

      AI_ATC.ATIS.Data.Departure = depRunway
      AI_ATC.ATIS.Data.Arrival   = arrRunway

      if depRunway == arrRunway then
        AI_ATC.ATIS.Data.Active = depRunway
      else
        AI_ATC.ATIS.Data.Active = nil
      end
    end
    coroutine.yield()

    do
      local Coord = AI_ATC_Airbase and AI_ATC_Airbase:GetCoordinate()
      if not Coord then
        env.warning("AI_ATC:StartATIS -> Could not get AI_ATC_Airbase coordinate.")
      else
        local Fog  = AI_ATC.ATIS.Data.Fog  or false
        local Rain = AI_ATC.ATIS.Data.Rain or false
        if Coord:IsDay() and not Fog and not Rain then
          AI_ATC.ATIS.Data.Approach = "VFR"
          AI_ATC.Procedure          = "VFR"
        else
          AI_ATC.ATIS.Data.Approach = "IFR"
          AI_ATC.Procedure          = "IFR"
        end
      end
    end
    coroutine.yield()

    do
      local Information = AI_ATC.ATIS.Data.Information or "Alpha"
      local Subtitle    = string.format("%s: %s Information %s", Title, Airbase, Information)

      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 1, Subtitle, 5)
      AI_ATC:AirbaseName(AirbaseName, RadioObject, Title)
      RadioObject:NewTransmission("Information.ogg", 0.819, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.1)
      AI_ATC:Phonetic(Information, RadioObject, Title)
    end
    coroutine.yield()

    do
      local ZuluTime      = AI_ATC.ATIS.Data.ZULU
      local WindDirection = AI_ATC.ATIS.Data.WindDirection
      local WindSpeed     = AI_ATC.ATIS.Data.WindSpeed
      local Gusting       = AI_ATC.ATIS.Data.Gusting
      local GustingSub    = Gusting and ", Gusting" or ""

      local Subtitle = string.format("%s: %s Zulu", Title, ZuluTime)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 3)
      AI_ATC:ReadDigits(ZuluTime, RadioObject, Title)
      AI_ATC:Phonetic("Zulu", RadioObject, Title)

      Subtitle = string.format("%s: Wind from %s at %s %s", Title, WindDirection, WindSpeed, GustingSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 3)
      RadioObject:NewTransmission("WindFrom.ogg", 0.670, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      AI_ATC:ReadDigits(WindDirection, RadioObject, Title)
      RadioObject:NewTransmission("At.ogg", 0.418, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.05)
      AI_ATC:ReadDigits(WindSpeed, RadioObject, Title)

      if Gusting then
        RadioObject:NewTransmission("Gusting.ogg", 0.653, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.1)
      end
    end
    coroutine.yield()

    do
      local Visibility = AI_ATC.ATIS.Data.Visibility or "10"
      local Fog        = AI_ATC.ATIS.Data.Fog        or false
      local Dust       = AI_ATC.ATIS.Data.Dust       or false
      local Rain       = AI_ATC.ATIS.Data.Rain       or false
      local Preset     = AI_ATC.ATIS.Data.Preset     or ""
      local Subtitle

      -- Visibility
      if Visibility == "10" then
        Subtitle = string.format("%s: Visibility greater than 10", Title)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 3)
        RadioObject:NewTransmission("Visibility.ogg", 0.798, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        RadioObject:NewTransmission("Greater.ogg", 1.207, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      else
        Subtitle = string.format("%s: Visibility %s", Title, Visibility)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 3)
        RadioObject:NewTransmission("Visibility.ogg", 0.798, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:ReadDigits(Visibility, RadioObject, Title)
      end

      -- Fog
      if Fog then
        local Thickness = AI_ATC.ATIS.Data.FogThickness or "1000"
        Subtitle = string.format("%s: Persistant fog below %s", Title, Thickness)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 6)
        RadioObject:NewTransmission("PersistantFog.ogg", 1.628, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:ReadThousands(Thickness, RadioObject, Title)
      end

      -- Dust
      if Dust then
        Subtitle = string.format("%s: Persistant Dust", Title)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 6)
        RadioObject:NewTransmission("Dust.ogg", 1.161, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      end

      -- Rain
      if Rain and AI_ATC_CloudPresets and AI_ATC_CloudPresets[Preset] and AI_ATC_CloudPresets[Preset].Rain then
        local TypeRain = AI_ATC_CloudPresets[Preset].Rain
        if TypeRain == "Light rain" then
          Subtitle = string.format("%s: Light rain", Title)
          RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 2)
          RadioObject:NewTransmission("LightRain.ogg", 0.766, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        elseif TypeRain == "Moderate rain" then
          Subtitle = string.format("%s: Moderate rain", Title)
          RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 2)
          RadioObject:NewTransmission("ModerateRain.ogg", 0.923, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        elseif TypeRain == "Heavy rain" then
          Subtitle = string.format("%s: Heavy rain", Title)
          RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 2)
          RadioObject:NewTransmission("HeavyRain.ogg", 0.760, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        end
      end
    end
    coroutine.yield()

    do
      local Clouds = AI_ATC.ATIS.Data.Cloud or "Clear clouds"
      local Base   = AI_ATC.ATIS.Data.Base  or "1000"

      local function readClouds(titleTrans, oggFile)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, titleTrans, 2)
        RadioObject:NewTransmission(oggFile, 1.0, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        RadioObject:NewTransmission("At.ogg", 0.418, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.05)
        AI_ATC:ReadThousands(Base, RadioObject, Title)
      end

      if Clouds == "Clear clouds" then
        local s = string.format("%s: No Clouds", Title)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 2)
        RadioObject:NewTransmission("NoClouds.ogg", 0.914, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      elseif Clouds == "Few clouds" then
        readClouds(string.format("%s: Few clouds at %s", Title, Base), "FewClouds.ogg")
      elseif Clouds == "Scattered clouds" then
        readClouds(string.format("%s: Scattered clouds at %s", Title, Base), "ScatteredClouds.ogg")
      elseif Clouds == "Broken clouds" then
        readClouds(string.format("%s: Broken clouds at %s", Title, Base), "BrokenClouds.ogg")
      elseif Clouds == "Solid Cloud Layer" then
        readClouds(string.format("%s: Solid cloud layer at %s", Title, Base), "SolidCloud.ogg")
      end
    end
    coroutine.yield()

    do
      local Temperature = AI_ATC.ATIS.Data.Temperature or "20"
      local DewPoint    = AI_ATC.ATIS.Data.DewPoint    or "10"

      local s = string.format("%s: Temperature %s", Title, Temperature)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 5)
      RadioObject:NewTransmission("Temperature.ogg", 0.656, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      AI_ATC:ReadDigits(Temperature, RadioObject, Title)

      s = string.format("%s: Dew point %s", Title, DewPoint)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 5)
      RadioObject:NewTransmission("DewPoint.ogg", 0.737, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      AI_ATC:ReadDigits(DewPoint, RadioObject, Title)
    end
    coroutine.yield()

    do
      local QNH = AI_ATC.ATIS.Data.QNH or "29.92"
      local s   = string.format("%s: Altimeter %s", Title, QNH)

      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
      RadioObject:NewTransmission("Altimeter.ogg", 0.684, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      AI_ATC:ReadDigits(QNH, RadioObject, Title)
    end
    coroutine.yield()

    do
      local ActiveRunway    = AI_ATC.ATIS.Data.Active
      local DepartureRunway = AI_ATC.ATIS.Data.Departure or "03L"
      local ArrivalRunway   = AI_ATC.ATIS.Data.Arrival   or "21L"
      local Approach        = AI_ATC.ATIS.Data.Approach  or "IFR"

      if not ActiveRunway then
        local s = string.format("%s: Departure runway %s", Title, DepartureRunway)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
        RadioObject:NewTransmission("DepartureRunway.ogg", 1.138, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:Runway2(DepartureRunway, RadioObject, Title)

        s = string.format("%s: Arrival runway %s", Title, ArrivalRunway)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
        RadioObject:NewTransmission("ArrivalRunway.ogg", 1.138, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:Runway2(ArrivalRunway, RadioObject, Title)
      else
        local s = string.format("%s: Active Runway %s", Title, ActiveRunway)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
        RadioObject:NewTransmission("ActiveRunway.ogg", 0.940, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:Runway2(ActiveRunway, RadioObject, Title)
      end

      if Approach == "VFR" then
        local s = string.format("%s: VFR Approach for runway %s", Title, ArrivalRunway)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
        RadioObject:NewTransmission("VFR.ogg", 1.811, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:Runway2(ArrivalRunway, RadioObject, Title)
      else
        local s = string.format("%s: IFR Approach for runway %s", Title, ArrivalRunway)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
        RadioObject:NewTransmission("IFR.ogg", 1.718, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:Runway2(ArrivalRunway, RadioObject, Title)
      end
    end
    coroutine.yield()

    do
      local s = string.format("%s: NOTAM: Large force exercise in progress. Increased numbers of high performance aircraft in vicinity of airbase.", Title)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
      RadioObject:NewTransmission("NOTAMS.ogg", 6.989, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)

      local Information = AI_ATC.ATIS.Data.Information or "Alpha"
      s = string.format("%s: Advise on initial contact you have information %s", Title, Information)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
      RadioObject:NewTransmission("InitContact.ogg", 2.972, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      AI_ATC:Phonetic(Information, RadioObject, Title)

      AI_ATC.ATIS.Data.FC3switch = false
    end
    coroutine.yield()

    while true do
      local queueEmpty = (#ATIS_RADIO.queue == 0)
      if queueEmpty then
        if AI_ATC.ATIS.Data.Count > 30 then
          AI_ATC:InitATIS()
        end
        AI_ATC.ATIS.Data.Count = AI_ATC.ATIS.Data.Count + 1
        AI_ATC.ATIS.Active = false
        AI_ATC:StartATIS()
        break
      end

      coroutine.yield()
    end
  end

  ATC_Coroutine:AddCoroutine(ATISCoroutine, 1)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************ATC CLEARANCE DELIVERY*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ClearanceDelivery(Alias, Audio)

  local Transmitter = "Clearance"
  --local RadioObject = CLEARANCE_RADIO
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:ClearanceDelivery(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  local Squawk, FirstDigit
  
  SCHEDULER:New(nil, function()
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:ClearanceDelivery(Alias, true) end)
    Squawk = ClientData.Squawk
    FirstDigit = string.sub(Squawk, 1, 1)
  end,{}, 0.5 )

  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(14, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s, cleared departure as filed.", Title, CallsignSub, Title)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 4)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("AndersenClearance.ogg", 1.036, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.2)
    RadioObject:NewTransmission("AsFiled.ogg", 1.277, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.2)
    Subtitle = string.format("%s: Squawk %s sequential, departure frequency 239.2. Contact Andersen Ground Prior to taxi.", Title, Squawk)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 8)
    RadioObject:NewTransmission("Squak.ogg", 0.483, "Airbase_ATC/Clearance/SoundFiles/", nil, nil)
    AI_ATC:ReadDigits(FirstDigit, RadioObject, Transmitter)
    RadioObject:NewTransmission("Sequential_Andersen.ogg", 6.444, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.05)
  end,{}, Delay )
  
  if Audio~=true then
    if AI_Instructor then
      if AI_Instructor.Active == true and AI_Instructor.ContactClearance == false then
        SCHEDULER:New(nil, function()
          AI_Instructor.ContactClearance = true
        end,{}, 13)
      end
    end
  end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************START AI_ATC************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:EngineStart(Alias, Audio)

  local Transmitter = "Ground"
  local RadioObject = GROUND_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:EngineStart(Alias, true) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:EngineStart(Alias, true) end)
  
  if Audio ~= true then
    AI_ATC:ChannelOpen(8, Transmitter, Alias)
    ATM.ClientData[Alias].GroundMenu:RemoveSubMenus()
    AI_ATC:TaxiSubMenu(Alias)

    if AI_Instructor then
      if AI_Instructor.Active == true then 
        SCHEDULER:New(nil, function()
          AI_Instructor:PostStart()
        end,{}, 10)
      end
    end
  end
  
  local EngineStart, EngineStartClock
  if ClientData.EngineStart ~= nil then 
    EngineStart = AI_ATC.MissionStart + ClientData.EngineStart 
  else 
    EngineStart = 0 
  end
  EngineStartClock = UTILS.SecondsToClock(EngineStart, true)

  SCHEDULER:New(nil, function()
    local ActualTime = UTILS.SecondsOfToday()
    if ActualTime >= EngineStart then
      if AI_Wingman then AI_Wingman:EngineStart() end
      local Subtitle = string.format("%s: %s, %s. Engine start approved. Advise when ready to taxi.", Title, CallsignSub, Title)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Ground.ogg", 0.383, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      RadioObject:NewTransmission("EngineStart2.ogg", 2.647, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)      
    else
      local Subtitle = string.format("%s: %s. Negative. Your engine start time is %s local as fragged", Title, CallsignSub, EngineStartClock)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("Negative.ogg", 0.511, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3)
      RadioObject:NewTransmission("StartTime.ogg", 1.277, "Airbase_ATC/Ground/SoundFiles/", nil, 0.5)
      AI_ATC:ProcessTime(EngineStartClock, RadioObject, Transmitter)
      RadioObject:NewTransmission("local.ogg", 0.383, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      RadioObject:NewTransmission("AsFragged.ogg", 0.64, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    end
  end,{}, Delay )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC TAXI CLEARANCE******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloTaxi(Alias, Audio)
  local Transmitter = "Ground"
  local RadioObject = GROUND_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local RadioKey = AI_ATC.Radio[Transmitter].Key
  local Juliet = AI_ATC_SoundFiles[RadioKey].Phonetic["Juliet"]
  local Kilo = AI_ATC_SoundFiles[RadioKey].Phonetic["Kilo"]
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:HeloTaxi(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:HeloTaxi(Alias, true) end)
  if Audio~=true then
    ATM.ClientData[Alias].GroundMenu:RemoveSubMenus()
    --AI_ATC:CrossPadSubMenu(Alias)
    AI_ATC:HeloHoldShort(Alias)
  end
  
  SCHEDULER:New(nil, function()
    local Subtitle = string.format("%s: %s, %s. Taxi via Juliet, Kilo. Contact tower holding short of Jolly.", Title, CallsignSub, Title )
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
    RadioObject:NewTransmission("Ground.ogg", 0.383, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    RadioObject:NewTransmission("Taxivia.ogg", 0.778, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    RadioObject:NewTransmission(string.format("Phonetic/%s", Juliet.filename),Juliet.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
    RadioObject:NewTransmission(string.format("Phonetic/%s", Kilo.filename),Kilo.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
    RadioObject:NewTransmission("Jolly.ogg", 1.834, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
  end,{}, Delay )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC TAXI CLEARANCE******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiClearance(Alias)
  local Transmitter = "Ground"
  local ClientData = ATM.ClientData[Alias]
  if not ClientData or not ClientData.Unit then
    env.info(string.format("AI_ATC:TaxiClearance - Invalid Alias '%s'.", Alias))
    return
  end
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TaxiClearance(Alias) end, Transmitter)==false then
    return
  end

  local RadioObject = GROUND_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Delay = math.random(1.5, 2.5)
  local Callsign = ClientData.Callsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and ClientData.FlightCallsign or Callsign
  local Runway = AI_ATC.Runways.Takeoff[1]
  local SchedulerObjects = ATM.ClientData[Alias].SchedulerObjects
  local TaxiSubtitle, HoldShort, SchedulerObject
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  ATM.GroundControl[Alias].TaxiRequested = true
  
  SCHEDULER:New(nil, function()
    TaxiSubtitle = AI_ATC:TaxiSubtitle(Alias)
    HoldShort = AI_ATC:HoldShort(Alias)
    AI_ATC:TaxiRequest(Alias)
  end,{}, 0.5)
  
  local function TaxiPermission()
    local function Audio()
      AI_ATC:RepeatLastTransmission(Alias, function()Audio() end)
      AI_ATC:ChannelOpen(10, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s. Runway %s. Taxi via %s. ", Title, CallsignSub, Title, Runway, TaxiSubtitle )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 6)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Ground.ogg", 0.383, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission("Taxivia.ogg", 0.778, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
      AI_ATC:ReadTaxiInstructions(Alias, RadioObject, Transmitter)
      AI_ATC:TaxiQueue(Alias, RadioObject, Transmitter)
      
      local Subtitle = string.format("%s: Contact tower holding short runway %s", Title, HoldShort )
      RadioObject:NewTransmission("ContactTower.ogg", 1.66, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1, Subtitle, 3)
      AI_ATC:Runway(HoldShort, RadioObject, Transmitter)
    end
    Audio()
    AI_ATC:ResetMenus(Alias)
    SCHEDULER:New(nil, function()
      AI_ATC:HoldShortTracker(Alias)
    end,{}, 10)
    
    if AI_Wingman then 
      AI_Wingman:TaxiClearance() 
    end
    
    if AI_Instructor then
      if AI_Instructor.Active==true and AI_Instructor.TaxiApproved==false then
        SCHEDULER:New(nil, function()
          AI_Instructor.TaxiApproved = true
        end,{}, 15)
      end
    end
    
  end
  
  local function HoldPosition()
    local function Audio()
      AI_ATC:RepeatLastTransmission(Alias, function()Audio() end)
      AI_ATC:ChannelOpen(7, Transmitter, Alias)
      local Subtitle = string.format("%s: %s. Hold position.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 3)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("HoldPosition.ogg", 0.720, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    end
    Audio()
    
    SchedulerObject = SCHEDULER:New(nil, function()
      if ATM.GroundControl[Alias] then
        if ATM.GroundControl[Alias].TaxiAuthority == true then
          TaxiPermission()
          SchedulerObject:Stop()
        elseif ATM.GroundControl[Alias].TaxiAuthority == false then
          AI_ATC:TaxiRequest(Alias)
        end
      end
    end,{}, 1, 1 )
    table.insert(SchedulerObjects, SchedulerObject)
  end
  
  SCHEDULER:New(nil, function()
    if ATM.GroundControl[Alias] and ATM.GroundControl[Alias].TaxiAuthority == true then
      TaxiPermission()
    else
      HoldPosition()
    end
  end,{}, Delay)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC HELO HOLD SHORT**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloHoldShort(Alias)
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local HoldShort = HoldShortData["JOLLY"][1]
  local SchedulerObject
  local Callsign = ClientObject.Callsign
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:HeloHoldShort(Alias) end, Transmitter)==false then
    return
  end
  
  AI_ATC:CrossPadSubMenu(Alias)
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if Unit and Unit:IsAlive() and ATM.ClientData[Alias] and ATM.GroundControl[Alias] then
      if Unit:IsInZone(HoldShort) then
        AI_ATC:ChannelOpen(7, Transmitter, Alias)
        local Subtitle = string.format("%s: %s Hold short.", Title, CallsignSub)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 1)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        RadioObject:NewTransmission("HoldShort.ogg", 0.615, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        AI_ATC:CrossPadSubMenu(Alias)
        SchedulerObject:Stop()
      end
    else
      SchedulerObject:Stop()
    end
  end,{}, 1, 1 )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC HOLD SHORT**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoldShortTracker(Alias)
  local Transmitter = "Tower"
  local ClientData = ATM.ClientData[Alias]

  if not ClientData or not ClientData.Unit then
    env.info(string.format("AI_ATC:HoldShortTracker - Invalid Alias '%s'.", Alias))
    return
  end

  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local Runway = AI_ATC.Runways.Takeoff[1]
  local HoldShort = ATM.GroundControl[Alias].HoldShort
  local SchedulerObjects = ClientData.SchedulerObjects or {}
  local Callsign = ClientData.Callsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and ClientData.FlightCallsign or Callsign

  local HoldShortZones = HoldShortData[HoldShort]
  if not HoldShortZones or #HoldShortZones == 0 then
    env.info(string.format("AI_ATC:HoldShortTracker - No HoldShort zones for '%s'.", HoldShort))
    return
  end
  
  if AI_Wingman_1_Unit then
    Unit = AI_Wingman_1_Unit
  end

  for index, ZoneObject in ipairs(HoldShortZones) do
    if AI_Wingman_1_Unit then
      ZoneObject:SetRadius(50)
      local GuardZone = RunwayGuard[HoldShort] and RunwayGuard[HoldShort][index]
      if GuardZone then
        local GuardCoord = GuardZone:GetCoordinate()
        AI_ATC:SpawnHoldShort(GuardCoord, index)
      end
    end
    
    local ZoneCoord = ZoneObject:GetCoordinate()
    local scheduler = SCHEDULER:New(nil, function()
      if Unit and Unit:IsAlive() then
        local Coord = Unit:GetCoordinate()
        if Coord:Get2DDistance(ZoneCoord) <= 50 then
          local Subtitle = string.format("%s: %s Hold short.", Title, CallsignSub)
          RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 1)
          AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
          RadioObject:NewTransmission("HoldShort.ogg", 0.615, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
          
          if AI_Instructor then
            if AI_Instructor.Active and not AI_Instructor.HoldShort then
              AI_Instructor.HoldShort = true
            end
          end

          AI_ATC:ResetMenus(Alias)
          if Runway ~= HoldShort then
            AI_ATC:CrossRunwaySubMenu(Alias, HoldShort)
          else
            AI_ATC:TakeOffSubMenu(Alias)
          end

          AI_ATC:TerminateSchedules(Alias)
        end
      end
    end, {}, 1, 1)

    table.insert(SchedulerObjects, scheduler)
  end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC CROSS RUNWAY********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CrossRunway(Alias, Audio)
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Runway = AI_ATC.Runways.Takeoff[1]
  local HoldShort = ATM.GroundControl[Alias].HoldShort
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)

  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:CrossRunway(Alias) end, Transmitter)==false then
    return
  end
  
  if Audio~=true then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:CrossRunway(Alias, true) end)
    AI_ATC:TakeOffSubMenu(Alias)
  end
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    local Subtitle = string.format("%s: %s Cross runway %s, Hold short %s.", Title, CallsignSub, HoldShort, Runway)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("CrossRunway.ogg", 0.740, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    AI_ATC:Runway(HoldShort, RadioObject, Transmitter)
    RadioObject:NewTransmission("HoldShort.ogg", 0.615, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    AI_ATC:Runway(Runway, RadioObject, Transmitter)
  end,{}, Delay)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC TAKE PAD************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TakePad(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TakePad(Alias) end, Transmitter)==false then
    return
  end
  
  AI_ATC:ResetMenus(Alias)
  AI_ATC:HoverSubMenu(Alias)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:TakePad(Alias) end)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, Cleared Jolly pad. ", Title, CallsignSub, Title)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 4)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("JollyPad.ogg", 0.940, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
  end,{}, Delay )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC HOVER CHECK*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoverCheck(Alias)
  local Transmitter = "Tower"
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:HoverCheck(Alias) end, Transmitter)==false then
    return
  end
  
  AI_ATC:ResetMenus(Alias)
  AI_ATC:HeloTakeOffSubMenu(Alias)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:HoverCheck(Alias) end)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    local Subtitle = string.format("%s: %s. Cleared hover check. ", Title, CallsignSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 4)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("HoverCheck.ogg", 1.068, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
  end,{}, Delay )
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC HELO TAKEOFF********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloTakeoff(Alias)
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:HeloTakeoff(Alias) end, Transmitter)==false then
    return
  end
  
  local TurnTable = {
    ["Left"] = {filename = "TurnLeft.ogg", duration = 0.967},
    ["Right"] = {filename = "TurnRight.ogg", duration = 0.967},
  }
  
  local DepartureTable = {
    ["GASS_PEAK"] = {filename = "GassPeak.ogg", duration = 1.242, direction = "Left", heading = "349"},
    ["Dry Lake"] = {filename = "DryLake.ogg", duration = 1.324, direction = "Left", heading = "010"},
    ["Red Horse"] = {filename = "RedHorse.ogg", duration = 1.358, direction = "Left", heading = "349"},
    ["Sunrise"] = {filename = "Sunrise.ogg", duration = 1.335, direction = "Right", heading = "150"},
    ["SAR IFR"] = {filename = "SAR_IFR.ogg", duration = 1.277, direction = "Left", heading = "349"},
  }
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  local Coord, Height, WindDirection, WindSpeed, Departure, DepartureData, TurnDirection, TurnData, Heading
  
  SCHEDULER:New(nil, function()
    Departure = ClientData.VFR
    DepartureData = DepartureTable[Departure]
    TurnDirection = DepartureData.direction
    TurnData = TurnTable[TurnDirection]
    Heading = DepartureData.heading
    Coord = AI_ATC_Vec3
    Height = Coord:GetLandHeight()
    WindDirection, WindSpeed = Coord:GetWind(Height + 10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = tostring(math.floor(UTILS.MpsToKnots(WindSpeed) - 0.5))
    AI_ATC:ResetMenus(Alias)
    AI_ATC:DepartureSubMenu(Alias)
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:HeloTakeoff(Alias) end)
  end,{}, 0.5 )
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    local Subtitle1 = string.format("%s: %s, Turn %s heading %s for %s departure. ", Title, CallsignSub, TurnDirection, Heading, Departure)
    local Subtitle = Subtitle1..string.format("Wind %s at %s. Cleared for takeoff, switch to departure.", WindDirection, WindSpeed)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 8)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission(TurnData.filename, TurnData.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
    RadioObject:NewTransmission(DepartureData.filename, DepartureData.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.02)
    RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
    RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
    RadioObject:NewTransmission("ClearedTakeoff2.ogg", 1.950, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
  end,{}, Delay )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC TAKEOFF*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TakeoffClearance(Alias, Audio)
  local Transmitter = "Tower"
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TakeoffClearance(Alias) end, Transmitter)==false then
    return
  end
  
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Count = 0
  local Callsign = ClientData.Callsign
  local FlightCallsign =ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  local SchedulerObject, SchedulerObject2
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  local Runway, Coord, Height, WindDirection, WindSpeed
  
  SCHEDULER:New(nil, function()
    Runway = AI_ATC.Runways.Takeoff[1]
    Coord = AI_ATC_Vec3
    Height = Coord:GetLandHeight()
    WindDirection, WindSpeed = Coord:GetWind(Height + 10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = tostring(math.floor(UTILS.MpsToKnots(WindSpeed) - 0.5))
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:TakeoffClearance(Alias, true) end)
    
    if Audio~=true then
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      if Jester then Jester:Silence() end
      if ATM.ClientData[Alias].Mark then
        local RM = COORDINATE:RemoveMark(ATM.ClientData[Alias].Mark)
      end
    end
  end,{}, 0.5)
  
  local function Takeoff()
    SCHEDULER:New(nil, function()
      local Subtitle = string.format("%s: %s, Runway %s, Wind %s at %s. Cleared for takeoff, switch to departure.", Title, CallsignSub, Runway, WindDirection, WindSpeed)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
      AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
      RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
      AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
      RadioObject:NewTransmission("ClearedTakeoff2.ogg", 1.950, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    end,{}, Delay)
    
    if Audio~=true then
      AI_ATC.Runways.TakeoffHold = true
      if ATM.GroundControl[Alias] then
        ATM.GroundControl[Alias].TaxiAuthority = false
        ATM.GroundControl[Alias].StartedTaxi = false
        ATM.GroundControl[Alias].TaxiRequested = false
      end
        
      SchedulerObject = SCHEDULER:New(nil, function()
        Count = Count + 1
        if Group:IsAlive() and Group:IsAirborne() then
          ATM.ClientData[Alias].State = "Airborne"
          AI_ATC.Runways.TakeoffHold = false
          SchedulerObject:Stop()
        elseif not ATM.GroundControl[Alias] or not Group:IsAlive() then
          AI_ATC.Runways.TakeoffHold = false
          SchedulerObject:Stop()
        elseif Count==120 then
          AI_ATC.Runways.TakeoffHold = false
          SchedulerObject:Stop()
        end
      end,{}, 1, 1 )
  
      if AI_Wingman_1 ~= nil then
        local Delay = 12
        for index, name in ipairs(self.RunwayGuard) do
          local Unit = UNIT:FindByName(name)
          if Unit then Unit:Destroy() end
          if AI_Instructor then
            if AI_Instructor.Active == true and AI_Instructor.TakingActive == false then
              AI_Instructor.TakingActive = true
            end
          end
        end
      end

      AI_ATC:ResetMenus(Alias)
      AI_ATC:LandingSubMenu(Alias)
      AI_ATC:DepartureSubMenu(Alias)
    end
  end

  local function Lineup()
    SCHEDULER:New(nil, function()
      local Subtitle = string.format("%s: %s, Line up and wait.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("LineUp.ogg", 0.917, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    end,{}, Delay)
    
    if Audio~=true then
      SchedulerObject2 = SCHEDULER:New(nil, function()
        if not ATM.GroundControl[Alias] then
          SchedulerObject2:Stop()
        elseif AI_ATC.Runways.TakeoffHold == false then
          AI_ATC:ChannelOpen(12, Transmitter, Alias)
          Takeoff()
          SchedulerObject2:Stop()
        end
      end,{}, 1, 1 )
    end
  end

  if AI_ATC.Runways.TakeoffHold == false then
    AI_ATC:ChannelOpen(12, Transmitter, Alias)
    Takeoff()
  else
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    Lineup()
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC DEPARTURE_IDENT***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:DepartureIdent(Alias, Audio)
  local Transmitter = "Departure"
  local AirbaseName = AI_ATC.Airbase
  local Title = string.format("%s %s", AirbaseName, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:DepartureIdent(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:DepartureIdent(Alias, true) end)
  if Audio~=true then
    AI_ATC:ResetMenus(Alias)
    AI_ATC:IdentSubMenu(Alias)
  end
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s Departure, Ident. ", Title, CallsignSub, AirbaseName)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 7)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AirbaseName, RadioObject, Transmitter)
    RadioObject:NewTransmission("Departure.ogg", 0.743, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    RadioObject:NewTransmission("Ident.ogg", 0.586, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
  end,{}, Delay)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC DEPARTURE_CHECKIN***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:DepartureCheckin(Alias)
  AI_ATC:ResetMenus(Alias)
  if ATM.ClientData[Alias].RequestedProcedure=="IFR" then
    AI_ATC:IFRDeparture(Alias)
  else
    AI_ATC:VFRDeparture(Alias)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC DEPARTURE_CHECKIN***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:VFRDeparture(Alias, Audio)
  local Transmitter = "Departure"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Helo = ClientData.Helo
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:VFRDeparture(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:VFRDeparture(Alias, true) end)
  if Audio~=true then
    AI_ATC:NavigationSubMenu(Alias)
  end

  local AirbaseName, AirbaseCoord, AirbaseVec2, UAMTCN, VFRAltitude, AltSub
  local DepartureZone, DepartureRadar, ClassBVec2, ClassBZone, SchedulerObject, TurnPermit
  
  local function CheckFlightGroups()
    for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
      for ClientName, _ in pairs(groupTable) do
        DepartureRadar:RemoveGroupsByName(ClientName)
      end
    end
  end

  SCHEDULER:New(nil, function()
    AirbaseName = AI_ATC.Airbase
    AirbaseCoord = AI_ATC_Vec3
    AirbaseVec2 = AirbaseCoord:GetVec2()
    VFRAltitude = "4"
    AltSub = AI_ATC:ReadFlightLevel(VFRAltitude, RadioObject, Transmitter, false)
    UAMTCN = AI_ATC_Navpoints.UAMTCN:GetCoordinate()
  end,{}, 0.5 )
  
  SCHEDULER:New(nil, function()

    DepartureZone = ZONE_RADIUS:New("Departure", AirbaseVec2, 20372, nil)
    DepartureRadar = SET_GROUP:New():FilterZones({DepartureZone}):FilterActive():FilterCoalitions(AI_ATC.Coalition):FilterCategories("plane"):FilterOnce()
    DepartureRadar:RemoveGroupsByName(Alias)
    DepartureRadar:RemoveGroupsByName(AI_Wingman_1)
    DepartureRadar:RemoveGroupsByName(AI_Wingman_2)
    DepartureRadar:RemoveGroupsByName(AI_Wingman_3)
    DepartureRadar:RemoveGroupsByName(AI_Wingman_4)
    CheckFlightGroups()
    DepartureRadar:ForEachGroup(function(GroupObject)
      if not GroupObject:IsAirborne() then
        local GroupName = GroupObject:GetName()
        DepartureRadar:Remove(GroupName)
      end
    end)
   end,{}, 1 )
  
  local function TrafficReport()
    local PlayerCoord = Unit:GetCoord()
    local PlayerHeading = Unit:GetHeading()
    local Traffic = DepartureRadar:GetClosestGroup(PlayerCoord)
    local TrafficCoord = Traffic:GetCoord()
    local TrafficHeading = AI_ATC:CorrectHeading(Traffic:GetHeading())
    local TrafficCardinal = UTILS.BearingToCardinal(tonumber(TrafficHeading))
    local Range = tostring(math.floor(TrafficCoord:Get2DDistance(PlayerCoord) / 1852 - 0.5))
    local Heading = UTILS.HdgDiff(PlayerHeading, PlayerCoord:HeadingTo(TrafficCoord))
    local Bearing = tostring(AI_ATC:HeadingToClockBearing(Heading))
    local TrafficAltitude = string.sub(tostring(math.floor(Traffic:GetAltitude() / 3.281 + 0.5)), 1, 1)
    local TrafficAltitudeSub = AI_ATC:ReadFlightLevel(TrafficAltitude, RadioObject, Transmitter, false)
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    
    local Subtitle = string.format("%s: %s bound traffic at your %s O'clock, %s miles at %s", Title, TrafficCardinal, Bearing, Range, TrafficAltitudeSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3, Subtitle, 5)
    AI_ATC:ReadCardinal(TrafficCardinal, RadioObject, Transmitter)
    RadioObject:NewTransmission("Traffic.ogg", 0.511, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    AI_ATC:ClockBearing(Bearing, RadioObject, Transmitter)
    AI_ATC:ReadDigits(Range, RadioObject, Transmitter)
    RadioObject:NewTransmission("Miles.ogg", 0.641, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    AI_ATC:ReadFlightLevel(TrafficAltitude, RadioObject, Transmitter, true)
  end
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(12, Transmitter, Alias)
    local PlayerCoord = Unit:GetCoord()
    local PlayerHeading = Unit:GetHeading()
    local Traffic = DepartureRadar:GetClosestGroup(PlayerCoord)
    local Subtitle = string.format("%s: %s, %s Departure, Radar contact. ", Title, CallsignSub, AirbaseName)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 7)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AirbaseName, RadioObject, Transmitter)
    RadioObject:NewTransmission("Departure.ogg", 0.743, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
    
    if Traffic and Traffic:IsInZone(DepartureZone) and Traffic:IsAirborne() then
      TrafficReport()
    end
    
    local Subtitle = string.format("%s: Maintain VFR at or below %s. ", Title, AltSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 4)
    RadioObject:NewTransmission("MaintainVFR.ogg", 1.962, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
    AI_ATC:ReadFlightLevel(VFRAltitude, RadioObject, Transmitter, true)
  end,{}, Delay)

  local function ServiceTerminate() 
    SchedulerObject = SCHEDULER:New(nil, function()
      if Unit and Unit:IsAlive() and ATM.ClientData[Alias] then
        local UnitCoord = Unit:GetCoord()
        local Failsafe = UnitCoord:Get2DDistance(UAMTCN)
        if Failsafe >= 27780 then
          AI_ATC:RadarTerminate(Alias)
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end,{}, 10, 10, nil)
    table.insert(SchedulerObjects, SchedulerObject)
  end

  ServiceTerminate()


end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC TRAFFIC REPORT**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TrafficReport(Alias, RadioObject, Transmitter)
  local RadioKey = AI_ATC.Radio[Transmitter].Key
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Callsign = ClientData.Callsign
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TrafficReport(Alias, RadioObject, Transmitter) end, Transmitter)==false then
    return
  end
 
  local UnitCoord, UnitHeading, UnitZone, UnitVec2, Radar, Traffic
  local TrafficCoord, TrafficHeading, TrafficCardinal, Range, Heading, Bearing, TrafficAltitude, TrafficAltitudeSub
  
  local function AngularDifference(heading1, heading2)
    local diff = math.abs(heading1 - heading2)
    if diff > 180 then diff = 360 - diff end
    return diff
  end
  
  local function CheckFlightGroups()
    for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
      for ClientName, _ in pairs(groupTable) do
        Radar:RemoveGroupsByName(ClientName)
      end
    end
  end
  
  UnitCoord = Unit:GetCoordinate()
  UnitHeading = Unit:GetHeading()
  UnitZone = ZONE_UNIT:New("ClientZone", Unit, 18520, nil)
  Radar = SET_GROUP:New():FilterZones({UnitZone}):FilterActive():FilterCoalitions(AI_ATC.Coalition):FilterCategories({"plane", "helicopter"}):FilterOnce()
  Radar:RemoveGroupsByName(Alias)
  Radar:RemoveGroupsByName(AI_Wingman_1)
  Radar:RemoveGroupsByName(AI_Wingman_2)
  Radar:RemoveGroupsByName(AI_Wingman_3)
  Radar:RemoveGroupsByName(AI_Wingman_4)
  CheckFlightGroups()
  Radar:ForEachGroup(function(GroupObject)
    if not GroupObject:IsAirborne() then
      local GroupName = GroupObject:GetName()
      Radar:Remove(GroupName)
    else
      local TrafficCoord = GroupObject:GetCoordinate()
      local Bearing = UnitCoord:HeadingTo(TrafficCoord)
      if AngularDifference(UnitHeading, Bearing) >= 50 then 
        local GroupName = GroupObject:GetName()
        Radar:Remove(GroupName)
      end
    end
  end)
  
  local function ReportTraffic(Traffic)
    TrafficCoord = Traffic:GetCoordinate()
    TrafficHeading = AI_ATC:CorrectHeading(Traffic:GetHeading())
    TrafficCardinal = UTILS.BearingToCardinal(tonumber(TrafficHeading))
    Range = tostring(math.floor(TrafficCoord:Get2DDistance(UnitCoord) / 1852 - 0.5))
    Heading = UTILS.HdgDiff(UnitHeading, UnitCoord:HeadingTo(TrafficCoord))
    Bearing = tostring(AI_ATC:HeadingToClockBearing(Heading))
    TrafficAltitude = string.sub(tostring(math.floor(Traffic:GetAltitude() / 3.281 + 0.5)), 1, 1)
    TrafficAltitudeSub = AI_ATC:ReadFlightLevel(TrafficAltitude, RadioObject, Transmitter, false)
    
    local Subtitle = string.format("%s: %s bound traffic, %s O'clock, %s miles at %s", Title, TrafficCardinal, Bearing, Range, TrafficAltitudeSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 5)
    AI_ATC:ReadCardinal(TrafficCardinal, RadioObject, Transmitter)
    RadioObject:NewTransmission("Traffic.ogg", 0.511, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    AI_ATC:ClockBearing(Bearing, RadioObject, Transmitter)
    AI_ATC:ReadDigits(Range, RadioObject, Transmitter)
    RadioObject:NewTransmission("Miles.ogg", 0.641, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    AI_ATC:ReadFlightLevel(TrafficAltitude, RadioObject, Transmitter, true)
  end
  
  Traffic = Radar:GetClosestGroup(UnitCoord)
  if Traffic then ReportTraffic(Traffic) end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**********************************************************************************ATC SERVICE TERMINATED***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RadarTerminate(Alias, Audio)
  local Transmitter = "Departure"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:RadarTerminate(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:RadarTerminate(Alias, true) end)
  
  if Audio~=true then
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ApproachSubMenu(Alias)
    --AI_ATC:RangeControlSubMenu(Alias)
  end

  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(8, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, Radar service terminated, resume own navigation.", Title, CallsignSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("ResumeNav.ogg", 2.769, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    if Jester then Jester:Speak() end
  end,{}, Delay )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC DREAM 7 DEPARTURE***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IFRDeparture(Alias, Audio)
  local Transmitter = "Departure"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:IFRDeparture(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:IFRDeparture(Alias, true) end)
  
  if Audio~=true then
    AI_ATC:ResetMenus(Alias)
    AI_ATC:NavigationSubMenu(Alias)
  end

  local AirbaseName, UAMTCN, Runway, SchedulerObject, Destination, Filename, Duration, Instruction, InstructionSub
  
  
  SCHEDULER:New(nil, function()
    AirbaseName = AI_ATC.Airbase
    UAMTCN = AI_ATC_Navpoints.UAMTCN:GetCoordinate()
    Runway = AI_ATC.Runways.Takeoff[1]
  end,{}, 0.5 )
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(14, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s Departure, Radar contact.", Title, CallsignSub, AirbaseName)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AirbaseName, RadioObject, Transmitter)
    RadioObject:NewTransmission("Departure.ogg", 0.743, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
    AI_ATC:TrafficReport(Alias, RadioObject, Transmitter)
    
    if Runway=="06L" or Runway=="06R" then
      local Subtitle = string.format("%s: Fly runway heading, climb and maintian 9000.", Title)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 4)
      RadioObject:NewTransmission("IFR06.ogg", 2.879, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    else
      local Subtitle = string.format("%s: Turn right heading 300, climb and maintain 9000.", Title)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 4)
      RadioObject:NewTransmission("IFR24.ogg", 3.715, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    end
  end,{}, Delay )

  
  local function ServiceTerminate()
    SchedulerObject = SCHEDULER:New(nil, function()
      if Unit and Unit:IsAlive() and ATM.ClientData[Alias] then
        local UnitCoord = Unit:GetCoord()
        local Failsafe = UnitCoord:Get2DDistance(UAMTCN)
        if Failsafe >= 27780 then
          AI_ATC:RadarTerminate(Alias)
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end,{}, 10, 10, nil, 7200 )
    table.insert(SchedulerObjects, SchedulerObject)
  end

  ServiceTerminate()

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC APPROACH_CHECKIN_EXE************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachCheckIn(Alias, Type)
  local ClientData = ATM.ClientData[Alias]
  if Type == "VFR" then
    ClientData.Approach.Type="VFR"
    AI_ATC:VFRApproach(Alias)
  elseif Type=="IFR" then
    ClientData.Approach.Type="IFR"
    AI_ATC:IFRApproach(Alias)
  elseif ClientData.Approach.Type=="Generic" then
    --AI_ATC:GenericApproach(Alias)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC APPROACH CHECKIN**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:VFRApproach(Alias)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Airbase = AI_ATC.Airbase
  local Runway = AI_ATC.Runways.Landing[1]
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:VFRApproach(Alias) end, Transmitter)==false then
    return
  end
  AI_ATC:ResetMenus(Alias)
  AI_ATC:ApproachAssistMenu(Alias, false)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(9, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach. Radar contact. Expect visual approach for runway %s", Title, CallsignSub, Airbase, Runway )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
      RadioObject:NewTransmission("VisualApproach.ogg", 1.800, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
    end,{}, Delay)
  end
  
  Message()
  
  SCHEDULER:New(nil, function()
    local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    AI_ATC:ChannelOpen(9, Transmitter, Alias)
  end,{}, 120 )
  
  SCHEDULER:New(nil, function()
    AI_ATC:Push_Tower(Alias)
  end,{}, 12)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC IFR APPROACH**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IFRApproach(Alias)

  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Airbase = AI_ATC.Airbase
  local Runway = AI_ATC.Runways.Landing[1]
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:IFRApproach(Alias) end, Transmitter)==false then
    return
  end

  local Destination, Report, Approach, TurnHeading, TurnSub, PlayerCoord, PlayerAltitude, PatternAlt, Altitude, AltSub, AltSubtitle, AudioFile, Sqwuak, Recovery
  
  local AudioTable = {
    ["Climb"] = {
      [1] = { filename = "ClimbMaintain.ogg", duration = 0.987 },
      [2] = { filename = "ClimbMaintainFL.ogg", duration = 1.593 },
    },
    ["Maintain"] = {
      [1] = { filename = "Maintain.ogg", duration = 0.638 },
      [2] = { filename = "MaintainFL.ogg", duration = 1.106 },
    },
    ["Descend"] = {
      [1] = { filename = "Descend.ogg", duration = 1.202 },
      [2] = { filename = "DescendFL.ogg", duration = 1.701 },
    },
  }

  SCHEDULER:New(nil, function()
    if Runway~=nil then
      Destination = AI_ATC_Navpoints[Runway]:GetCoordinate()
      if Runway=="06L" then
        Recovery = "FOVEM"
        Approach = "HI-TACAN X"
        Altitude = "17"
        PatternAlt = 17000
      elseif Runway=="06R" then
        Recovery = "FOVEM"
        Approach = "TACAN"
        Altitude = "5"
        PatternAlt = 5000
      elseif Runway=="24L" then
        Recovery = "WELKU"
        Approach = "TACAN"
        Altitude = "5"
        PatternAlt = 5000
      elseif Runway=="24R" then
        Recovery = "FOVEM"
        Approach = "TACAN"
        Altitude = "5"
        PatternAlt = 5000
      end
      Destination = AI_ATC_Navpoints[Recovery]:GetCoordinate()
    else
      Destination = AI_ATC_Navpoints[Runway]:GetCoordinate()
    end
    ATM.ClientData[Alias].Recovery = Recovery
    ATM.ClientData[Alias].Chart = Approach
    ATM.ClientData[Alias].Approach.PatternAltitude = Altitude
    PlayerCoord = Unit:GetCoord()
    TurnHeading = AI_ATC:CorrectHeading(PlayerCoord:HeadingTo(Destination)+0.5)
    TurnSub = AI_ATC:Heading(TurnHeading, RadioObject, Transmitter, false )
    PlayerAltitude = math.abs(Unit:GetAltitude()* 3.28084)
    Altitude = ATM.ClientData[Alias].Approach.PatternAltitude
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
  end,{}, 0.5 )

  SCHEDULER:New(nil, function()
    local condition, audioKey
    if PlayerAltitude < (PatternAlt - 500) then
      condition = "Climb and maintain"
      audioKey = "Climb"
    elseif math.abs(PlayerAltitude - PatternAlt) <= 500 then
      condition = "maintain"
      audioKey = "Maintain"
    elseif PlayerAltitude > (PatternAlt + 500) then
      condition = "Descend and maintain"
      audioKey = "Descend"
    end
    local audioIndex = tonumber(Altitude) < 18 and 1 or 2
    AltSubtitle = string.format("%s %s", condition, AltSub)
    AudioFile = AudioTable[audioKey][audioIndex]
    Sqwuak = "Maintain current sqwuak"
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ApproachAssistMenu(Alias, true)
  end, {}, 1.0)
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(11, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach, fly heading %s. %s. %s. Report %s.", Title, CallsignSub, Airbase, TurnHeading, AltSubtitle, Sqwuak, Recovery )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(TurnHeading, RadioObject, Transmitter)
      RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
      RadioObject:NewTransmission("MaintainSquawk.ogg", 1.157, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("Report.ogg", 0.386, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
      AI_ATC:ReadNavpoint(Recovery, RadioObject, Transmitter)
    end,{}, Delay )
  end

  Message()

  SCHEDULER:New(nil, function()
    AI_ATC:ApproachReportFix(Alias)
  end,{}, 12 )
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************GENERIC APPROACH************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenericApproach(Alias, audio)
  local Transmitter = "Approach"
  local Airbase = AI_ATC.Airbase
  local Title = string.format("%s %s", Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  local Destination, Runway, UnitCoord, Approach
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:GenericApproach(Alias) end, Transmitter)==false then
    return
  end

  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:ResetMenus(Alias)
    Runway = AI_ATC.Runways.Landing[1]
    Destination = AI_ATC_Navpoints[Runway]:GetCoordinate()
    if AI_ATC.Procedure=="VFR" then
      Approach = "Visual"
    elseif AI_ATC.Procedure=="IFR" then
      Approach = "Instrument"
    end
  end,{}, 0.5)

  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(9, Transmitter, Alias)
      UnitCoord = Unit:GetCoord()
      local TurnHeading = AI_ATC:CorrectHeading(UnitCoord:HeadingTo(Destination)+0.5)
      local Subtitle = string.format("%s: %s, %s approach, fly heading %s, Expect %s approach for runway %s", Title, CallsignSub, Airbase, TurnHeading, Approach, Runway )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(TurnHeading, RadioObject, Transmitter)
      if Approach=="Visual" then
        RadioObject:NewTransmission("VisualApproach.ogg", 1.800, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      elseif Approach=="Instrument" then
        RadioObject:NewTransmission("InstrumentApproach.ogg", 1.776, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      end
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
    end,{}, Delay)
  end
  
  Message()

  SCHEDULER:New(nil, function()
    AI_ATC:Push_Tower(Alias)
  end,{}, 12 )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************************************APPROACH REPORT NAV FIX******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachReportFix(Alias, Report)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local SchedulerObjects = ClientData.SchedulerObjects
  local Recovery = ClientData.Recovery
  local Airbase = AI_ATC.Airbase
  local UAMTCN = AI_ATC_Navpoints.UAMTCN:GetCoordinate()
  local Fix = AI_ATC_Navpoints[Recovery]:GetCoordinate()
  local ReportRange = UAMTCN:Get2DDistance(Fix) - 5556
  local Delay = math.random(1.5, 2.5)
  
  local SchedulerObject
  
  local function Execute()
    local function Audio()
      SCHEDULER:New(nil, function()
        AI_ATC:RepeatLastTransmission(Alias, function()Audio() end)
        local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
        AI_ATC:ChannelOpen(7, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, %s Approach. Say request.", Title, CallsignSub, Airbase)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        RadioObject:NewTransmission("SayRequest.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      end, {}, Delay)
    end
    Audio()
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ApproachTypeMenu(Alias)
  end
  
  
  if not Report then
    SchedulerObject = SCHEDULER:New(nil, function()
      if Unit and Unit:IsAlive() then
        local Coord = Unit:GetCoord()
        local Range = Coord:Get2DDistance(UAMTCN)
        if Range <= ReportRange then
          if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
            Execute()
          end
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject)
  elseif Report then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    Execute()
  end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************APPROACH MANAGER********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachManager(Alias, Type, Missed)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local SchedulerObjects = ClientData.SchedulerObjects
  local Airbase = AI_ATC.Airbase
  local Runway = AI_ATC.Runways.Landing[1]
  local AirbaseCoord = AI_ATC_Vec3
  local UAMTCN = AI_ATC_Navpoints.UAMTCN:GetCoordinate()
  local Delay = math.random(1.5, 2.5)

  local AudioTable = {
    ["Climb"] = {
      [1] = { filename = "ClimbMaintain.ogg", duration = 0.987 },
      [2] = { filename = "ClimbMaintainFL.ogg", duration = 1.593 },
    },
    ["Maintain"] = {
      [1] = { filename = "Maintain.ogg", duration = 0.638 },
      [2] = { filename = "MaintainFL.ogg", duration = 1.106 },
    },
    ["Descend"] = {
      [1] = { filename = "Descend.ogg", duration = 1.202 },
      [2] = { filename = "DescendFL.ogg", duration = 1.701 },
    },
  }
  
  local approachTable = {
    ["ILS"] = { filename = "VectorsILS.ogg", duration = 1.834 },
    ["TACAN"] = { filename = "VectorsTAC.ogg", duration = 1.756 },
    ["HI-TACAN X"] = { filename = "ClearedTACANY.ogg", duration = 2.101 },
    ["HI-ILS Y"] = { filename = "ClearedHI-ILS.ogg", duration = 2.241 },
  }

  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  local Recovery, Destination, Navpoint, Final, FinalCoord, PatternAlt, Altitude, AltSub, PlayerAltitude, AltSubtitle, 
  AudioFile, AudioFile2, SchedulerObject, Instruction, ClassBVec2, ClassBZone, RadioObject, Zone_2, RunwayHeading, Direction, Offset
  
  local function CalculateTurnDirection(UnitCoord)
    local function normalizeAngle(angle)
      if angle > 180 then
        angle = angle - 360
      elseif angle < -180 then
        angle = angle + 360
      end
      return angle
    end
  
    local LOCALISER     = RunwayHeading
    local unitHeading   = AI_ATC:CorrectHeading(Unit:GetHeading())
    local headingDiff   = normalizeAngle(LOCALISER - unitHeading)
    local turnDirection = (headingDiff < 0) and "Left" or "Right"
  
    local vectorHeading = AI_ATC:CorrectHeading(UnitCoord:HeadingTo(UAMTCN))
    local vectorCalc    = normalizeAngle(LOCALISER - vectorHeading)

    local offset
    if vectorCalc > 0 then
      offset = LOCALISER - 30
    else
      offset = LOCALISER + 30 
    end
  
    return turnDirection, tostring(offset)
  end

  SCHEDULER:New(nil, function()
    Recovery     = ATM.ClientData[Alias].Recovery
    local data = ApproachSettings[Runway][Type]
    if data then
      Final        = data.Final
      Altitude     = data.Altitude
      PatternAlt   = data.PatternAlt
      RunwayHeading= data.localiser
      Instruction  = string.format(data.Instruction, Runway)
      AudioFile2   = approachTable[Type]
    
      local override = data.Offset
      if override then
        Direction, Offset = CalculateTurnDirection(Unit:GetCoordinate())
        Destination = AI_ATC_Navpoints[override[Direction]]
        
        if override[Direction] then
          Final = override[Direction]
          Destination = AI_ATC_Navpoints[Final]
        end
      end
    end
  
  end,{}, 0.5)
  

  SCHEDULER:New(nil, function()
    AI_ATC.Approach.PatternAltitude = Altitude
    ATM.ClientData[Alias].Chart = Type
    ClassBVec2 = AI_ATC_Vec3:GetVec2()
    ClassBZone = ZONE_RADIUS:New("ClassBZone", ClassBVec2, 27780, nil)
    Zone_2 = AI_ATC_Navpoints.ILS_2
    Zone_2:SetRadius(185200)
    --FinalCoord = AI_ATC_Navpoints[Final]:GetCoordinate()
    FinalCoord = Destination:GetCoordinate()
    
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    PlayerAltitude = math.abs(Unit:GetAltitude()* 3.28084)
    local condition, audioKey
    if PlayerAltitude < (PatternAlt - 500) then
      condition = "Climb and maintain"
      audioKey = "Climb"
    elseif math.abs(PlayerAltitude - PatternAlt) <= 500 then
      condition = "maintain"
      audioKey = "Maintain"
    elseif PlayerAltitude > (PatternAlt + 500) then
      condition = "Descend and maintain"
      audioKey = "Descend"
    end
    local audioIndex = tonumber(Altitude) < 18 and 1 or 2
    AltSubtitle = string.format("%s %s", condition, AltSub)
    AudioFile = AudioTable[audioKey][audioIndex]
  end, {}, 1.0)
  
  local function Execute()
    local function Message()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local PlayerCoord = Unit:GetCoord()
      local PlayerHeading = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
      local CorrectedCoord = PlayerCoord:Translate(3704, PlayerHeading, nil, nil)
      local FinalHeading = AI_ATC:CorrectHeading(PlayerCoord:HeadingTo(FinalCoord)+0.5)
      local TurnSub = AI_ATC:Heading(FinalHeading, RadioObject, Transmitter, false )
      local Subtitle = string.format("%s: %s, %s Approach, fly heading %s. %s. %s", Title, CallsignSub, Airbase, TurnSub, AltSubtitle, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(FinalHeading, RadioObject, Transmitter)
      RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
      if not Type then
        RadioObject:NewTransmission("FinalVector.ogg", 1.689, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      else
        RadioObject:NewTransmission(AudioFile2.filename, AudioFile2.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
      end
    end
    
    local function AlternateMessage()
      AI_ATC:RepeatLastTransmission(Alias, function()AlternateMessage() end)
      local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
      AI_ATC:ChannelOpen(8, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach. %s.", Title, CallsignSub, Airbase, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission(AudioFile2.filename, AudioFile2.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
    end
    
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ApproachAssistMenu(Alias, false)
    --AI_ATC:CancelIFRSubMenu(Alias)
    

    if Type == "HI-TACAN X" or Type == "HI-ILS Y" then
      AlternateMessage()
      SCHEDULER:New(nil, function()
        AI_ATC:Push_Tower(Alias)
      end, {}, 12)
    else
      Message()
      SCHEDULER:New(nil, function()
        AI_ATC:ApproachLocalizer(Alias, Type)
      end, {}, 12)
    end
  end

  if Missed then
    SCHEDULER:New(nil, function()
      if Unit and Unit:IsNotInZone(ClassBZone) then
        Execute()
      elseif Unit and Unit:IsInZone(ClassBZone) then
        AI_ATC:TerminateSchedules(Alias)
        AI_ATC:ResetMenus(Alias)
        AI_ATC:NavAssist(Alias, Type, Transmitter)
        AI_ATC:CancelIFRSubMenu(Alias)
        SchedulerObject = SCHEDULER:New(nil, function()
          if Unit and Unit:IsAlive() then
            if Unit:IsInZone(Zone_2) then
              if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
                Execute()
                SchedulerObject:Stop()
              end
            end
          else
            SchedulerObject:Stop()
          end
        end, {}, 1, 1)
        table.insert(SchedulerObjects, SchedulerObject)
      end
    end, {}, Delay)
  else
    SCHEDULER:New(nil, function()
      Execute()
    end, {}, Delay)
  end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************APPROACH LOCALIZER********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachLocalizer(Alias, Type)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local SchedulerObjects = ClientData.SchedulerObjects
  local Airbase = AI_ATC.Airbase
  local UAMTCN = AI_ATC_Navpoints.UAMTCN:GetCoordinate()
  local Runway = AI_ATC.Runways.Landing[1]
  local Delay = math.random(1.5, 2.5)
  
  local TurnTable = {
    ["Left"] = { filename = "TurnLeft.ogg", duration = 0.914 },
    ["Right"] = { filename = "TurnRight.ogg", duration = 0.967 },
  }
  
  local ApproachTable = {
    ["ILS"] = { filename = "ClearedILS.ogg", duration = 1.834 },
    ["TACAN"] = { filename = "ClearedTACAN.ogg", duration = 1.649 },
  }
  
    local LocaliserType = {
    ["ILS"] = { filename = "Established.ogg", duration = 1.614 },
    ["TACAN"] = { filename = "Established2.ogg", duration = 2.949 },
  }

  local UnitCoord, Turn, Heading, Altitude, AltitudeSub, AudioFile, ApproachFile, NavPoint, NavPoint2, FinalHeading, TurnSub, ApproachSub, SchedulerObject, SchedulerObject2
  local RunwayHeading, localizerSub, ApproachTypeFile
  
  local function CalculateTurnDirection(UnitCoord)
    local function normalizeAngle(angle)
      if angle > 180 then
        angle = angle - 360
      elseif angle < -180 then
        angle = angle + 360
      end
      return angle
    end
  
    local LOCALISER     = RunwayHeading
    local unitHeading   = AI_ATC:CorrectHeading(Unit:GetHeading())
    local headingDiff   = normalizeAngle(LOCALISER - unitHeading)
    local turnDirection = (headingDiff < 0) and "Left" or "Right"
  
    local vectorHeading = AI_ATC:CorrectHeading(UnitCoord:HeadingTo(UAMTCN))
    local vectorCalc    = normalizeAngle(LOCALISER - vectorHeading)

    local offset
    if vectorCalc > 0 then
      offset = LOCALISER - 30
    else
      offset = LOCALISER + 30 
    end
  
    return turnDirection, tostring(offset)
  end

  local function Execute(Alternate)
    SCHEDULER:New(nil, function()
      UnitCoord = Unit:GetCoordinate()
      Turn, Heading = CalculateTurnDirection(UnitCoord)
      AudioFile = TurnTable[Turn]
      ApproachFile = ApproachTable[Type]
      ApproachTypeFile = LocaliserType[Type]
      if Type=="ILS" then
        Altitude = "2.2"
        AltitudeSub = "2200"
        ApproachSub = string.format("localizer. Cleared ILS approach for runway %s.", Runway)
      elseif Type=="TACAN" then
        Altitude = "2.2"
        AltitudeSub = "2200"
        ApproachSub = "TACAN final, Cleared for the approach."
      end
      TurnSub = string.format("Turn %s heading %s", Turn, Heading)
    end,{}, 0.5)
    
    local function Audio()
      SCHEDULER:New(nil, function()
        AI_ATC:RepeatLastTransmission(Alias, function()Audio() end)
        RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
        AI_ATC:ChannelOpen(13, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, %s Approach, %s", Title, CallsignSub, Airbase, TurnSub)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
        AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)

        Subtitle = string.format("%s: Maintain at or above %s until established on the %s", Title, AltitudeSub, ApproachSub)
        RadioObject:NewTransmission("AtOrAbove.ogg", 1.289, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1, Subtitle, 6)
        AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
        RadioObject:NewTransmission(ApproachTypeFile.filename, ApproachTypeFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        if Type=="ILS" then
          RadioObject:NewTransmission(ApproachFile.filename, ApproachFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
          AI_ATC:Runway(Runway, RadioObject, Transmitter)
        end
      end,{}, Delay)
    end
    
    local function AlternateAudio()
      SCHEDULER:New(nil, function()
        AI_ATC:RepeatLastTransmission(Alias, function()AlternateAudio() end)
        RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
        AI_ATC:ChannelOpen(13, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, %s Approach", Title, CallsignSub, Airbase)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)

        Subtitle = string.format("%s: Maintain at or above %s until established on the localiser. %s", Title, AltitudeSub, ApproachSub)
        RadioObject:NewTransmission("AtOrAbove.ogg", 1.289, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1, Subtitle, 6)
        AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
        RadioObject:NewTransmission(ApproachTypeFile.filename, ApproachTypeFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        if Type=="ILS" then
          RadioObject:NewTransmission(ApproachFile.filename, ApproachFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
          AI_ATC:Runway(Runway, RadioObject, Transmitter)
        end
      end,{}, Delay)
    end
    if Alternate~=true then
      Audio()
    else
      AlternateAudio()
    end
    
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ApproachAssistMenu(Alias, false)
    --AI_ATC:CancelIFRSubMenu(Alias)
    
    SCHEDULER:New(nil, function()
      AI_ATC:Push_Tower(Alias)
    end, {}, 12) 
  end
  
  if Runway=="06L" or Runway=="06R" then
    RunwayHeading = 066
  else
    RunwayHeading = 246
  end

  SchedulerObject = SCHEDULER:New(nil, function()
    if Unit and Unit:IsAlive() then
      local Coord = Unit:GetCoord()
      local Range = Coord:Get2DDistance(UAMTCN)
      local Vector = AI_ATC:CorrectHeading(Coord:HeadingTo(UAMTCN))
      local Angle = AI_ATC:AngularDifference(Vector, RunwayHeading)
      if (Angle >= 5 and Angle <= 18) and Range <= 35188 then
        if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
          Execute()
        end
        SchedulerObject:Stop()
      elseif Angle < 5 and Range <= 35188 then
        if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
          Execute(true)
        end
        SchedulerObject:Stop()
      end
    else
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC MISSED APPROACH***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:MissedApproach(Alias, Audio)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local AirbaseName = AI_ATC.Airbase
  local Callsign = ClientObject.Callsign
  local Type = ClientObject.Chart
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  local ApproachData, Destination, DestCoord, Altitude, AltSub, Runway, SoundData, RadSub
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:MissedApproach(Alias) end, Transmitter)==false then
    return
  end
  
  local RadialTable = {
    ["06L"] = {
      ["ILS"] = { filename = "051Radial.ogg", duration = 1.985, subtitle = "Intercept the 051 radial." },
      ["TACAN"] = { filename = "051Radial.ogg", duration = 1.985, subtitle = "Intercept the 051 radial." },
    },
    ["06R"] = {
      ["ILS"] = { filename = "051Radial.ogg", duration = 1.985, subtitle = "Intercept the 051 radial." },
      ["TACAN"] = { filename = "051Radial.ogg", duration = 1.985, subtitle = "Intercept the 051 radial." },
    },
    ["24L"] = {
      ["ILS"] = { filename = "064Radial.ogg", duration = 1.858, subtitle = "Intercept the 064 radial." },
      ["TACAN"] = { filename = "076Radial.ogg", duration = 2.055, subtitle = "Intercept the 076 radial." },
    },
    ["24R"] = {
      ["ILS"] = { filename = "063Radial.ogg", duration = 1.869, subtitle = "Intercept the 063 radial." },
      ["TACAN"] = { filename = "051Radial.ogg", duration = 1.985, subtitle = "Intercept the 051 radial." },
    },
  }
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:MissedApproach(Alias, true) end)
    Runway = AI_ATC.Runways.Landing[1]
    ApproachData = ApproachSettings[Runway][Type]
    Destination = ApproachData.Final
    DestCoord = AI_ATC_Navpoints[Destination]:GetCoordinate()
    Altitude = ApproachData.Altitude
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    SoundData = RadialTable[Runway][Type]
    RadSub = SoundData.subtitle
    
    if Audio~=true then
      AI_ATC:TerminateSchedules(Alias)
      AI_ATC:ResetMenus(Alias)
      AI_ATC:MissedApproachMenu(Alias)
    end
  end,{}, 0.5 )
  
  SCHEDULER:New(nil, function()
    local UnitCoord = Unit:GetCoord()
    local UnitHeading = Unit:GetHeading()
    local Heading = AI_ATC:CorrectHeading(UnitCoord:HeadingTo(DestCoord))
    local HeadingSub = AI_ATC:Heading(Heading, RadioObject, Transmitter, false)
    AI_ATC:ChannelOpen(14, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s Approach, Radar contact.", Title, CallsignSub, AirbaseName)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AirbaseName, RadioObject, Transmitter)
    RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
    RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
    AI_ATC:TrafficReport(Alias, RadioObject, Transmitter)
    
    local Subtitle = string.format("%s: fly heading %s. %s Climb and maintain %s. Say request?", Transmitter, HeadingSub, RadSub, AltSub, Destination)
    RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.03, Subtitle, 5)
    AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
    RadioObject:NewTransmission(SoundData.filename, SoundData.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    RadioObject:NewTransmission("ClimbMaintain.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.03)
    AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
    RadioObject:NewTransmission("SayRequest.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
  end,{}, Delay )
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************ATC APPROACH BACK TO RADAR*****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachBackToRadar(Alias, Type)
  local Transmitter = "Approach"
  local Airbase = AI_ATC.Airbase
  local Title = string.format("%s %s", Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientObject.Callsign
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:GenerateEmptyMenu(Alias, Transmitter)
  AI_ATC:CancelIFRSubMenu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:ApproachBackToRadar(Alias) end, Transmitter)==false then
    return
  end

  local Heading, Altitude, AltSub, Instruction, PlayerAltitude, PatternAlt, Runway, AltSubtitle, AudioFile, ApproachFile
  
  local AudioTable = {
    ["Climb"] = {
      [1] = { filename = "ClimbMaintain.ogg", duration = 0.987 },
      [2] = { filename = "ClimbMaintainFL.ogg", duration = 1.593 },
    },
    ["Maintain"] = {
      [1] = { filename = "Maintain.ogg", duration = 0.638 },
      [2] = { filename = "MaintainFL.ogg", duration = 1.106 },
    },
    ["Descend"] = {
      [1] = { filename = "Descend.ogg", duration = 1.202 },
      [2] = { filename = "DescendFL.ogg", duration = 1.701 },
    },
  }
  
  local approachTable = {
    ["ILS"] = { filename = "VectorsILS.ogg", duration = 1.834 },
    ["TACAN"] = { filename = "VectorsTAC.ogg", duration = 1.756 },
    ["HI-TACAN Y"] = { filename = "ClearedTACANY.ogg", duration = 2.101 },
    ["HI-TACAN Z"] = { filename = "ClearedTACANZ.ogg", duration = 2.055 },
    ["HI-ILS"] = { filename = "ClearedHI-ILS.ogg", duration = 2.241 },
  }
  
  local RunwayData = {
    ["06L"] = {Heading = "336", Altitude = "6", PatternAlt = 6000},
    ["06R"] = {Heading = "156", Altitude = "6", PatternAlt = 6000},
    ["24L"] = {Heading = "156", Altitude = "6", PatternAlt = 6000},
    ["24R"] = {Heading = "336", Altitude = "6", PatternAlt = 6000}
  }
  
  SCHEDULER:New(nil, function()
    Runway = AI_ATC.Runways.Landing[1]
    RunwayData = RunwayData[Runway]
    Heading = RunwayData.Heading
    Altitude = RunwayData.Altitude
    PatternAlt = RunwayData.PatternAlt
    
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    PlayerAltitude = math.abs(Unit:GetAltitude()* 3.28084)
    local condition, audioKey
    if PlayerAltitude < (PatternAlt - 500) then
      condition = "Climb and maintain"
      audioKey = "Climb"
    elseif math.abs(PlayerAltitude - PatternAlt) <= 500 then
      condition = "maintain"
      audioKey = "Maintain"
    elseif PlayerAltitude > (PatternAlt + 500) then
      condition = "Descend and maintain"
      audioKey = "Descend"
    end
    local audioIndex = tonumber(Altitude) < 18 and 1 or 2
    AltSubtitle = string.format("%s %s", condition, AltSub)
    AudioFile = AudioTable[audioKey][audioIndex]
    ApproachFile = approachTable[Type]
    if Type == "ILS" then
      Instruction = string.format("Vector for ILS Runway %s.", Runway)
    elseif Type == "TACAN" then
      Instruction = string.format("Vectors to the TACAN runway %s.", Runway)
    end
  end, {}, 0.5)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(11, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach, fly heading %s. %s. %s", Title, CallsignSub, Airbase, Heading, AltSubtitle, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 8)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
      RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
      RadioObject:NewTransmission(ApproachFile.filename, ApproachFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
    end, {}, Delay)
  end
  
  Message()
  SCHEDULER:New(nil, function()
    AI_ATC:RadarManager(Alias, Type)
  end, {}, 10)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC BACK TO RADAR MANAGER***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RadarManager(Alias, Type, Auto)
  local Transmitter = "Approach"
  local Airbase = AI_ATC.Airbase
  local Title = string.format("%s %s", Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local UAMTCN = AI_ATC_Navpoints.UAMTCN:GetCoordinate()
  local Runway = AI_ATC.Runways.Landing[1]
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientObject.SchedulerObjects
  local Callsign = ClientObject.Callsign
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if not Auto then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  end
  
  local Heading, Altitude, AltSub, AltitudeSub, Instruction, PlayerAltitude, PatternAlt, ApproachFile, TurnAudioFile, FinalAltitude
  local AltSubtitle, ApproachSub, AudioFile, Turn, Vector, TurnSub, Zone_1, Zone_2, Zone_3, SchedulerObject, SchedulerObject2, SchedulerObject3
  local RunwayHeading,Vector1, Vector2, Vector3
  
  local AudioTable = {
    ["Climb"] = {
      [1] = { filename = "ClimbMaintain.ogg", duration = 0.987 },
      [2] = { filename = "ClimbMaintainFL.ogg", duration = 1.593 },
    },
    ["Maintain"] = {
      [1] = { filename = "Maintain.ogg", duration = 0.638 },
      [2] = { filename = "MaintainFL.ogg", duration = 1.106 },
    },
    ["Descend"] = {
      [1] = { filename = "Descend.ogg", duration = 1.202 },
      [2] = { filename = "DescendFL.ogg", duration = 1.701 },
    },
  }
  
  local ApproachTable = {
    ["ILS"] = { filename = "ClearedILS.ogg", duration = 1.834 },
    ["TACAN"] = { filename = "ClearedTACAN.ogg", duration = 1.649 },
  }
  
  local TurnTable = {
    ["Left"] = { filename = "TurnLeft.ogg", duration = 0.914 },
    ["Right"] = { filename = "TurnRight.ogg", duration = 0.967 },
  }
  
  local function CalculateTurnDirection()
    
    local UnitHeading = AI_ATC:CorrectHeading(Unit:GetHeading())
    local TurnDirection
    local Localiser = RunwayHeading
    local Offset

    local HeadingDiff = Heading - UnitHeading
    if HeadingDiff > 180 then
     HeadingDiff = HeadingDiff - 360
    elseif HeadingDiff < -180 then
      HeadingDiff = HeadingDiff + 360
    end
    if HeadingDiff > 0 then
      TurnDirection = "Right"
    elseif HeadingDiff < 0 then
      TurnDirection = "Left"
    else
      TurnDirection = "Right"
    end
    
    if TurnDirection=="Left" then
      Offset = tostring(210 + 30)
    else
      Offset = tostring(210 - 30)
    end

    return TurnDirection, Offset
  end

  SCHEDULER:New(nil, function()
    if Runway=="06L" then
      RunwayHeading = 66
      Zone_1 = AI_ATC_Navpoints.ILS_1
      Zone_2 = AI_ATC_Navpoints.ILS_5
      Zone_3 = AI_ATC_Navpoints.ILS_7
      Vector1 = "246"
      Vector2 = "156"
      Vector3 = "096"
    elseif Runway=="06R" then
      RunwayHeading = 66
      Zone_1 = AI_ATC_Navpoints.ILS_4
      Zone_2 = AI_ATC_Navpoints.ILS_5
      Zone_3 = AI_ATC_Navpoints.ILS_6
      Vector1 = "246"
      Vector2 = "336"
      Vector3 = "036"
    elseif Runway=="24L" then
      RunwayHeading = 246
      Zone_1 = AI_ATC_Navpoints.ILS_4
      Zone_2 = AI_ATC_Navpoints.ILS_2
      Zone_3 = AI_ATC_Navpoints.ILS_8
      Vector1 = "66"
      Vector2 = "336"
      Vector3 = "276"
    elseif Runway=="24R" then
      RunwayHeading = 246
      Zone_1 = AI_ATC_Navpoints.ILS_1
      Zone_2 = AI_ATC_Navpoints.ILS_2
      Zone_3 = AI_ATC_Navpoints.ILS_3
      Vector1 = "66"
      Vector2 = "156"
      Vector3 = "216"
    end
    Zone_1:SetRadius(185200)
    Zone_2:SetRadius(185200)
    Zone_3:SetRadius(185200)
    
    AudioFile = TurnTable[Turn]
    ApproachFile = ApproachTable[Type]
    if Type=="ILS" then
      FinalAltitude = "4.2"
      AltitudeSub = "4200"
      ApproachSub = string.format("Cleared ILS approach for runway %s.", Runway)
    elseif Type=="TACAN" then
      FinalAltitude = "4.4"
      AltitudeSub = "4400"
      ApproachSub = string.format("Cleared TACAN approach for runway %s.", Runway)
    end
  end, {}, 0.5)
  
  local function CalculateAltitude(heading, altitude)
    Runway = AI_ATC.Runways.Landing[1]
    Heading = heading
    Altitude = altitude
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    PatternAlt = tonumber(Altitude.."000")
    PlayerAltitude = math.abs(Unit:GetAltitude()* 3.28084)
    local condition, audioKey
    if PlayerAltitude < (PatternAlt - 500) then
      condition = "Climb and maintain"
      audioKey = "Climb"
    elseif math.abs(PlayerAltitude - PatternAlt) <= 500 then
      condition = "maintain"
      audioKey = "Maintain"
    elseif PlayerAltitude > (PatternAlt + 500) then
      condition = "Descend and maintain"
      audioKey = "Descend"
    end
    local audioIndex = tonumber(Altitude) < 18 and 1 or 2
    AltSubtitle = string.format("%s %s", condition, AltSub)
    AudioFile = AudioTable[audioKey][audioIndex]
  end
  
  local function TurnInstruction(heading)
    if AI_ATC:FunctionDelay(Alias, function()TurnInstruction(heading) end, Transmitter)==false then return  end
    local UnitCoord = Unit:GetCoordinate()
    Turn, Vector = CalculateTurnDirection(heading)
    TurnAudioFile = TurnTable[Turn]
    TurnSub = string.format("Turn %s heading %s", Turn, Heading)
    AI_ATC:RepeatLastTransmission(Alias, function()TurnInstruction(heading) end)
    RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(9, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach, %s. %s.", Title, CallsignSub, Airbase, TurnSub, AltSubtitle)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission(TurnAudioFile.filename, TurnAudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
      RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
    end, {}, 0.5)
  end
  
  local function TurnThree()
    if AI_ATC:FunctionDelay(Alias, function() TurnThree() end, Transmitter)==false then return end
    CalculateAltitude(Vector3, FinalAltitude)
    local UnitCoord = Unit:GetCoordinate()
    Turn, Vector = CalculateTurnDirection(UnitCoord)
    TurnAudioFile = TurnTable[Turn]
    TurnSub = string.format("Turn %s heading %s", Turn, Heading)
    AI_ATC:RepeatLastTransmission(Alias, function()TurnThree() end)
    RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach, %s", Title, CallsignSub, Airbase, TurnSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission(TurnAudioFile.filename, TurnAudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
      
      Subtitle = string.format("%s: Maintain at or above %s until established on the localiser. %s", Title, AltitudeSub, ApproachSub)
      RadioObject:NewTransmission("AtOrAbove.ogg", 1.289, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1, Subtitle, 6)
      AI_ATC:ReadFlightLevel(FinalAltitude, RadioObject, Transmitter, true)
      RadioObject:NewTransmission("Established.ogg", 1.614, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission(ApproachFile.filename, ApproachFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
    end, {}, 0.5)
    
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:Push_Tower(Alias)
    
  end
  
  local function TurnTwo()
    CalculateAltitude(Vector2, "4")
    TurnInstruction()
    AI_ATC:TerminateSchedules(Alias)
    SchedulerObject3 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Airborne = Unit:InAir()
        if Airborne and Unit:IsInZone(Zone_3) then
          TurnThree()
          SchedulerObject3:Stop()
        elseif not Airborne then
          AI_ATC:LandingManager(Alias)
          SchedulerObject3:Stop()
        end
      elseif not ATM.ClientData[Alias] then
        SchedulerObject3:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject3)
  end
  
  local function TurnOne()
    CalculateAltitude(Vector1, "6")
    TurnInstruction()
    AI_ATC:TerminateSchedules(Alias)
    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Airborne = Unit:InAir()
        if Airborne and Unit:IsInZone(Zone_2) then
          TurnTwo()
          SchedulerObject2:Stop()
        elseif not Airborne then
          AI_ATC:LandingManager(Alias)
          SchedulerObject2:Stop()
        end
      elseif not ATM.ClientData[Alias] then
        SchedulerObject2:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject2)
  end
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Airborne = Unit:InAir()
      if Airborne and Unit:IsInZone(Zone_1) then
        TurnOne()
        SchedulerObject:Stop()
      elseif not Airborne then
        AI_ATC:LandingManager(Alias)
        SchedulerObject:Stop()
      end
      
    elseif not ATM.ClientData[Alias] then
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************************************APPROACH DUDBE VECTOR********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RadarManager2(Alias, Type)
  local Transmitter = "Approach"
  local Airbase = AI_ATC.Airbase
  local Runway = AI_ATC.Runways.Landing[1]
  local Title = string.format("%s %s", Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientObject.SchedulerObjects
  local Callsign = ClientObject.Callsign
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:RadarManager2(Alias, Type) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  local UnitCoord, UAMTCN, Heading, Altitude, AltSub, PatternAlt, PlayerAltitude, AltSubtitle, AudioFile, ApproachFile, Instruction, SchedulerObject
  
  local AudioTable = {
    ["Climb"] = {
      [1] = { filename = "ClimbMaintain.ogg", duration = 0.987 },
      [2] = { filename = "ClimbMaintainFL.ogg", duration = 1.593 },
    },
    ["Maintain"] = {
      [1] = { filename = "Maintain.ogg", duration = 0.638 },
      [2] = { filename = "MaintainFL.ogg", duration = 1.106 },
    },
    ["Descend"] = {
      [1] = { filename = "Descend.ogg", duration = 1.202 },
      [2] = { filename = "DescendFL.ogg", duration = 1.701 },
    },
  }
  
  local approachTable = {
    ["ILS"] = { filename = "VectorsILS.ogg", duration = 1.834 },
    ["TACAN"] = { filename = "VectorsTAC.ogg", duration = 1.756 },
    ["HI-TACAN Y"] = { filename = "ClearedTACANY.ogg", duration = 2.101 },
    ["HI-TACAN Z"] = { filename = "ClearedTACANZ.ogg", duration = 2.055 },
    ["HI-ILS"] = { filename = "ClearedHI-ILS.ogg", duration = 2.241 },
  }

  SCHEDULER:New(nil, function()
    UnitCoord = Unit:GetCoordinate()
    UAMTCN = AI_ATC_Navpoints.UAMTCN:GetCoordinate()
    Heading = AI_ATC:CorrectHeading(UnitCoord:HeadingTo(UAMTCN))
    Altitude = "10"
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    if Type == "ILS" then
      Instruction = string.format("Vector for ILS Runway %s.", Runway)
    elseif Type == "TACAN" then
      Instruction = string.format("Vectors to the TACAN runway %s.", Runway)
    end
    ApproachFile = approachTable[Type]
  end, {}, 0.5)

  local function Execute()
    local function Audio()
      AI_ATC:RepeatLastTransmission(Alias, function()Audio() end)
      SCHEDULER:New(nil, function()
        AI_ATC:ChannelOpen(12, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, %s Approach, fly heading %s", Title, CallsignSub, Airbase, Heading)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
        
        Subtitle = string.format("%s: Maintain at or above %s. %s", Title, Altitude, Instruction)
        RadioObject:NewTransmission("AtOrAbove.ogg", 1.289, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1, Subtitle, 6)
        AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
        RadioObject:NewTransmission(ApproachFile.filename, ApproachFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
      end, {}, Delay)
    end
    Audio()
  end
  
  Execute()
  
  SchedulerObject = SCHEDULER:New(nil, function()
    local UnitCoord = Unit:GetCoordinate()
    local Range = UnitCoord:Get2DDistance(UAMTCN)
    local FunctionDelay = AI_ATC:FunctionDelay(Alias, nil, Transmitter)
    if Range <= 24076 and FunctionDelay==true then
      AI_ATC:RadarManager(Alias, Type, true)
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC PUSH TOWER**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Push_Tower(Alias)
  
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  local SchedulerObject, AirbaseCoord, Destination, AirbaseVec2, TowerZone, ApproachBearing, Runway
  
  local function CalculateBearing(Object)
    local bearing = tonumber(AI_ATC:CorrectHeading(AirbaseCoord:HeadingTo(Object:GetCoordinate())))
    return math.floor(bearing + 0.5)
  end
  
  SCHEDULER:New(nil, function()
    Runway = AI_ATC.Runways.Landing[1]
    AirbaseCoord = AI_ATC_Vec3
    Destination = AI_ATC_Navpoints[Runway]:GetCoordinate()
    AirbaseVec2 = AirbaseCoord:GetVec2()
    TowerZone = ZONE_RADIUS:New("TowerZone", AirbaseVec2, 22224, nil)
    ApproachBearing = CalculateBearing(Destination)
    if Jester then 
      Jester:Silence()
      SCHEDULER:New(nil, function()
        Jester:Speak()
      end,{}, 10)
    end
  end, {}, 0.5)

  local function Execute()
    local Procedure = AI_ATC.Procedure
    local Approach = ATM.ClientData[Alias].Approach.Type
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:LandingSubMenu(Alias)
    if Approach=="IFR" and Procedure=="VFR" then
      AI_ATC:GenerateEmptyMenu(Alias, "Approach")
      AI_ATC:CancelIFRSubMenu(Alias)
    end
    
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Execute() end)
      local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      if Approach=="VFR" or Approach=="Generic" then
        local Subtitle = string.format("%s: %s contact tower on UHF Channel 4.", Title, CallsignSub)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        RadioObject:NewTransmission("ContactTower.ogg", 2.113, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      elseif Approach=="IFR" then
        local Subtitle = string.format("%s: %s Radar service terminated. Contact tower on UHF Channel 4.", Title, Callsign)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        RadioObject:NewTransmission("IFRContactTower.ogg", 3.437, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      end
    end, {}, Delay)
  end

  SchedulerObject = SCHEDULER:New(nil, function()
    local Bearing = CalculateBearing(Unit)
    local Heading = AI_ATC:CorrectHeading(Unit:GetHeading())
    local CorrectedHeading = AI_ATC:AngularDifference(Heading, 210)
    local FunctionDelay = AI_ATC:FunctionDelay(Alias, nil, Transmitter)
    if Unit:IsInZone(TowerZone) 
    and math.abs(Bearing - ApproachBearing) <= 10 
    --and CorrectedHeading <= 10 
    and FunctionDelay==true then
      Execute()
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC CANCEL IFR***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CancelIFR(Alias)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  local Procedure = AI_ATC.Procedure
  if Procedure=="VFR" then
    ATM.ClientData[Alias].Approach.Type = "VFR"
  end
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:LandingSubMenu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:CancelIFR(Alias) end, Transmitter)==false then
    return
  end
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(6, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s, cancellation recieved, contact tower on UHF Channel 4.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 6)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("Cancellation.ogg", 3.285, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    end, {}, Delay)
  end
  
  Message()
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC REQUEST DEPARTURE****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RequestDeparture(Alias)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  ATM.ClientData[Alias].Approach.Type = "IFR"
  ATM.ClientData[Alias].Recovery = "FOVEM"
  ATM.ClientData[Alias].Chart = "ILS"
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:DepartureSubMenu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:RequestDeparture(Alias) end, Transmitter)==false then
    return
  end
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(6, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s, Contact Nellis Departure on UHF Channel 5.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 6)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("ContactDeparture.ogg", 2.577, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    end, {}, Delay)
  end
  
  Message()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC TOWER CHECKIN********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Tower_Checkin(Alias, audio)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:Tower_Checkin(Alias) end, Transmitter)==false then
    return
  end
  
  local Airbase, AirbaseCoord, AirbaseName, BreakZone, ApproachType, Subtitle, LandingSubtitle, SchedulerObject, SchedulerObject2, SchedulerObject3, SchedulerObject4
  local Height, WindDirection, WindSpeed, Runway, VisualApproach, Randomizer, RunwayHeading, RecipricolHeading, Break, Altitude, Report, LandingNo

  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    Airbase = AI_ATC_Airbase
    AirbaseCoord = AI_ATC_Vec3
    AirbaseName = AI_ATC.Airbase
    BreakZone = ZONE_RADIUS:New("Break", AirbaseCoord:GetVec2(), 1828, nil)

    Height = AirbaseCoord:GetLandHeight()
    Altitude = Height*3.281 + 500
    WindDirection, WindSpeed = AirbaseCoord:GetWind(Height +10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = (tostring(math.floor(UTILS.MpsToKnots(WindSpeed)- 0.5)))
    Runway = AI_ATC.Runways.Landing[1]
    Randomizer = math.random(1, 2)
    RunwayHeading = AI_ATC:ExtractRunwayHeading(Runway)
    RecipricolHeading = (RunwayHeading + 180) % 360 
    
    if Runway=="06L" or Runway=="21L" then
      Break = "Left"
    else
      Break = "Right"
    end
  end, {}, 0.5)
  
  SCHEDULER:New(nil, function()
    ApproachType = ATM.ClientData[Alias].Landing.Procedure
    ATM.ClientData[Alias].Landing.Type = "Option"
    if ApproachType == "Instrument Straight in" then
      if not ATM.TowerControl[Alias] then
        ATM.TowerControl[Alias] = {RequestedApproach = ApproachType, State = "5 miles", Type = Type }
      end
      local count = 0
      for _ in pairs(ATM.TowerControl) do
        count = count + 1
      end
      LandingNo = tostring(count)
      Report = "report 5 miles"
      Subtitle = string.format("%s: %s %s, %s, your number %s to runway %s .", Title, CallsignSub, Title, Report, LandingNo, Runway)
    elseif ApproachType == "Straight in" then
      Report = "report 5 mile straight in"
      Subtitle = string.format("%s: %s %s, %s, runway %s .", Title, CallsignSub, Title, Report, Runway)
    elseif ApproachType == "Overhead" then
      Report = "report 5 mile initial"
      Subtitle = string.format("%s: %s %s, %s, runway %s .", Title, CallsignSub, Title, Report, Runway)
    elseif ApproachType == "Closed traffic" then
      Subtitle = string.format("%s: %s, %s, runway %s.", Title, CallsignSub, Title, Runway)
      Subtitle = Subtitle .. string.format(" %s closed traffic approved.", Break)
    end
  end, {}, 1)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 6)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      if ApproachType == "Straight in" then
        RadioObject:NewTransmission("5MileStraight.ogg", 1.960, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
        RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
      elseif ApproachType == "Instrument Straight in" then
        RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        RadioObject:NewTransmission("Report5Miles.ogg", 1.242, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        RadioObject:NewTransmission("YourNumber.ogg", 0.522, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        AI_ATC:ReadDigits(LandingNo, RadioObject, Transmitter)
        RadioObject:NewTransmission("ForRunway.ogg", 0.662, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
      elseif ApproachType == "Overhead" then
        RadioObject:NewTransmission("5Mile.ogg", 2.188, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
      elseif ApproachType == "Closed traffic" then
        RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
        if Break == "Left" then
          RadioObject:NewTransmission("LeftTraffic.ogg", 1.544, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
        elseif Break == "Right" then
          RadioObject:NewTransmission("RightTraffic.ogg", 1.533, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
        end
      end
    end, {}, Delay)
  end
  
  Message()
  
  local function BaseTurnFailsafe()
    SchedulerObject4 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Coord = Unit:GetCoordinate()
        local Heading = Unit:GetHeading()
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        if Angle <= 10 and Range <= 7408 then
          AI_ATC:ReportInital(Alias)
          SchedulerObject4:Stop()
        end
      else
        SchedulerObject4:Stop()
      end
    end, {}, 3, 3)
    table.insert(SchedulerObjects, SchedulerObject4)
  end
  
  local function HandleRecipricol()
    SchedulerObject3 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Heading = Unit:GetHeading()
        local Angle = AI_ATC:AngularDifference(Heading, RecipricolHeading)
        if Angle <= 20 then
          if ApproachType == "Overhead" then
            BaseTurnFailsafe()
            SchedulerObject3:Stop()
          elseif ApproachType == "Closed traffic" then
            BaseTurnFailsafe()
            AI_ATC:ReportBaseSubMenu(Alias)
            SchedulerObject3:Stop()
          else
            SchedulerObject3:Stop()
          end
        end
      else
        SchedulerObject3:Stop()
      end
    end, {}, 3, 3)
    table.insert(SchedulerObjects, SchedulerObject3)
  end
  
  local function InitialBumper()
    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Coord = Unit:GetCoordinate()
        local Heading = Unit:GetHeading()
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        if Angle <= 10 and Range <= 7408 then
          if ApproachType == "Straight in" or ApproachType == "Instrument Straight in" then
            MESSAGE:New("Pilot did not report inital", 20):ToUnit(Unit)
            AI_ATC:ReportInital(Alias)
          elseif ApproachType == "Overhead" then
            MESSAGE:New("Pilot did not report inital", 20):ToUnit(Unit)
            AI_ATC:Report5MileInital(Alias)
            HandleRecipricol()
          elseif ApproachType == "Closed traffic" then
            MESSAGE:New("Pilot did not report inital", 20):ToUnit(Unit)
            AI_ATC:ReportInital(Alias)
            HandleRecipricol()
          end
          SchedulerObject2:Stop()
        end
      else
        SchedulerObject2:Stop()
      end
    end, {}, 3, 3)
    table.insert(SchedulerObjects, SchedulerObject2)
  end

  local function OverheadApproach()
    SchedulerObject = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Heading = Unit:GetHeading()
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        if Unit:IsInZone(BreakZone) and Angle <= 10 then
          HandleRecipricol()
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end, {}, 3, 3)
    table.insert(SchedulerObjects, SchedulerObject)
  end
  

  SCHEDULER:New(nil, function()
    if ApproachType == "Overhead" then
      AI_ATC:OverheadInitialSubMenu(Alias)
      InitialBumper()
    elseif ApproachType == "Straight in" or ApproachType == "Instrument Straight in" then
      AI_ATC:InitialSubMenu(Alias)
      InitialBumper()
    elseif ApproachType == "Closed traffic" then
      OverheadApproach()
    end
  end, {}, Delay)

  SCHEDULER:New(nil, function()
    if AI_Wingman_2_Unit and AI_Wingman_2_Unit:IsAlive() and AI_Wingman.ActiveGroups[AI_Wingman_2].RTB~=true then 
      AI_Wingman:FlightRTB(AI_Wingman_2) 
      AI_Wingman.ActiveGroups[AI_Wingman_2].RTB = true
    end
    if AI_Wingman_3_Unit and AI_Wingman_3_Unit:IsAlive() and AI_Wingman.ActiveGroups[AI_Wingman_3].RTB~=true then
      AI_Wingman:FlightRTB(AI_Wingman_3)
      AI_Wingman.ActiveGroups[AI_Wingman_3].RTB = true
    end
    if AI_Wingman_4_Unit and AI_Wingman_4_Unit:IsAlive() and AI_Wingman.ActiveGroups[AI_Wingman_4].RTB~=true then
      AI_Wingman:FlightRTB(AI_Wingman_4)
      AI_Wingman.ActiveGroups[AI_Wingman_4].RTB = true
    end
  end, {}, Delay + 10)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC REPORT INITIAL*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Report5MileInital(Alias, audio)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  local AirbaseCoord, Runway, RunwayHeading, RecipricolHeading, UnitCoord, InitRange, InitialRange, Break, LandingNo, LandingType, SchedulerObject, SchedulerObject2
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:Report5MileInital(Alias) end, Transmitter)==false then
    return
  end

  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:ReportBaseSubMenu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    ATM.TowerControl[Alias] = {RequestedApproach = "Overhead", State = "Initial", Type = Type}
    AirbaseCoord = AI_ATC_Vec3
    UnitCoord = Unit:GetCoordinate()
    InitRange = UnitCoord:Get2DDistance(AirbaseCoord)
    Runway = AI_ATC.Runways.Landing[1]
    RunwayHeading = AI_ATC:ExtractRunwayHeading(Runway)
    RecipricolHeading = (RunwayHeading + 180) % 360 
    LandingType = ATM.ClientData[Alias].Landing.Type
    LandingNo = tostring(#ATM.TowerControl)
    if Runway=="06L" or Runway=="24L" then
      Break = "Left"
    else
      Break = "Right"
    end
    
    local count = 0
    for _ in pairs(ATM.TowerControl) do
      count = count + 1
    end
    LandingNo = tostring(count)
    
  end, {}, 0.5 )
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s. Your number %s for runway %s, %s break departure end. Report base.", Title, CallsignSub, Title, LandingNo, Runway, Break)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      
      RadioObject:NewTransmission("YourNumber.ogg", 0.522, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadDigits(LandingNo, RadioObject, Transmitter)
      RadioObject:NewTransmission("ForRunway.ogg", 0.662, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      if Break == "Left" then
        RadioObject:NewTransmission("LeftBreak.ogg", 1.265, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      elseif Break == "Right" then
        RadioObject:NewTransmission("RightBreak.ogg", 1.254, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      end
      RadioObject:NewTransmission("ReportBase.ogg", 0.848, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    end, {}, Delay )
  end
  
  Message()
  
  local function BaseTurnFailsafe()
    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Coord = Unit:GetCoordinate()
        local Heading = Unit:GetHeading()
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        if Angle <= 10 and Range <= 7408 then
          AI_ATC:ReportInital(Alias)
          SchedulerObject2:Stop()
        elseif Range >= 12964 then
          MESSAGE:New("Exceeded 7Nm from Andersen", 20):ToUnit(Unit)
          AI_ATC:SayIntentions(Alias)
          SchedulerObject:Stop()
        end
        SchedulerObject2:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject2)
  end
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Airborne = Unit:InAir()
      local Coord = Unit:GetCoordinate()
      local Heading = Unit:GetHeading()
      local Range = Coord:Get2DDistance(AirbaseCoord)
      local Angle = AI_ATC:AngularDifference(Heading, RecipricolHeading)
      if Range <= 1852 and Angle <= 10 then
        BaseTurnFailsafe()
        SchedulerObject:Stop()
      elseif Range >= 12964 then
        MESSAGE:New("Exceeded 7Nm from Andersen", 20):ToUnit(Unit)
        AI_ATC:SayIntentions(Alias)
        SchedulerObject:Stop()
      elseif not Airborne then
        AI_ATC:LandingManager(Alias)
        SchedulerObject:Stop()
      end
    else
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC REPORT INITIAL*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReportInital(Alias, audio)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:ReportInital(Alias) end, Transmitter)==false then
    return
  end

  local Airbase, AirbaseCoord, AirbaseName, BreakZone, LandingType, Subtitle, LandingSubtitle, ApproachType, Position
  local Height, WindDirection, WindSpeed, Runway, VisualApproach, Randomizer, RunwayHeading, RecipricolHeading, Break
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:GoAroundSubMenu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    ApproachType = ClientData.Landing.Procedure
    if ApproachType == "Straight in" or ApproachType == "Instrument Straight in" then
      Position = "5 miles"
    elseif ApproachType == "Overhead" then
      Position = "Base"
    end
    if not ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = {RequestedApproach = ApproachType, State = Position, Type = Type }
    else
      if ATM.TowerControl[Alias].RequestedApproach == "Closed traffic" then
        ATM.TowerControl[Alias].State = "Base"
      else
        ATM.TowerControl[Alias].State = Position
      end
    end
    Airbase = AI_ATC_Airbase
    AirbaseCoord = Airbase:GetCoordinate()
    LandingType = ATM.ClientData[Alias].Landing.Type
    if LandingType=="Full Stop" then
      LandingSubtitle = "Cleared to land"
    elseif LandingType=="Touch and Go" then
      LandingSubtitle = "Cleared Touch and Go"
    elseif LandingType=="Low Approach" then
      LandingSubtitle = "Cleared low Approach"
    elseif LandingType=="Option" then
      LandingSubtitle = "Cleared for the option"
    end
    Height = AirbaseCoord:GetLandHeight()
    WindDirection, WindSpeed = AirbaseCoord:GetWind(Height +10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = (tostring(math.floor(UTILS.MpsToKnots(WindSpeed)- 0.5)))
    Runway = AI_ATC.Runways.Landing[1]
  end, {}, 0.5 )
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, check gear down, Runway %s. Wind %s at %s. ", Title, CallsignSub, Runway, WindDirection, WindSpeed)
      Subtitle = Subtitle .. LandingSubtitle
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("CheckGear.ogg", 0.692, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
      RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
      if LandingType == "Full Stop" then
        RadioObject:NewTransmission("ClearedToLand.ogg", 0.784, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      elseif LandingType == "Touch and Go" then
        RadioObject:NewTransmission("ClearedTouchGo.ogg", 0.964, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      elseif LandingType == "Low Approach" then
        RadioObject:NewTransmission("ClearedLowApproach.ogg", 1.109, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      elseif LandingType == "Option" then
        RadioObject:NewTransmission("Option.ogg", 1.115, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      end
    end, {}, Delay )
  end
  
  Message()

  SCHEDULER:New(nil, function()
    AI_ATC:LandingManager(Alias)
  end, {}, Delay + 10 )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC CLOSED TRAFFIC*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ClosedTraffic(Alias, audio)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects 
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  local Break,  AirbaseCoord, AirbaseName, Runway, PatternZone, RunwayHeading, RecipricolHeading, SchedulerObject
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:ReportBaseSubMenu(Alias)
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:ClosedTraffic(Alias, true) end, Transmitter)==false then
    return
  end

  SCHEDULER:New(nil, function()
    if ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias].RequestedApproach = "Closed traffic"
      ATM.TowerControl[Alias].State = "Closed traffic"
    end
    Runway = AI_ATC.Runways.Landing[1]
    AirbaseCoord = AI_ATC_Vec3
    AirbaseName = AI_ATC.Airbase
    PatternZone = ZONE_RADIUS:New("Break", AirbaseCoord:GetVec2(), 5556, nil)
    RunwayHeading = AI_ATC:ExtractRunwayHeading(Runway)
    RecipricolHeading = (RunwayHeading + 180) % 360
    if Runway=="06L" or Runway=="24L" then
      Break = "Left"
    else
      Break = "Right"
    end
  end, {}, 0.5 )
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s %s closed traffic approved, report base.", Title, CallsignSub, Break)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      if Break == "Left" then
        RadioObject:NewTransmission("LeftTraffic.ogg", 1.544, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      elseif Break == "Right" then
        RadioObject:NewTransmission("RightTraffic.ogg", 1.533, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      end
      RadioObject:NewTransmission("ReportBase.ogg", 0.848, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    end, {}, Delay )
  end
  
  Message()

  SchedulerObject = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Coord = Unit:GetCoordinate()
      local Range = Coord:Get2DDistance(AirbaseCoord)
      local Airborne = Unit:InAir()
      if Range >= 16668 then
        MESSAGE:New("Exceeded 9Nm from Andersen", 20):ToUnit(Unit)
        AI_ATC:SayIntentions(Alias)
        SchedulerObject:Stop()
      end
    else
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC GO AROUND************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GoAround(Alias, audio)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local SchedulerObjects = ClientData.SchedulerObjects
  local ApproachType = ClientData.Approach.Type
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  local Destination, AirbaseCoord, Runway, Report, Instruction, SchedulerObject, AudioData
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
    
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:GoAround(Alias, true) end, Transmitter)==false then
    return
  end
  
  local InstructionTable = {
    ["06L"] = { filename = "RunwayHeading.ogg", duration = 3.042, subtitle = "Fly runway heading, climb and maintain 3000." },
    ["06R"] = { filename = "RunwayHeading.ogg", duration = 3.042, subtitle = "Fly runway heading, climb and maintain 3000."  },
    ["24L"] = { filename = "RunwayHeading2.ogg", duration = 5.208, subtitle = "At departure end of runway, turn right heading 300, climb and maintain 3000." },
    ["24R"] = { filename = "RunwayHeading2.ogg", duration = 5.208, subtitle = "At departure end of runway, turn right heading 300, climb and maintain 3000."  },
    ["VFR"] = { filename = "Unable.ogg", duration = 2.995, subtitle = "Unable closed traffic. Report 3 mile initial."  },
  }
  
  SCHEDULER:New(nil, function()
    if ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = nil
    end
    if ApproachType=="Generic" then
      ApproachType = AI_ATC.Procedure
    end
    AirbaseCoord = AI_ATC_Vec3
    Runway = AI_ATC.Runways.Landing[1]

    if ApproachType=="VFR" then
      AudioData = InstructionTable["VFR"]
      Instruction = AudioData.subtitle
      AI_ATC:NavpointSubMenu(Alias)
    elseif ApproachType=="IFR" then
      AudioData = InstructionTable[Runway]
      Instruction = AudioData.subtitle
      AI_ATC:DepartureSubMenu(Alias, true)
    end
  end, {}, 0.5 )
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s %s.", Title, CallsignSub, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      if ApproachType=="VFR" then
        RadioObject:NewTransmission(AudioData.filename, AudioData.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      elseif ApproachType=="IFR" then
        RadioObject:NewTransmission(AudioData.filename, AudioData.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        RadioObject:NewTransmission("ContactApproach.ogg", 2.879, "Airbase_ATC/Ground/SoundFiles/", nil, 0.03)
      end
    end, {}, Delay )
  end
  
  Message()
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Coord = Unit:GetCoordinate()
      local Range = Coord:Get2DDistance(AirbaseCoord)
      local Airborne = Unit:InAir()
      if Range >= 16668 then
        MESSAGE:New("Exceeded 9Nm from Andersen", 20):ToUnit(Unit)
        AI_ATC:SayIntentions(Alias)
        SchedulerObject:Stop()
      end
    else
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC BACK TO RADAR**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:BackToRadar(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  local Destination, Report, Instruction, SchedulerObject, Runway, RunwayData, Turn, Heading, SoundFile
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:BackToRadarSubMenu(Alias)
    
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:BackToRadar(Alias) end, Transmitter)==false then
    return
  end
  
  if ATM.TowerControl[Alias] then
    ATM.TowerControl[Alias] = nil
  end
  
  local RunwayTable = {
    ["06L"] = { Turn = "Left", Heading = "336", SoundFile = {filename = "TurnLeft.ogg", duration = 0.827}},
    ["06R"] = { Turn = "Right", Heading = "156", SoundFile = {filename = "TurnRight.ogg", duration = 0.922}},
    ["24L"] = { Turn = "Left", Heading = "156", SoundFile = {filename = "TurnLeft.ogg", duration = 0.827}},
    ["24R"] = { Turn = "Right", Heading = "336", SoundFile = {filename = "TurnRight.ogg", duration = 0.922}},
  }
  Runway = AI_ATC.Runways.Landing[1]
  RunwayData = RunwayTable[Runway]
  Turn = RunwayData.Turn
  Heading = RunwayData.Heading
  SoundFile = RunwayData.SoundFile

  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(10, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s Turn %s heading %s. Climb and maintain 6000. Contact Andersen Approach UHF channel 7.", Title, CallsignSub, Turn, Heading)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 8)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission(SoundFile.filename, SoundFile.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
      
      RadioObject:NewTransmission("Climb.ogg", 1.742, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("ContactApproach.ogg", 2.972, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    end, {}, Delay)
  end
  
  Message()
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC SAY INTENTIONS********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SayIntentions(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:SayIntentions(Alias) end, Transmitter)==false then
    return
  end
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:LandingSubMenu(Alias, true)
  end, {}, 0.5)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s Say intentions", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("Intentions.ogg", 0.917, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    end, {}, Delay)
  end
  
  Message()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC SAY INTENTIONS********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SayIntentions2(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:SayIntentions2(Alias) end, Transmitter)==false then
    return
  end
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:GoAroundSubMenu(Alias)
  end, {}, 0.5)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s Say intentions", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("Intentions.ogg", 0.917, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    end, {}, Delay)
  end
  
  Message()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC BACK TO RADAR**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RadarVectorDeparture(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local ApproachType = ClientData.Approach.Type
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  local Instruction, SoundFile, Runway
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:ResetMenus(Alias)
    if ApproachType=="Generic" then
      ApproachType = AI_ATC.Procedure
    end
    if ApproachType=="VFR" then
      Instruction = "Contact Andersen Departure on UHF Channel 5"
      SoundFile = "ContactDeparture.ogg"
      AI_ATC:DepartureSubMenu(Alias)
    elseif ApproachType=="IFR" then
      Instruction = "Contact Andersen Approach on UHF Channel 6"
      SoundFile = "ContactApproach.ogg"
      AI_ATC:DepartureSubMenu(Alias, true)
      ATM.ClientData[Alias].Approach.Type = "IFR"
      ATM.ClientData[Alias].Recovery = "FOVEM"
    end
  end, {}, 0.5)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s %s", Title, CallsignSub, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission(SoundFile, 2.972, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    end, {}, Delay)
  end
  
  Message()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC LANDING MANAGER********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:LandingManager(Alias)
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local ApproachType  = ClientData.Approach.Type
  if Jester then Jester:Silence() end
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  
  local Procedure, Runway, Exit, RunwayHeading, InitialRange, UnitCoord, AirbaseCoord, SchedulerObject, SchedulerObject2, SchedulerObject3
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:GoAroundSubMenu(Alias)

  SCHEDULER:New(nil, function()
    Procedure = AI_ATC.Procedure
    if ApproachType == "Generic" then
        ApproachType = Procedure
    end
    Runway = AI_ATC.Runways.Landing[1]
    Exit = AI_ATC_TaxiToPark[Runway].Exit
    AirbaseCoord = AI_ATC_Vec3
    UnitCoord = Unit:GetCoordinate()
    RunwayHeading = AI_ATC:ExtractRunwayHeading(Runway)
    InitialRange = UnitCoord:Get2DDistance(AirbaseCoord)
  end, {}, 0.5)
  
  local function Execute()
    SchedulerObject = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit and Unit:IsAlive() then
        local UnitSpeed = Unit:GetVelocityKNOTS()
        if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
          PLAYER_TOUCHDOWN = true
          local function Message()
            AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
            AI_ATC:ChannelOpen(12, Transmitter, Alias)
            local Subtitle = string.format("%s: %s Welcome back, exit runway via Taxiway %s, Contact Ground for parking", Title, CallsignSub, Exit)
            RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
            AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
            RadioObject:NewTransmission("WelcomeBack.ogg", 2.508, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
            AI_ATC:Phonetic(Exit, RadioObject, Transmitter)
            RadioObject:NewTransmission("ContactGround.ogg", 1.289, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
          end
          Message()
          AI_ATC:ResetMenus(Alias)
          AI_ATC:ParkingSubMenu(Alias)
          
          if ATM.TowerControl[Alias] then
            ATM.TowerControl[Alias] = nil
          end
            
          if Jester then Jester:Speak() end
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end, {}, 1, 1)
  end
  
  local function ClimbOut()
    SchedulerObject3 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit and Unit:IsAlive() then
        local Coord = Unit:GetCoordinate()
        local Heading = Unit:GetHeading()
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        local UnitSpeed = Unit:GetVelocityKNOTS()
        local Airborne = Unit:InAir()
        if Airborne and (Range >= 1389 or Angle >= 10)  then
          MESSAGE:New("Pilot did not specify to rejoin pattern", 20):ToUnit(Unit)
          if ApproachType=="VFR" then
            AI_ATC:GoAround(Alias)
          else
            AI_ATC:SayIntentions2(Alias)
          end
          SchedulerObject3:Stop()
        elseif not Airborne and UnitSpeed<=90 then
          Execute()
          SchedulerObject3:Stop()
        end
      else
        SchedulerObject3:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject3)
  end
  
  local function TakeOffCheck()
    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local UnitSpeed = Unit:GetVelocityKNOTS()
        local Airborne = Unit:InAir()
        if Airborne then
          ClimbOut()
          SchedulerObject2:Stop()
        elseif not Airborne and UnitSpeed <= 90 then
          Execute()
          SchedulerObject2:Stop()
        end
      else
        SchedulerObject2:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject2)
  end
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Coord = Unit:GetCoordinate()
      local Heading = Unit:GetHeading()
      local Range = Coord:Get2DDistance(AirbaseCoord)
      local Airborne = Unit:InAir()
      local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
      if Range >= InitialRange and Range >= 11112 then
        MESSAGE:New("Exceeded 6Nm from Andersen", 20):ToUnit(Unit)
        AI_ATC:SayIntentions(Alias)
        SchedulerObject:Stop()
      elseif Range <= 2743 and Angle >= 10 then
        MESSAGE:New("Abnormal approach angle", 20):ToUnit(Unit)
        if ApproachType=="VFR" then
          AI_ATC:GoAround(Alias)
        else
          AI_ATC:SayIntentions2(Alias)
        end
        SchedulerObject:Stop()
      elseif Range <= 560 and Angle <= 10 and Airborne then
        ClimbOut()
        SchedulerObject:Stop()
      elseif Range <= 5556 and Angle <= 10 and not Airborne then
        TakeOffCheck()
        SchedulerObject:Stop()
      end
    elseif not ATM.ClientData[Alias] and Unit then
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC TAXI TO PARKING********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiParking(Alias)
  local Transmitter = "Ground"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = GROUND_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local GroupObject = Unit:GetGroup()
  local Spot = ClientData.SpotNumber
  local MarkCoord = ClientData.SpotCoord
  local SchedulerObjects = ClientData.SchedulerObjects
  local TaxiData = ClientData.Taxi
  local Count = 0
  local Iteration = 10
  local Delay = math.random(1.0, 1.5)
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local HoldShort, TurnDirection, Hold = AI_ATC:HoldShortLanding(Alias)
  local Runway = AI_ATC.Runways.Landing[1]
  local AudioFile, TurnSub, Duration, PrimaryTaxiway, Exit, HoldShortSub, Instruction

  local TurnTable = {
    ["Left"] = { filename = "LeftTurn.ogg", duration = 0.522 },
    ["Right"] = { filename = "RightTurn.ogg", duration = 0.546 },
  }

  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ClearanceSubMenu(Alias)

    if Hold==true then
      AudioFile = TurnTable[TurnDirection]
      if TurnDirection=="Left" then
        TurnSub = "Left turn"
      else
        TurnSub = "Right turn"
      end
      Duration = 5
      Exit = AI_ATC_TaxiToPark[Runway].Exit
      Instruction = string.format("%s %s, hold short runway %s", TurnSub, Exit, HoldShort)
      AI_ATC:LandingHoldSubMenu(Alias, HoldShort)
    else
      Duration = 1
      Instruction = ""
      AI_ATC:TaxiSubMenu(Alias)
    end
  end, {}, 0.5)

  local function Execute(parkingspot)
    if MarkCoord~=nil then
      ATM.ClientData[Alias].Mark = MarkCoord:MarkToGroup(parkingspot, GroupObject, true)
    end
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Execute(parkingspot) end)
      AI_ATC:ChannelOpen(8, Transmitter, Alias)
      local Subtitle = string.format("%s: %s %s", Title, CallsignSub, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, Duration)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      if Hold==true then
        RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
        AI_ATC:Phonetic(Exit, RadioObject, Transmitter)
        RadioObject:NewTransmission("HoldShort.ogg", 0.615, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
        RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.03)
        AI_ATC:Runway(HoldShort, RadioObject, Transmitter)
      else
        AI_ATC:TaxiToParking(Alias, RadioObject, Transmitter)
        local Subtitle = string.format("%s: and you'll be in parking space %s", Title, parkingspot )
        RadioObject:NewTransmission("ParkingSpace.ogg", 1.382, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 3)
        AI_ATC:SpotNumber(Spot, RadioObject, Transmitter)
      end
    end, {}, Delay)
  end
  
  ATC_Coroutine:AddCoroutine(function()
    local inputString = nil
    for key, value in pairs(Andersen_ParkingSpot) do
      Count = Count + 1
      if value.Number == Spot then
        Execute(key)
        ATM.ClientData[Alias].ParkingSpace = key
        break
      end
      if Count >= Iteration then
        Count = 0
        coroutine.yield()
      end
    end
  end)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC CROSS RUNWAY LANDING************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CrossRunwayLanding(Alias, Audio)
  local Transmitter = "Ground"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = GROUND_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Runway = AI_ATC.Runways.Takeoff[1]
  local HoldShort = ATM.GroundControl[Alias].HoldShortLanding
  local Spot = ClientData.SpotNumber
  local ParkingSpace = ClientData.ParkingSpace  
  local TaxiData = ClientData.Taxi
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = math.random(1.5, 2.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:CrossRunwayLanding(Alias, Audio) end, Transmitter)==false then
    return
  end

  
  if Audio~=true then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ClearanceSubMenu(Alias)
    AI_ATC:TaxiSubMenu(Alias)
  end

  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    local Subtitle = string.format("%s: %s Cross runway %s and you'll be in parking space %s", Title, CallsignSub, HoldShort, ParkingSpace)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 6)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("CrossRunway.ogg", 0.740, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    AI_ATC:Runway(HoldShort, RadioObject, Transmitter)
    RadioObject:NewTransmission("ParkingSpace.ogg", 1.382, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    AI_ATC:SpotNumber(Spot, RadioObject, Transmitter)
  end,{}, Delay)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************START AI_ATC************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Start()
  local Subtitle = "*****************************************************AI_ATC v1.0.0.1 HAS STARTED******************************************************************************"
  env.info(Subtitle)
  AI_ATC:EnableCrewChief(true)
  AI_ATC:InitATIS()
  AI_ATC:FindTankerUnits()
  AI_ATC:InitClients()
  AI_ATC:InitRadios()
  AI_ATC:GroundController(false)
  AI_ATC:TowerController(false)
  SCHEDULER:New(nil, function()
    AI_ATC:StartATIS()
  end, {}, 1)
end

SCHEDULER:New(nil, function()
  --AI_ATC:SetCallsign("NELLIS_F-5E", "Burnin' Stogie", "31")
  AI_ATC:Start()
end, {}, 3)