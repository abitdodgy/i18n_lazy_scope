module I18nLazyScope::ActionView
  module Helper
    def lazy_scope
      [:views, controller_name, scope_key_by_partial(:hello)]
    end

    def scope_key_by_partial(key)
      if @virtual_path
        @virtual_path.gsub(%r{/_?}, ".") + key.to_s
      else
        raise "Cannot use t(#{key.inspect}) shortcut because path is not available"
      end
    end
  end
end
