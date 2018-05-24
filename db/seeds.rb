
if AdminUser.count == 0
  user = CreateAdminService.new.call
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
  puts 'CREATED ADMIN USER: ' << user.email
end

if Team.count == 0
  ago = Team.create!(name: 'AGO Esports', country: 'Poland', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/ago.png')
  ast = Team.create!(name: 'Astralis', country: 'Sweden', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/astralis.png')
  faze = Team.create!(name: 'FaZe Clan', country: 'Europe', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/faze.png')
  fnatic = Team.create!(name: 'Fnatic', country: 'Swiss', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/fnatic.png')
  g2 = Team.create!(name: 'G2 Esports', country: 'France', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/g2.png')
  hr = Team.create!(name: 'Hellraisers', country: 'Ukraine', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/hellraiser.png')
  hc = Team.create!(name: 'Heroic', country: 'Sweden', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/heroic.png')
  ms = Team.create!(name: 'mousesports', country: 'Europe', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/mousesports.png')
  navi = Team.create!(name: 'NAVI.GG.BET', country: 'Ukraine', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/navi.png')
  np = Team.create!(name: 'Ninjas in Pyjamas', country: 'Swiss', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/ninjas.png')
  north = Team.create!(name: 'North GG.Bet', country: 'Sweden', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/north.png')
  space = Team.create!(name: 'Space Soldiers', country: 'Turkey', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/soldiers.png')
  envy = Team.create!(name: 'Team Envy', country: 'France', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/envy.png')
  ldlc = Team.create!(name: 'Team LDLC', country: 'France', logo: 'https://s3-eu-west-1.amazonaws.com/goodgametoken/team_icons/eu/ldlc.png')
  puts 'CREATED EUROPEAN TEAMS'
end

if Game.count == 0
  Game.create(home_team_id: ms.id,away_team_id: space.id,home_score: "16",away_score: "14",state: 2, winner_id: ms.id,played_at: DateTime.new(2018,4,24,18),closes_at: DateTime.new(2018,4,24,20), stream_url: "https://www.youtube.com/watch?v=BLT7lqQKx3Q",)
  Game.create(home_team_id: space.id,away_team_id: ms.id,home_score: "11",away_score: "16",state: 2, winner_id: ms.id,played_at: DateTime.new(2018,4,24,18),closes_at: DateTime.new(2018,4,24,20), stream_url: "https://www.youtube.com/watch?v=8aGMfd-gpHU",)
  Game.create(home_team_id: ago.id,away_team_id: fnatic.id ,home_score: "16",away_score: "14",state: 2, winner_id: ago.id,played_at: DateTime.new(2018,4,24,18),closes_at: DateTime.new(2018,4,24,20), stream_url: "https://www.youtube.com/watch?v=skcFPlZQy8I",)
  Game.create(home_team_id: fnatic.id ,away_team_id: ago.id,home_score: "16",away_score: "11",state: 2, winner_id: fnatic.id ,played_at: DateTime.new(2018,4,24,18),closes_at: DateTime.new(2018,4,24,20), stream_url: "https://www.youtube.com/watch?v=y16VAudiIuQ",)
  Game.create(home_team_id: hc.id,away_team_id: fnatic.id ,home_score: "25",away_score: "22",state: 2, winner_id: hc.id,played_at: DateTime.new(2018,4,25,18),closes_at: DateTime.new(2018,4,25,20), stream_url: "https://www.youtube.com/watch?v=8XLh5pGu8RU",)
  Game.create(home_team_id: fnatic.id ,away_team_id: hc.id,home_score: "13",away_score: "16",state: 2, winner_id: hc.id,played_at: DateTime.new(2018,4,25,18),closes_at: DateTime.new(2018,4,25,20), stream_url: "https://www.youtube.com/watch?v=zKYwEPtkl-o",)
  Game.create(home_team_id: navi.id,away_team_id: ast.id,home_score: "16",away_score: "9",state: 2, winner_id: navi.id,played_at: DateTime.new(2018,4,26,18),closes_at: DateTime.new(2018,4,26,20), stream_url: "https://www.youtube.com/watch?v=YZ1bAIS4HeE",)
  Game.create(home_team_id: fnatic.id ,away_team_id: fnatic.id ,home_score: "5",away_score: "16",state: 2, winner_id: faze.id,played_at: DateTime.new(2018,4,26,18),closes_at: DateTime.new(2018,4,26,20), stream_url: "https://www.youtube.com/watch?v=dmsac9e8_6g",)
  Game.create(home_team_id: fnatic.id ,away_team_id: hr.id,home_score: "8",away_score: "16",state: 2, winner_id: hr.id,played_at: DateTime.new(2018,4,26,18),closes_at: DateTime.new(2018,4,26,20), stream_url: "https://www.youtube.com/watch?v=bcFyab0koQM",)
  Game.create(home_team_id: space.id,away_team_id: ast.id,home_score: "11",away_score: "16",state: 2, winner_id: ast.id,played_at: DateTime.new(2018,4,26,18),closes_at: DateTime.new(2018,4,26,20), stream_url: "https://www.youtube.com/watch?v=99rOjpcwPrk",)
  puts 'CREATED PAST GAMES'

  Game.create(home_team_id: faze.id,away_team_id: ast.id, state: 0, played_at: DateTime.new(2018,5,24,18),closes_at: DateTime.new(2018,5,24,17),)
  Game.create(home_team_id: space.id,away_team_id: fnatic.id , state: 0, played_at: DateTime.new(2018,5,24,18),closes_at: DateTime.new(2018,5,24,17),)
  puts 'CREATED CURRENT GAMES'

  Game.create(home_team_id: ago.id,away_team_id: g2.id, state: 0, played_at: DateTime.new(2018,6,3,18),closes_at: DateTime.new(2018,6,3,17),)
  Game.create(home_team_id: np.id,away_team_id: envy.id, state: 0, played_at: DateTime.new(2018,6,3,18),closes_at: DateTime.new(2018,6,3,17),)
  Game.create(home_team_id: ms.id,away_team_id: hr.id, state: 0, played_at: DateTime.new(2018,6,3,18),closes_at: DateTime.new(2018,6,3,17),)
  puts 'CREATED FUTURE GAMES'
end
