module I18nLazyScope
  module ActionController
    module Helper
      def t_scoped(key, **args)
        t(key, i18n_lazy_controller_scope, **args)
      end

    private

      def i18n_lazy_controller_scope
        [:controllers, controller_name, action_name]
      end
    end
  end
end
