warps = cIniFile()

function AddWarp( Split, Player )
  -- Load the warps.ini file and set the key name
  keyName = LoadWarps( Split )

  -- Add the warp
  if ( warps:HasValue( keyName, "x") ) then
    -- Don't let the player add warps that already exist
    Player:SendMessageFailure( "That warp already exists!" )
  else
    warps:AddKeyName( keyName )
    warps:AddValue( keyName, "x", math.floor( Player:GetPosX() ) + 0.5 )
    warps:AddValue( keyName, "y", math.floor( Player:GetPosY() ) )
    warps:AddValue( keyName, "z", math.floor( Player:GetPosZ() ) + 0.5 )
    -- Let the player know whether the warp was successfully added
    if ( warps:WriteFile( "warps.ini" ) ) then
      Player:SendMessageSuccess( "Warp added!" )
    else
      Player:SendMessageFailure( "Failed to add warp" )
    end
  end
  return true
end

function RemoveWarp( Split, Player )
  -- Load the warps.ini file and set the key name
  keyName = LoadWarps( Split )

  if ( warps:HasValue( keyName, "x") ) then
    -- Remove the warp
    warps:DeleteKey( keyName )
    -- Let the player know whether the warp was successfully removed
    if ( warps:WriteFile( "warps.ini" ) ) then
      Player:SendMessageSuccess( "Warp removed!" )
    else
      Player:SendMessageFailure( "Failed to remove warp" )
    end
  else
    -- Don't let the player remove warps that already exist
    Player:SendMessageFailure( "That warp doesn't exist!" )
  end
  return true
end

function GoToWarp( Split, Player )
  -- Load the warps.ini file and set the key name
  keyName = LoadWarps( Split )

  if ( warps:HasValue( keyName, "x") ) then
    -- Define the warp's coords
    local xPos = warps:GetValue( keyName, "x" )
    local yPos = warps:GetValue( keyName, "y" )
    local zPos = warps:GetValue( keyName, "z" )
    -- Teleport to the warp
    Player:TeleportToCoords( xPos, yPos, zPos )
  else
    -- Warn the player that the warp doesn't exist
    Player:SendMessageFailure( "That warp does not exist!" )
  end
  return true
end

function ListWarps( Split, Player )
  -- Load the warps.ini file and set the key name
  keyName = LoadWarps( Split )

  if ( warps:GetNumKeys() == 0 ) then
    -- Let the player know if there are no warps
    Player:SendMessageInfo( "There are no warps yet" )
  else
    -- Iterate through the warps
    for i = 0, warps:GetNumKeys() - 1 do
      Player:SendMessage( warps:GetKeyName( i ) )
    end
  end
  return true
end
