module I18nLazyScope
  module ActionView
    module Helper
      def def lazy_scope
        [:views, controller_name, action_name]
      end
    end
  end
end
