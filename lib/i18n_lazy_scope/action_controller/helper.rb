module I18nLazyScope
  module ActionController
    module Helper
      def lazy_scope
        [:controllers, controller_name, action_name]
      end
    end
  end
end
