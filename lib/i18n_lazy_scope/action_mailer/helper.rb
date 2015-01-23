module I18nLazyScope
  module ActionMailer
    module Helper
      def t_scoped(key, **args)
        t(key, scope, **args)
      end

    private

      def scope
        [:mailers, mailer_name, action_name]
      end
    end
  end
end
