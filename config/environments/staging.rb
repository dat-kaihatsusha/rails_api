require Rails.root.join("config/environments/production")

Rails.application.configure do
  config.log_level = :debug
  # Permit cross origin
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "staging.seesaa.co.jp"
      resource "*",
        headers: :any,
        methods: [:get, :post, :patch, :delete, :options]
    end
  end
end