require 'net/http'
require 'uri'

module Roberts::Slack
  # Posts a message to Slack making an HTTP call. The token, channel id and bot name are retrieved via .env files.
  #
  # @param msg String
  # @return void
  def post_message(msg)
    Net::HTTP.post_form(URI.parse('https://slack.com/api/chat.postMessage'), {
      'token' => ENV['SLACK_TOKEN'],
      'channel' => ENV['SLACK_CHANNEL_ID'],
      'text' => msg,
      'username' => ENV['SLACK_BOT_NAME']
    })
  end
end
