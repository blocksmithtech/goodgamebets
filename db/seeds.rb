# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Team.create!(name: 'AGO Esports', country: 'Poland', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/ago.png') if Rails.env.development?
Team.create!(name: 'Astralis', country: 'Sweden', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/astralis.png') if Rails.env.development?
Team.create!(name: 'FaZe Clan', country: 'Europe', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/envy.png') if Rails.env.development?
Team.create!(name: 'Fnatic', country: 'Swiss', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/faze.png') if Rails.env.development?
Team.create!(name: 'G2 Esports', country: 'France', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/fnatic.png') if Rails.env.development?
Team.create!(name: 'Hellraisers', country: 'Ukraine', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/g2.png') if Rails.env.development?
Team.create!(name: 'Heroic', country: 'Sweden', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/hellraiser.png') if Rails.env.development?
Team.create!(name: 'mousesports', country: 'Europe', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/heroic.png') if Rails.env.development?
Team.create!(name: 'NAVI.GG.BET', country: 'Ukraine', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/ldlc.png') if Rails.env.development?
Team.create!(name: 'Ninjas in Pyjamas', country: 'Swiss', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/mousesports.png') if Rails.env.development?
Team.create!(name: 'North GG.Bet', country: 'Sweden', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/navi.png') if Rails.env.development?
Team.create!(name: 'Space Soldiers', country: 'Turkey', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/ninjas.png') if Rails.env.development?
Team.create!(name: 'Team Envy', country: 'France', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/north.png') if Rails.env.development?
Team.create!(name: 'Team LDLC', country: 'France', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/soldiers.png') if Rails.env.development?
puts 'CREATED EUROPEAN TEAMS'

Game.create(home_team_id: "1", away_team_id: "2", winner_id: "2", played_at: DateTime.new(2018,4,11,18), closes_at: DateTime.new(2018,4,11,20),) if Rails.env.development?
Game.create(home_team_id: "3", away_team_id: "4", winner_id: "3", played_at: DateTime.new(2018,5,15,18), closes_at: DateTime.new(2018,5,15,20),) if Rails.env.development?
Game.create(home_team_id: "5", away_team_id: "6", winner_id: "6", played_at: DateTime.new(2018,5,15,21), closes_at: DateTime.new(2018,5,15,23),) if Rails.env.development?
Game.create(home_team_id: "7", away_team_id: "8", winner_id: "7", played_at: DateTime.new(2018,5,16,18), closes_at: DateTime.new(2018,5,16,20),) if Rails.env.development?
puts 'CREATED SAMPLE GAMES'