module TimeFormatSandbox
  class Application < Rails::Application
    # ...

    # タイムゾーンを日本時間に設定
    config.time_zone = 'Asia/Tokyo'
  end
end