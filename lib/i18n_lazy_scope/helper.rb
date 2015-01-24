require "i18n_lazy_scope/action_controller/helper"
require "i18n_lazy_scope/action_mailer/helper"
require "i18n_lazy_scope/action_view/helper"

module I18nLazyScope
  module Helper
    include I18nLazyScope::ActionController::Helper
    include I18nLazyScope::ActionMailer::Helper
    include I18nLazyScope::ActionView::Helper

    def t_scoped(key, **args)
      t(key, scope: lazy_scope, **args)
    end
  end
end
