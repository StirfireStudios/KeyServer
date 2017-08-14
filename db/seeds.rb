# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ff = Game.create(name: "Freedom Fall")
symph = Game.create(name: "Symphony of the Machine")

steam = Platform.create(name: "Steam")
siee = Platform.create(name: "Playstation Network - America")
siea = Platform.create(name: "Playstation Network - Europe")
oculus = Platform.create(name: "Oculus")

(1..10).each do |index|
  PlatformKey.create(game: ff, platform: steam, value: "Steam Key #{index}")
  PlatformKey.create(game: ff, platform: siee, value: "PSN-America Key #{index}")
  PlatformKey.create(game: ff, platform: siea, value: "PSN-Europe Key #{index}")
  PlatformKey.create(game: ff, platform: oculus, value: "Oculus Key #{index}")
end
