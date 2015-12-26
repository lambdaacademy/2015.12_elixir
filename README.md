# VotingService

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Curl examples
Preload data(3 example talks):
mix run priv/repo/seeds.exs

Commands:
curl -v -X PUT -H "Content-Type: application/json" --data @t4.json localhost:4000/api/talks/3
curl -v -X POST -H "Content-Type: application/json" --data @t4.json localhost:4000/api/talks/
curl -v -X DELETE -H "Content-Type: application/json" localhost:4000/api/talks/1
curl -v -H "Content-Type: application/json" localhost:4000/api/talks/ | jq
