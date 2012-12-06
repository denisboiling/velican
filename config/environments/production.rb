Velican::Application.configure do
  config.action_controller.default_url_options = {:host => "belvelikan.ru"}
  config.action_mailer.default_url_options = { :host => "belvelikan.ru" }

  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = true
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.assets.precompile += %w( jquery.endless-scroll.js
                                  noty/jquery.noty.js
                                  noty/layouts/top.js
                                  noty/themes/default
                                )


  # ExceptionNotifier
  config.middleware.use ExceptionNotifier, :email_prefix => "[Notify velican] ",
                                           :sender_address => %{"notify"},
                                           :exception_recipients => %w{ kremenev@balticit.ru }
  config.action_mailer.delivery_method = :sendmail
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
end
