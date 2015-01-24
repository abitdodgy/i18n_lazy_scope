# require "rails"

require "i18n_lazy_scope/action_controller/helper"
require "i18n_lazy_scope/action_mailer/helper"
require "i18n_lazy_scope/action_view/helper"

module I18nLazyScope
  class Railtie < Rails::Railtie
    initializer "i18n_lazy_scope.helpers" do
      ActiveSupport.on_load(:action_view) do
        include I18nLazyScope::ActionView::Helper
      end

      ActiveSupport.on_load(:action_controller) do
        include I18nLazyScope::ActionController::Helper
      end

      ActiveSupport.on_load(:action_mailer) do
        include I18nLazyScope::ActionMailer::Helper
      end
    end
  end
end
