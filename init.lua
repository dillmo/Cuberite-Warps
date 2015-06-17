function Initialize ( Plugin )
  Plugin:SetName( g_PluginInfo.Name )
  Plugin:SetVersion( g_PluginInfo.Version )

  -- Load InfoReg shared library
  dofile( cPluginManager:GetPluginsPath() .. "/InfoReg.lua" )

  -- Bind all commands
  RegisterPluginInfoCommands()

  LOG( "Initialised " .. Plugin:GetName() .. " v." .. Plugin:GetVersion() )
  return true
end
