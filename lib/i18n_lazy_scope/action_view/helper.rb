module I18nLazyScope
  module ActionView
    module Helper
      def t_scoped(key, **args)
        t(key, i18n_lazy_view_scope, **args)
      end

    private

      def def i18n_lazy_view_scope
        [:views, controller_name, action_name]
      end
    end
  end
end
