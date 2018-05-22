require 'uri'

module GamesHelper

  def video_provider(url)
    uri = URI.parse(url)
    uri.host
  end

  def parse_twitch_video_id(url)
    uri = URI.parse(url)
    uri.path.split('/').last
  end

  def twitch_channel?(url)
    uri = URI.parse(url)
    !uri.path.split('/').include?('videos')
  end

  def parse_youtube_video_id(url)
    uri = URI.parse(url)
    uri.query.split('&').each do |param|
      key, value = param.split('=')
      return value if key == 'v'
    end
  end
end
