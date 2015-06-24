# encoding: utf-8
require 'net/http'
# encoding: utf-8
require 'uri'
# encoding: utf-8

# encoding: utf-8
module Roberts::Slack
# encoding: utf-8
  # Posts a message to Slack making an HTTP call. The token, channel id and bot name are retrieved via .env files.
# encoding: utf-8
  #
# encoding: utf-8
  # @param msg String
# encoding: utf-8
  # @return void
# encoding: utf-8
  def post_message(msg)
# encoding: utf-8
    Net::HTTP.post_form(URI.parse('https://slack.com/api/chat.postMessage'), {
# encoding: utf-8
      'token' => ENV['SLACK_TOKEN'],
# encoding: utf-8
      'channel' => ENV['SLACK_CHANNEL_ID'],
# encoding: utf-8
      'text' => msg,
# encoding: utf-8
      'username' => ENV['SLACK_BOT_NAME']
# encoding: utf-8
    })
# encoding: utf-8
  end
# encoding: utf-8
end
