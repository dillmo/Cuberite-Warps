function LoadWarps()
  local warps = cIniFile()
  warps:ReadFile( "warps.ini" )
  return warps
end
