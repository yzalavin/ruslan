require 'telegram/bot'

class Ted
  attr_reader :bot

  def perform
    loop do
      update_flats
      sleep 300
      send_message 'I am still alive!'
    end
  end

  private

  def update_flats
    telegram_bot do |bot|
      @bot = bot
      Parser::OLX.new.new_flats.each { |f| send_message(f) }
    end
  end

  def send_message(f)
    bot.api.sendMessage(
      chat_id: config[:development_chat],
      text: f
    )
  end

  def telegram_bot
    Telegram::Bot::Client.run(config[:token]) do |bot|
      yield(bot)
    end
  end

  def config
    YAML.load_file('config/telegram.yml').deep_symbolize_keys
  end
end
