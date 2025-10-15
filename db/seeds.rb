puts "Seeding Genres..."
metal = Genre.find_or_create_by!(name: "Metal")
punk  = Genre.find_or_create_by!(name: "Punk")
rock  = Genre.find_or_create_by!(name: "Rock")
pop   = Genre.find_or_create_by!(name: "Pop")
jazz  = Genre.find_or_create_by!(name: "Jazz")
blues = Genre.find_or_create_by!(name: "Blues")

puts "Seeding Styles..."
thrash_metal = Style.find_or_create_by!(name: "Thrash Metal", genre: metal)
black_metal  = Style.find_or_create_by!(name: "Black Metal", genre: metal)
doom_metal   = Style.find_or_create_by!(name: "Doom Metal", genre: metal)
nwobhm       = Style.find_or_create_by!(name: "NWOBHM", genre: metal)
heavy_metal  = Style.find_or_create_by!(name: "Heavy Metal", genre: metal)

punk_rock    = Style.find_or_create_by!(name: "Punk Rock", genre: punk)
hardcore     = Style.find_or_create_by!(name: "Hardcore Punk", genre: punk)
post_punk    = Style.find_or_create_by!(name: "Post-Punk", genre: punk)

classic_rock = Style.find_or_create_by!(name: "Classic Rock", genre: rock)
progressive  = Style.find_or_create_by!(name: "Progressive Rock", genre: rock)
alternative  = Style.find_or_create_by!(name: "Alternative Rock", genre: rock)

synthpop     = Style.find_or_create_by!(name: "Synthpop", genre: pop)
dance_pop    = Style.find_or_create_by!(name: "Dance Pop", genre: pop)
pop_rock     = Style.find_or_create_by!(name: "Pop Rock", genre: pop)

bebop        = Style.find_or_create_by!(name: "Bebop", genre: jazz)
smooth_jazz  = Style.find_or_create_by!(name: "Smooth Jazz", genre: jazz)
fusion       = Style.find_or_create_by!(name: "Jazz Fusion", genre: jazz)

delta_blues   = Style.find_or_create_by!(name: "Delta Blues", genre: blues)
electric_blues = Style.find_or_create_by!(name: "Electric Blues", genre: blues)
chicago_blues  = Style.find_or_create_by!(name: "Chicago Blues", genre: blues)

puts "Seeding Bands..."
metallica      = Band.create!(name: "Metallica", country: "USA", formed_in: 1981, genre: metal, styles: [thrash_metal])
iron_maiden    = Band.create!(name: "Iron Maiden", country: "UK", formed_in: 1975, genre: metal, styles: [nwobhm, heavy_metal])
black_sabbath  = Band.create!(name: "Black Sabbath", country: "UK", formed_in: 1968, genre: metal, styles: [doom_metal, heavy_metal])
slayer         = Band.create!(name: "Slayer", country: "USA", formed_in: 1981, genre: metal, styles: [thrash_metal])

the_clash      = Band.create!(name: "The Clash", country: "UK", formed_in: 1976, genre: punk, styles: [punk_rock])
dead_kennedys  = Band.create!(name: "Dead Kennedys", country: "USA", formed_in: 1978, genre: punk, styles: [hardcore])
joy_division   = Band.create!(name: "Joy Division", country: "UK", formed_in: 1976, genre: punk, styles: [post_punk])

pink_floyd     = Band.create!(name: "Pink Floyd", country: "UK", formed_in: 1965, genre: rock, styles: [progressive, classic_rock])
led_zeppelin   = Band.create!(name: "Led Zeppelin", country: "UK", formed_in: 1968, genre: rock, styles: [classic_rock])
radiohead      = Band.create!(name: "Radiohead", country: "UK", formed_in: 1985, genre: rock, styles: [alternative])

madonna        = Band.create!(name: "Madonna", country: "USA", formed_in: 1979, genre: pop, styles: [dance_pop, pop_rock])
michael_jackson = Band.create!(name: "Michael Jackson", country: "USA", formed_in: 1964, genre: pop, styles: [pop_rock, dance_pop])
depeche_mode   = Band.create!(name: "Depeche Mode", country: "UK", formed_in: 1980, genre: pop, styles: [synthpop])

miles_davis    = Band.create!(name: "Miles Davis", country: "USA", formed_in: 1944, genre: jazz, styles: [bebop, fusion])
john_coltrane  = Band.create!(name: "John Coltrane", country: "USA", formed_in: 1945, genre: jazz, styles: [bebop, fusion])
george_benson  = Band.create!(name: "George Benson", country: "USA", formed_in: 1963, genre: jazz, styles: [smooth_jazz])

bb_king        = Band.create!(name: "B.B. King", country: "USA", formed_in: 1940, genre: blues, styles: [electric_blues, chicago_blues])
muddy_waters   = Band.create!(name: "Muddy Waters", country: "USA", formed_in: 1941, genre: blues, styles: [delta_blues, chicago_blues])
robert_johnson = Band.create!(name: "Robert Johnson", country: "USA", formed_in: 1936, genre: blues, styles: [delta_blues])

puts "Seeding Albums..."
Album.create!([
  {
    title: "Master of Puppets",
    release_year: 1986,
    tracklist: [
      "Battery",
      "Master of Puppets",
      "The Thing That Should Not Be",
      "Welcome Home (Sanitarium)",
      "Disposable Heroes",
      "Leper Messiah",
      "Orion",
      "Damage, Inc."
    ],
    genres: [metal],
    styles: [thrash_metal],
    bands: [metallica]
  },
  {
    title: "Number of the Beast",
    release_year: 1982,
    tracklist: [
      "Invaders",
      "Children of the Damned",
      "The Prisoner",
      "Run to the Hills",
      "Gangland",
      "Hallowed Be Thy Name"
    ],
    genres: [metal],
    styles: [nwobhm, heavy_metal],
    bands: [iron_maiden]
  },
  {
    title: "Black Sabbath",
    release_year: 1970,
    tracklist: [
      "Black Sabbath",
      "The Wizard",
      "Behind the Wall of Sleep",
      "N.I.B.",
      "Evil Woman",
      "Sleeping Village",
      "Warning"
    ],
    genres: [metal],
    styles: [doom_metal, heavy_metal],
    bands: [black_sabbath]
  },
  {
    title: "Reign in Blood",
    release_year: 1986,
    tracklist: [
      "Angel of Death",
      "Piece by Piece",
      "Necrophobic",
      "Altar of Sacrifice",
      "Jesus Saves",
      "Criminally Insane",
      "Reborn",
      "Epidemic",
      "Postmortem"
    ],
    genres: [metal],
    styles: [thrash_metal],
    bands: [slayer]
  },
  {
    title: "London Calling",
    release_year: 1979,
    tracklist: [
      "London Calling",
      "Brand New Cadillac",
      "Jimmy Jazz",
      "Hateful",
      "Clampdown",
      "The Guns of Brixton",
      "Lost in the Supermarket",
      "Spanish Bombs",
      "The Right Profile",
      "Clampdown",
      "Train in Vain"
    ],
    genres: [punk],
    styles: [punk_rock],
    bands: [the_clash]
  },
  {
    title: "Unknown Pleasures",
    release_year: 1979,
    tracklist: [
      "Disorder",
      "Day of the Lords",
      "Candidate",
      "Insight",
      "New Dawn Fades",
      "She's Lost Control",
      "Shadowplay",
      "Wilderness",
      "Interzone",
      "I Remember Nothing"
    ],
    genres: [punk],
    styles: [post_punk],
    bands: [joy_division]
  },
  {
    title: "The Dark Side of the Moon",
    release_year: 1973,
    tracklist: [
      "Speak to Me",
      "Breathe",
      "On the Run",
      "Time",
      "The Great Gig in the Sky",
      "Money",
      "Us and Them",
      "Any Colour You Like",
      "Brain Damage",
      "Eclipse"
    ],
    genres: [rock],
    styles: [progressive, classic_rock],
    bands: [pink_floyd]
  },
  {
    title: "Led Zeppelin IV",
    release_year: 1971,
    tracklist: [
      "Black Dog",
      "Rock and Roll",
      "The Battle of Evermore",
      "Stairway to Heaven",
      "Misty Mountain Hop",
      "Four Sticks",
      "Going to California",
      "When the Levee Breaks"
    ],
    genres: [rock],
    styles: [classic_rock],
    bands: [led_zeppelin]
  }
])

puts "Seeding completed successfully!"

puts "Creating admin user..."
admin = User.find_or_create_by!(
  email_address: "admin@albumtracker.com"
) do |user|
  user.username = "admin"
  user.name = "System Administrator"
  user.password = "admin123"
  user.password_confirmation = "admin123"
  user.role = :admin
end

puts "Admin user created successfully!"
puts "Username: admin"
puts "Email: admin@albumtracker.com"
puts "Password: admin123"