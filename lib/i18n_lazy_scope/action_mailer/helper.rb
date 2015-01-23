module I18nLazyScope
  module ActionMailer
    module Helper
      def t_scoped(key, **args)
        t(key, scope: lazy_scope, **args)
      end

    private

      def lazy_scope
        [:mailers, mailer_name, action_name]
      end
    end
  end
end
