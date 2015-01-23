module I18nLazyScope
  module ActionMailer
    module Helper
      def t_scoped(key, **args)
        t(key, i18n_lazy_mailer_scope, **args)
      end

    private

      def i18n_lazy_mailer_scope
        [:mailers, mailer_name, action_name]
      end
    end
  end
end
