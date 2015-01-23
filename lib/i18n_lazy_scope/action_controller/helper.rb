module I18nLazyScope
  module ActionController
    module Helper
      def t_scoped(key, **args)
        t(key, scope, **args)
      end

    private

      def scope
        [:controllers, controller_name, action_name]
      end
    end
  end
end
