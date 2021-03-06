g_PluginInfo =
{
  Name = "Warps",
  Version = "3",
  Date = "2015-06-17",
  SourceLocation = "https://github.com/dillmo/Cuberite-Warps",
  Description = "This plugin allows you to easily use and manage warps.",
  Commands =
  {
    ["/warp"] =
    {
      Alias = "/warps",
      Subcommands = {

        add =
        {
          HelpString = "Adds a named warp",
          Permission = "warps.warp.add",
          Handler = AddWarp,
          ParameterCombinations =
          {
            {
              Params = "name",
              Help = "Adds a named warp"
            },
          },
        },

        remove =
        {
          Alias = {"delete", "dl", "rm"},
          HelpString = "Removes a named warp",
          Permission = "warps.warp.remove",
          Handler = RemoveWarp,
          ParameterCombinations =
          {
            {
              Params = "name",
              Help = "Removes a named warp",
            },
          },
        },

        goto =
        {
          Alias = "tp",
          HelpString = "Teleports to a named warp",
          Permission = "warps.warp.goto",
          Handler = GoToWarp,
          ParameterCombinations =
          {
            {
              Params = "name",
              Help = "Teleports to a named warp",
            },
          },
        },

        list =
        {
          HelpString = "Lists all the warps",
          Permission = "warps.warp.list",
          Handler = ListWarps,
        },

      },
    },
  },
}
