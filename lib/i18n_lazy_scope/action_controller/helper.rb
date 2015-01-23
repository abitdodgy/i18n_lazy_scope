module I18nLazyScope
  module ActionController
    module Helper
      def t_scoped(key, **args)
        t(key, scope: lazy_scope, **args)
      end

    private

      def lazy_scope
        [:controllers, controller_name, action_name]
      end
    end
  end
end
