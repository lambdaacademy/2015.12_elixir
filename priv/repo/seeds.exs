# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     VotingService.Repo.insert!(%VotingService.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
VotingService.Repo.insert!(%VotingService.Talk{title: "Java Concurrency", author: "Joshua Bloh", description: "Boring!", pluses: 0, minuses: 0})
VotingService.Repo.insert!(%VotingService.Talk{title: "Scala Akka Model", author: "Martin Odersky", description: "Where scala meet actors"})
VotingService.Repo.insert!(%VotingService.Talk{title: "Elixir vs RoR", author: "???", description: "Worth checking?", pluses: 1})
