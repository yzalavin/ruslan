require 'telegram/bot'

class Ted
  attr_reader :bot

  def perform
    telegram_bot do |bot|
      @bot = bot
      send_message
    end
  end

  private

  def send_message
    bot.api.sendMessage(
      chat_id: config[:development_chat],
      text: 'http://olx.ua/obyavlenie/sdam-4komnatnuyu-kvartiru-15km-ot-kieva-IDl4EiY.html#b2d914b319'
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
