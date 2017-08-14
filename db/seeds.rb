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

key = 1

(1..10).each do
  [ff, symph].each do |game|
    keystring = key.to_s.rjust(2, "0")
    PlatformKey.create(game: game, platform: steam, value: "STM#{keystring}-MFVVV-4PDKF")
    PlatformKey.create(game: game, platform: siee, value: "PA#{keystring}-H3N5-ERFK")
    PlatformKey.create(game: game, platform: siea, value: "PE#{keystring}-K4H2-RTFD")
    PlatformKey.create(game: game, platform: oculus, value: "OCL#{keystring}-G6NEC-GQ49R-GWPHE-W6CNR")
    key += 1
  end
end
