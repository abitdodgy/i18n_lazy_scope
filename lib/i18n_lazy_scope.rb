require "i18n_lazy_scope/version"
require "i18n_lazy_scope/railtie" if defined?(Rails)

begin
  require "pry"
rescue LoadError
end

module I18nLazyScope
end
