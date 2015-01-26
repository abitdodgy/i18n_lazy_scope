require "i18n_lazy_scope/version"
require "i18n_lazy_scope/configuration"

require "i18n_lazy_scope/railtie" if defined?(Rails)

begin
  require "pry"
rescue LoadError
end

module I18nLazyScope
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
