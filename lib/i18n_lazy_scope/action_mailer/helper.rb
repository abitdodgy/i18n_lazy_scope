module I18nLazyScope::ActionMailer
  module Helper
    def lazy_scope
      [*I18nLazyScope.configuration.action_mailer_scope, mailer_name, action_name]
    end
  end
end
