module I18nLazyScope
  module ActionMailer
    module Helper
      def lazy_scope
        [:mailers, mailer_name, action_name]
      end
    end
  end
end
