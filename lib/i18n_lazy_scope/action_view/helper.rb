module I18nLazyScope::ActionView
  module Helper
    def t_scoped(key, **args)
      t(key, scope: self.lazy_scope(key), **args)
    end

    def lazy_scope(key)
      [:views, view_path]
    end

    def view_path
      if @virtual_path
        @virtual_path.gsub(%r{/_?}, ".")
      else
        raise "Cannot use t(#{key.inspect}) lazy lookup because path is not available"
      end
    end
  end
end
