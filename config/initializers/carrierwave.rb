  CarrierWave.configure do |config|
    config.storage = :file
    config.root = "#{::Rails.root}/app/assets/images"
    config.store_dir = "uploads"
    config.asset_host = ActionController::Base.asset_host
  end
