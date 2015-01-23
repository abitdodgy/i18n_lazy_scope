module I18nLazyScope
  module ActionView
    module Helper
      def t_scoped(key, **args)
        t(key, scope, **args)
      end

    private

      def scope
        [:views, controller_name, action_name]
      end
    end
  end
end
