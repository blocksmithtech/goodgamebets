# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call

if AdminUser.count == 0
	puts 'CREATED ADMIN USER: ' << user.email
	AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end

if Team.count == 0
	Team.create!(name: 'AGO Esports', country: 'Poland', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/ago.png')
	Team.create!(name: 'Astralis', country: 'Sweden', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/astralis.png')
	Team.create!(name: 'FaZe Clan', country: 'Europe', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/faze.png')
	Team.create!(name: 'Fnatic', country: 'Swiss', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/fnatic.png')
	Team.create!(name: 'G2 Esports', country: 'France', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/g2.png')
	Team.create!(name: 'Hellraisers', country: 'Ukraine', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/hellraiser.png')
	Team.create!(name: 'Heroic', country: 'Sweden', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/heroic.png')
	Team.create!(name: 'mousesports', country: 'Europe', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/mousesports.png')
	Team.create!(name: 'NAVI.GG.BET', country: 'Ukraine', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/navi.png')
	Team.create!(name: 'Ninjas in Pyjamas', country: 'Swiss', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/ninjas.png')
	Team.create!(name: 'North GG.Bet', country: 'Sweden', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/north.png')
	Team.create!(name: 'Space Soldiers', country: 'Turkey', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/soldiers.png')
	Team.create!(name: 'Team Envy', country: 'France', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/envy.png')
	Team.create!(name: 'Team LDLC', country: 'France', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/ldlc.png')
	puts 'CREATED EUROPEAN TEAMS'
end

if Game.count == 0
	Game.create(home_team_id: "7",away_team_id: "11",home_score: "16",away_score: "14",state: 2, winner_id: "7",played_at: DateTime.new(2018,4,24,18),closes_at: DateTime.new(2018,4,24,20), stream_url: "https://www.youtube.com/watch?v=BLT7lqQKx3Q",)
	Game.create(home_team_id: "11",away_team_id: "7",home_score: "11",away_score: "16",state: 2, winner_id: "7",played_at: DateTime.new(2018,4,24,18),closes_at: DateTime.new(2018,4,24,20), stream_url: "https://www.youtube.com/watch?v=8aGMfd-gpHU",)
	Game.create(home_team_id: "0",away_team_id: "3",home_score: "16",away_score: "14",state: 2, winner_id: "0",played_at: DateTime.new(2018,4,24,18),closes_at: DateTime.new(2018,4,24,20), stream_url: "https://www.youtube.com/watch?v=skcFPlZQy8I",)
	Game.create(home_team_id: "3",away_team_id: "0",home_score: "16",away_score: "11",state: 2, winner_id: "3",played_at: DateTime.new(2018,4,24,18),closes_at: DateTime.new(2018,4,24,20), stream_url: "https://www.youtube.com/watch?v=y16VAudiIuQ",)
	Game.create(home_team_id: "6",away_team_id: "3",home_score: "25",away_score: "22",state: 2, winner_id: "6",played_at: DateTime.new(2018,4,25,18),closes_at: DateTime.new(2018,4,25,20), stream_url: "https://www.youtube.com/watch?v=8XLh5pGu8RU",)
	Game.create(home_team_id: "3",away_team_id: "6",home_score: "13",away_score: "16",state: 2, winner_id: "6",played_at: DateTime.new(2018,4,25,18),closes_at: DateTime.new(2018,4,25,20), stream_url: "https://www.youtube.com/watch?v=zKYwEPtkl-o",)
	Game.create(home_team_id: "8",away_team_id: "1",home_score: "16",away_score: "9",state: 2, winner_id: "8",played_at: DateTime.new(2018,4,26,18),closes_at: DateTime.new(2018,4,26,20), stream_url: "https://www.youtube.com/watch?v=YZ1bAIS4HeE",)
	Game.create(home_team_id: "3",away_team_id: "3",home_score: "5",away_score: "16",state: 2, winner_id: "FaZe",played_at: DateTime.new(2018,4,26,18),closes_at: DateTime.new(2018,4,26,20), stream_url: "https://www.youtube.com/watch?v=dmsac9e8_6g",)
	Game.create(home_team_id: "3",away_team_id: "5",home_score: "8",away_score: "16",state: 2, winner_id: "HR",played_at: DateTime.new(2018,4,26,18),closes_at: DateTime.new(2018,4,26,20), stream_url: "https://www.youtube.com/watch?v=bcFyab0koQM",)
	Game.create(home_team_id: "11",away_team_id: "1",home_score: "11",away_score: "16",state: 2, winner_id: "1",played_at: DateTime.new(2018,4,26,18),closes_at: DateTime.new(2018,4,26,20), stream_url: "https://www.youtube.com/watch?v=99rOjpcwPrk",)
	puts 'CREATED PAST GAMES'

	Game.create(home_team_id: "2",away_team_id: "1", state: 0, played_at: DateTime.new(2018,5,26,18),closes_at: DateTime.new(2018,5,24,20),)
	Game.create(home_team_id: "11",away_team_id: "3", state: 0, played_at: DateTime.new(2018,5,26,18),closes_at: DateTime.new(2018,5,24,20),)
	puts 'CREATED CURRENT GAMES'

	Game.create(home_team_id: "0",away_team_id: "4", state: 0, played_at: DateTime.new(2018,6,30,18),closes_at: DateTime.new(2018,6,3,20),)
	Game.create(home_team_id: "9",away_team_id: "12", state: 0, played_at: DateTime.new(2018,6,30,18),closes_at: DateTime.new(2018,6,3,20),)
	Game.create(home_team_id: "7",away_team_id: "5", state: 0, played_at: DateTime.new(2018,6,30,18),closes_at: DateTime.new(2018,6,3,20),)
	puts 'CREATED FUTURE GAMES'
end
