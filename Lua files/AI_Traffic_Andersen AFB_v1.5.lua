-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************AI_TRAFFIC****************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AI_Traffic = {}
AI_Traffic.Departure = {}
AI_Traffic.Approach = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************SAVE FILE****************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_Traffic:SaveTableToFile(tbl, filename)
  if io then
    local Path = "C:\\Users\\Avala\\Saved Games\\DCS\\Mods\\"

    local function SerializeTable(val, name, depth)
      depth = depth or 0
      local tmp = string.rep(" ", depth * 2)

      -- Write key if present
      if name ~= nil then
        if type(name) == "number" then
          tmp = tmp .. "[" .. name .. "] = "
        else
          -- Safely quote string keys
          tmp = tmp .. "[" .. string.format("%q", name) .. "] = "
        end
      end

      -- Table (non-Vec3)
      if type(val) == "table" and not (val.x and val.y and val.z) then
        tmp = tmp .. "{\n"
        for k, v in pairs(val) do
          tmp = tmp .. SerializeTable(v, k, depth + 1) .. ",\n"
        end
        tmp = tmp .. string.rep(" ", depth * 2) .. "}"

      -- Vec3 table special case
      elseif type(val) == "table" and val.x and val.y and val.z then
        tmp = tmp .. string.format("{x = %.6f, y = %.6f, z = %.6f}", val.x, val.y, val.z)

      -- Numbers
      elseif type(val) == "number" then
        tmp = tmp .. string.format("%.6f", val)

      -- Strings (quoted safely)
      elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)

      -- Booleans
      elseif type(val) == "boolean" then
        tmp = tmp .. tostring(val)

      -- Fallback (should not really occur for DCS templates)
      else
        tmp = tmp .. string.format("%q", tostring(val))
      end

      return tmp
    end

    -- Top-level: no extra outer braces
    local serializedData = "local ATC_TerminalCoordinates = "
    serializedData = serializedData .. SerializeTable(tbl, nil, 0)
    serializedData = serializedData .. "\nreturn ATC_TerminalCoordinates"

    local fullPath = Path .. "\\" .. filename
    local file, err = io.open(fullPath, "w")
    if not file then
      env.info("Error opening file for writing: " .. err)
      return false
    end
    
    file:write(serializedData)
    file:close()
    
    env.info("Successfully saved table to " .. fullPath)
    return true
  else
    env.info("*****Note - Mission Lua Environment is Sanitised, Some features unavailable.")
    return false
  end
end

AllManeuvers = {
  "AI_Straight in_06L",
  "AI_B2R_06L",
  "AI_Missed Approach_06L",
  "AI_Straight in_06L-2",
  "AI_B2R_06L-2",
  "AI_Missed Approach_06L-2",

  "AI_Straight in_06R",
  "AI_B2R_06R",
  "AI_Missed Approach_06R",
  "AI_Straight in_06R-2",
  "AI_B2R_06R-2",
  "AI_Missed Approach_06R-2",

  "AI_Straight in_24L",
  "AI_B2R_24L",
  "AI_Missed Approach_24L",
  "AI_Straight in_24L-2",
  "AI_B2R_24L-2",
  "AI_Missed Approach_24L-2",

  "AI_Overhead_06L",
  "AI_Outside Downwind_06L",
  "AI_Overhead_06L-2",
  "AI_Outside Downwind_06L-2",

  "AI_Overhead_06R",
  "AI_Outside Downwind_06R",
  "AI_Overhead_06R-2",
  "AI_Outside Downwind_06R-2",

  "AI_Overhead_24L",
  "AI_Outside Downwind_24L",
  "AI_Overhead_24L-2",
  "AI_Outside Downwind_24L-2",
}

local ManeuverTemplates = {}

--for i, maneuver in ipairs(AllManeuvers) do
  --local GroupObject = GROUP:FindByName(maneuver)

  --if GroupObject then
    --local Template = GroupObject:GetTemplate()
    --ManeuverTemplates[maneuver] = Template
  --else
    --env.info("AI_ATC: Missing group for maneuver: " .. tostring(maneuver))
  --end
--end

--AI_Traffic:SaveTableToFile(ManeuverTemplates, "ManeuverTemplates.lua")

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************AI_TRAFFIC PARKING DATA********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AI_Traffic.TrafficParking = {
  ["A-10C_2"]       = { 150, 151, 152, 153 },
  ["AV8BNA"]        = { 150, 151, 152, 153 },
  ["A6E"]           = { 138, 139, 140, 141 },
  ["F-14B"]         = { 109, 110, 80, 81 },
  ["F-15C"]         = { 22, 21, 18, 17 },
  ["F-15ESE"]       = { 76, 75, 74, 73 },
  ["F-16C_50"]      = { 183, 182, 185, 184 },
  ["FA-18C_hornet"] = { 71, 70, 48, 69 },
  ["F-5E-3"]        = { 40, 41, 42, 43 },
  ["F-4E-45MC"]     = { 106, 105, 104, 103 },
  ["M-2000C"]       = { 122, 123, 93, 94 },
  ["MB-339A"]       = { 138, 139, 140, 141 },
  ["Tornado GR4"]   = { 183, 182, 185, 184 },
}
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************AI_TRAFFIC SPAWN DEPARTURE************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_Traffic:SpawnDeparture()
  local Runway = AI_ATC.Runways.Landing[1]
  local ManeuverTbl
  if Runway=="06L" then
    ManeuverTbl      = { "AI_Andersen_Departure_06L" }
  elseif Runway=="06R" then
    ManeuverTbl      = { "AI_Andersen_Departure_06R" }
  else
    ManeuverTbl      = { "AI_Andersen_Departure_24L" }
  end

  local FighterTemplate  = { "A-10C-II","AV-8B", "A-6E", "F-14B", "F-15C","F-15E","F-16C","F-4E","F-5E","F/A-18C","M-2000C","MB-339A","Tornado" }
  local HeavyTemplate    = { "C-17A","C-130","KC-135","B-52","B-1B" }

  local Grpng, SpawnTable, SpawnState, RandomTemplate, SchedulerObject

  AI_Traffic.Departure = AI_Traffic.Departure or {}
  AI_Traffic.Departure.PreviousManeuver = AI_Traffic.Departure.PreviousManeuver or nil

  local function baseManeuver(name) return (name:gsub("%-2$", "")) end

  local function pickManeuver()
    local prevBase = AI_Traffic.Departure.PreviousManeuver and baseManeuver(AI_Traffic.Departure.PreviousManeuver) or nil
    local candidates = {}
    for _, m in ipairs(ManeuverTbl) do
      if baseManeuver(m) ~= prevBase then table.insert(candidates, m) end
    end
    if #candidates == 0 then
      for _, m in ipairs(ManeuverTbl) do table.insert(candidates, m) end
    end
    return candidates[math.random(#candidates)]
  end

  local Maneuver = pickManeuver()
  AI_Traffic.Departure.PreviousManeuver = Maneuver

  RandomTemplate = math.random(1,2)

  if RandomTemplate == 1 then
    SpawnState = SPAWN.Takeoff.Cold
    --SpawnState = SPAWN.Takeoff.Hot
    SpawnTable = FighterTemplate
    Grpng = (math.random(1,2) == 1) and 2 or 4
  else
    SpawnState = SPAWN.Takeoff.Hot
    SpawnTable = HeavyTemplate
    Grpng = 1
  end

  local spawnTemplateName = SpawnTable[math.random(#SpawnTable)]
  local spawnGrp = GROUP:FindByName(spawnTemplateName)
  if not spawnGrp then
    env.info(string.format("[AI_TRAFFIC] Missing spawn template group: %s", tostring(spawnTemplateName)))
    SCHEDULER:New(nil, function() AI_Traffic:SpawnDeparture() end, {}, 2)
    return
  end

  local template = spawnGrp:GetTemplate()
  local callsign = spawnGrp:GetCallsign()

  local DonorName = Maneuver

  local donorTemplate = AI_Traffic_Templates[DonorName]
  if not donorTemplate or not donorTemplate.route then
    env.info(string.format("[AI_TRAFFIC] Bad donor template/route: %s", tostring(DonorName)))
    SCHEDULER:New(nil, function() AI_Traffic:SpawnDeparture() end, {}, 2)
    return
  end
      
  --local donorGrp = GROUP:FindByName(Maneuver)
  --if not donorGrp then
    --env.info(string.format("[SPAWN-APP] Missing donor group: %s", tostring(Maneuver)))
    --SCHEDULER:New(nil, function() AI_Traffic:SpawnDeparture() end, {}, 2)
    --return
  --end
  --local donorTemplate = donorGrp:GetTemplate()
  --if not donorTemplate then
    --env.info(string.format("[SPAWN-APP] Bad donor template: %s", tostring(Maneuver)))
    --SCHEDULER:New(nil, function() AI_Traffic:SpawnDeparture() end, {}, 2)
    --return
  --end
  
  template.route = donorTemplate.route

  local SpawnObject = SPAWN:NewFromTemplate(template, spawnTemplateName, callsign, true)
  SpawnObject:InitSkill("Excellent")
  SpawnObject:InitCategory(Group.Category.AIRPLANE)
  SpawnObject:InitCoalition(coalition.side.BLUE)
  SpawnObject:InitCountry(country.id.CJTF_BLUE)
  SpawnObject:InitGrouping(Grpng)

  SpawnObject:OnSpawnGroup(function (spawnGroup)
    local SchedulerObject
    SchedulerObject = SCHEDULER:New(nil, function()
      if not spawnGroup or not spawnGroup:IsAlive() then
        if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
        return
      end
      local coord = spawnGroup:GetCoordinate()
      if not coord then return end
      local distance = coord:Get2DDistance(AI_ATC_Vec3)
      if distance >= 31484 then
        spawnGroup:Destroy()
        SCHEDULER:New(nil, function() AI_Traffic:SpawnTraffic() end, {}, 5)
        if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
      end
    end, {}, 5, 5)
  end)

  local ACType = SpawnObject.SpawnTemplate.units[1].type
  local Parking = AI_Traffic.TrafficParking[ACType] or {51}
  if ACType=="C-17A" then
    Parking ={64}
  end
  local Result = UTILS.OneLineSerialize(Parking)
  env.info(string.format("[AI_TRAFFIC] Nominated Parking Spots: %s -- %s", tostring(spawnTemplateName), Result))

  local SpwnGrp = SpawnObject:SpawnAtParkingSpot(AI_ATC.AirbaseID, Parking, SpawnState)
  
  SCHEDULER:New(nil, function()
    if not SpwnGrp then
      AI_Traffic:SpawnDeparture()
    end
  end, {}, 2)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************AI_TRAFFIC SPAWN APPROACH************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_Traffic:SpawnApproach()
  local Runway = AI_ATC.Runways.Landing[1]
  local ManeuverTbl, RunwayHeading, SpawnHeading
  
  local function pickFromFiltered(list, bannedSet)
    local filtered = {}
    for _, v in ipairs(list) do
      if not bannedSet[v] then
        filtered[#filtered+1] = v
      end
    end
    if #filtered == 0 then
      filtered = list
    end
    return filtered[math.random(#filtered)]
  end
  
  if AI_ATC.Procedure=="IFR" then
    if Runway=="06L" then
      RunwayHeading = 066
      SpawnHeading = RunwayHeading
      ManeuverTbl = {
        "AI_Straight in_06L", "AI_B2R_06L", "AI_Missed Approach_06L",
        "AI_Straight in_06L-2", "AI_B2R_06L-2", "AI_Missed Approach_06L-2"
      }
    elseif Runway=="06R" then
      RunwayHeading = 066
      SpawnHeading = RunwayHeading
      ManeuverTbl = {
        "AI_Straight in_06R", "AI_B2R_06R", "AI_Missed Approach_06R",
        "AI_Straight in_06R-2", "AI_B2R_06R-2", "AI_Missed Approach_06R-2",
      }
    else
      RunwayHeading = 246
      SpawnHeading = RunwayHeading
      ManeuverTbl = {
        "AI_Straight in_24L", "AI_B2R_24L", "AI_Missed Approach_24L",
        "AI_Straight in_24L-2", "AI_B2R_24L-2", "AI_Missed Approach_24L-2"
      }
    end
  else
    if Runway=="06L" then
      RunwayHeading = 066
      SpawnHeading = 176
      ManeuverTbl = {
        "AI_Outside Downwind_06L", "AI_Straight in_06L", "AI_B2R_06L", "AI_Missed Approach_06L",
        "AI_Outside Downwind_06L-2", "AI_Straight in_06L-2", "AI_B2R_06L-2", "AI_Missed Approach_06L-2",
        --"AI_Overhead_06L",
        --"AI_Overhead_06L-2",
      }
    elseif Runway=="06R" then
      RunwayHeading = 066
      SpawnHeading = 326
      ManeuverTbl = {
        "AI_Outside Downwind_06R", "AI_Straight in_06R", "AI_B2R_06R", "AI_Missed Approach_06R",
        "AI_Outside Downwind_06R-2", "AI_Straight in_06R-2", "AI_B2R_06R-2", "AI_Missed Approach_06R-2",
        --"AI_Overhead_06R",
        --"AI_Overhead_06R-2",
      }
    else
      RunwayHeading = 246
      SpawnHeading = 064
      ManeuverTbl = {
        "AI_Outside Downwind_24L", "AI_Straight in_24L", "AI_B2R_24L", "AI_Missed Approach_24L",
        "AI_Outside Downwind_24L-2", "AI_Straight in_24L-2", "AI_B2R_24L-2", "AI_Missed Approach_24L-2"
        --"AI_Overhead_24L",
        --"AI_Overhead_24L-2",
      }
    end
  end
  local FighterTemplate = { "A-10C-II","AV-8B","A-6E","F-15C","F-15E","F-16C","F-5E","F/A-18C","M-2000C","MB-339A","Tornado" }
  local TwoShipTemplate = { "A-10C-II-2","AV-8B-2","A-6E-2","F-15C-2","F-15E-2","F-16C-2","F-5E-2","F/A-18C-2","M-2000C-2","MB-339A-2","Tornado-2" }
  local HeavyTemplate   = { "C-17A","C-130","KC-135","B-52","B-1B" }

  AI_Traffic.Approach = AI_Traffic.Approach or {}
  AI_Traffic.Approach.PreviousManeuver = AI_Traffic.Approach.PreviousManeuver or nil

  local function baseManeuver(name) return (name:gsub("%-2$", "")) end

  local function pickManeuver()
    local prevBase = AI_Traffic.Approach.PreviousManeuver and baseManeuver(AI_Traffic.Approach.PreviousManeuver) or nil
    local candidates = {}
    for _, m in ipairs(ManeuverTbl) do
      if baseManeuver(m) ~= prevBase then
        table.insert(candidates, m)
      end
    end

    if #candidates == 0 then
      for _, m in ipairs(ManeuverTbl) do
        table.insert(candidates, m)
      end
    end

    local byBase = {}
    local bases  = {}
  
    for _, m in ipairs(candidates) do
      local b = baseManeuver(m)
      if not byBase[b] then
        byBase[b] = { single = nil, twoship = nil }
        table.insert(bases, b)
      end
  
      if m:find("%-2$") then
        byBase[b].twoship = m
      else
        byBase[b].single = m
      end
    end

    local chosenBase = bases[math.random(#bases)]
    local info = byBase[chosenBase]

    local isStraightMissedB2R =
         string.find(chosenBase, "AI_Straight in",     1, true)
      or string.find(chosenBase, "AI_Missed Approach", 1, true)
      or string.find(chosenBase, "AI_B2R",             1, true)

    if info.single and info.twoship then
      local rollMax = isStraightMissedB2R and 3 or 2
      if math.random(1, rollMax) == 1 then
        return info.twoship
      else
        return info.single
      end
    else
      return info.single or info.twoship
    end
  end

  local function SpawnRandomGroup()
    local Heading
    local Maneuver = pickManeuver()
    local isOverhead = string.find(Maneuver, "AI_Overhead", 1, true) ~= nil
    AI_Traffic.Approach.PreviousManeuver = Maneuver
    
    local spawnTemplateName
    if string.find(Maneuver, "AI_Straight in", 1, true) 
    or string.find(Maneuver, "AI_Missed Approach", 1, true) 
    or string.find(Maneuver, "AI_Outside Downwind", 1, true) 
    or string.find(Maneuver, "AI_B2R", 1, true) 
    then
      Heading = RunwayHeading
      if Maneuver:find("%-2$") then
        spawnTemplateName = TwoShipTemplate[math.random(#TwoShipTemplate)]
      else
        if not string.find(Maneuver, "AI_Outside Downwind", 1, true) then
          local allowedHeavies = {}
          for _, h in ipairs(HeavyTemplate) do
            if h ~= "B-1B" and h ~= "B-52" then
              table.insert(allowedHeavies, h)
            end
          end

          if #allowedHeavies == 0 then
            spawnTemplateName = FighterTemplate[math.random(#FighterTemplate)]
          else
            spawnTemplateName = allowedHeavies[math.random(#allowedHeavies)]
          end
        
        else
          spawnTemplateName = FighterTemplate[math.random(#FighterTemplate)]
        end
      end
    else
      Heading = SpawnHeading
      if Maneuver:find("%-2$") then
        if isOverhead then
          spawnTemplateName = pickFromFiltered(TwoShipTemplate, {
            ["F-4E-2"] = true,
            ["F/A-18C-2"] = true,
            ["F-15E-2"] = true,
          })
          spawnTemplateName = TwoShipTemplate[math.random(#TwoShipTemplate)]
        else
          spawnTemplateName = TwoShipTemplate[math.random(#TwoShipTemplate)]
        end
      else
        if isOverhead then
          spawnTemplateName = pickFromFiltered(FighterTemplate, {
            ["F-4E"] = true,
            ["F/A-18C"] = true,
            ["F-15E"] = true,
          })
        else
          spawnTemplateName = FighterTemplate[math.random(#FighterTemplate)]
        end
      end
    end

    local spawnGrp = GROUP:FindByName(spawnTemplateName)
    if not spawnGrp then
      env.info(string.format("[SPAWN-APP] Missing spawn template group: %s", tostring(spawnTemplateName)))
      SCHEDULER:New(nil, SpawnRandomGroup, {}, 1)
      return
    end
    local template = spawnGrp:GetTemplate()
    if not template or not template.units or #template.units == 0 then
      env.info(string.format("[SPAWN-APP] Bad template for: %s", tostring(spawnTemplateName)))
      SCHEDULER:New(nil, SpawnRandomGroup, {}, 1)
      return
    end
    local callsign = spawnGrp:GetCallsign() or spawnTemplateName

    -- fuel trim
    for _, u in ipairs(template.units) do
      if u.payload and u.payload.fuel then u.payload.fuel = u.payload.fuel / 3 end
    end

    --local donorTemplate = AI_Traffic_Templates[Maneuver]
    --if not donorTemplate then
      --env.info(string.format("[SPAWN-APP] Bad donor template: %s", tostring(Maneuver)))
      --SCHEDULER:New(nil, SpawnRandomGroup, {}, 1)
      --return
    --end
    
    local donorGrp = GROUP:FindByName(Maneuver)
    if not donorGrp then
      env.info(string.format("[SPAWN-APP] Missing donor group: %s", tostring(Maneuver)))
      SCHEDULER:New(nil, SpawnRandomGroup, {}, 1)
      return
    end
    local donorTemplate = donorGrp:GetTemplate()
    if not donorTemplate then
      env.info(string.format("[SPAWN-APP] Bad donor template: %s", tostring(Maneuver)))
      SCHEDULER:New(nil, SpawnRandomGroup, {}, 1)
      return
    end

    template.route = donorTemplate.route
    template.x     = donorTemplate.x
    template.y     = donorTemplate.y

    for i, unit in ipairs(template.units) do
      local d = donorTemplate.units and donorTemplate.units[i]
      if d then
        unit.alt = d.alt; unit.x = d.x; unit.y = d.y
      else
        local lead = donorTemplate.units and donorTemplate.units[1]
        if lead then
          unit.alt = unit.alt or lead.alt
          unit.x   = unit.x   or lead.x
          unit.y   = unit.y   or lead.y
        end
      end
    end

    local SpawnObject = SPAWN:NewFromTemplate(template, spawnTemplateName, callsign, true)
    SpawnObject:InitHeading(Heading)

    SpawnObject:OnSpawnGroup(function (spawnGroup)
      local SchedulerObject
      if not spawnGroup or not spawnGroup:IsAlive() then return end

      spawnGroup:HandleEvent(EVENTS.Land)

      SchedulerObject = SCHEDULER:New(nil, function()
        if not spawnGroup or not spawnGroup:IsAlive() then
          if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
          return
        end
        local coord = spawnGroup:GetCoordinate()
        if not coord then return end
        local distance = coord:Get2DDistance(AI_ATC_Vec3)
        local altitude = spawnGroup:GetAltitude(true)

        if distance >= 31484 then
          spawnGroup:Destroy()
          if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
          AI_Traffic:SpawnTraffic()
          return
        end

        if altitude <= 20 then
          SCHEDULER:New(nil, function()
            if spawnGroup and spawnGroup:IsAlive() then
              spawnGroup:Destroy()
              AI_Traffic:SpawnTraffic()
            end
          end, {}, 30)
          spawnGroup:UnHandleEvent(EVENTS.Land)
          if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
        end
      end, {}, 5, 5)

      function spawnGroup:OnEventLand(EventData)
        spawnGroup:UnHandleEvent(EVENTS.Land)
        SCHEDULER:New(nil, function()
          if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
          if self and self:IsAlive() then self:Destroy() end
          SCHEDULER:New(nil, function() AI_Traffic:SpawnTraffic() end, {}, 1)
        end, {}, 10)
      end
    end)

    SpawnObject:Spawn()
  end

  SpawnRandomGroup()
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************AI_TRAFFIC INITIALIZE*****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_Traffic:SpawnTraffic()
  local Randomizer = math.random(1, 2)
  if Randomizer==1 then
    AI_Traffic:SpawnDeparture()
  else
    AI_Traffic:SpawnApproach()
  end
end

SCHEDULER:New(nil, function()
  AI_Traffic:SpawnTraffic()
end, {}, 5)
