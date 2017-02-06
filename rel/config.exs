Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: :dev

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"jXn<d<]S%|yzCo,1B&*cY@)sakB(m)DPd!GZfVA;|m|I(WY2t?ts=I@KQ>xW8j9o"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"h45`=y`PZAN>suBi?]1@!Q.q~?e3a>=XANOg,YSH!eMyBj/UMy=V*x&wWks_AO{K"
end

release :voting_service do
  set version: current_version(:voting_service)
end
