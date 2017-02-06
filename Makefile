release:
	mix local.rebar --force
	mix local.hex --force
	mix deps.get
	mix deps.compile distillery
	node_modules/brunch/bin/brunch build
	MIX_ENV=prod mix phoenix.digest
	MIX_ENV=prod mix release
