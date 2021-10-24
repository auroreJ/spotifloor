use Mix.Config
config :logger, :console, level: :error

config :white_bread,
  outputers: [
    {WhiteBread.Outputers.Console, []},
    {WhiteBread.Outputers.HTML, path: "~/Documents/bdd_conf/spotifloor/report.html"},
    {WhiteBread.Outputers.JSON, path: "~/Documents/bdd_conf/spotifloor/report.json"}
  ]
