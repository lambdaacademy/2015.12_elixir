release:
	mix local.rebar --force
	mix local.hex --force
	mix deps.get
	mix deps.compile distillery
	MIX_ENV=prod mix release
