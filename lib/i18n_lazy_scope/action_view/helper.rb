module I18nLazyScope::ActionView
  module Helper
    def lazy_scope
      [:views, controller_name, action_name]
    end
  end
end
