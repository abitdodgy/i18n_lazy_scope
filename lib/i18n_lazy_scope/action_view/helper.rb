module I18nLazyScope::ActionView
  module Helper
    def lazy_scope
      raise @virtual_path.to_s
      [:views, controller_name, action_name]
    end
  end
end
