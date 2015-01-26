module I18nLazyScope::ActionController
  module Helper
    def lazy_scope
      [*I18nLazyScope.configuration.action_controller_scope, controller_name, action_name]
    end
  end
end
