module I18nLazyScope
  module Helper
    def t_scoped(key, **args)
      t(key, scope: lazy_scope, **args)
    end
  end
end
