module I18nLazyScope
  class Configuration
    attr_accessor :action_controller_scope, :action_mailer_scope, :action_view_scope

    def initialize
      @action_controller_scope = [:controllers]
      @action_mailer_scope = [:mailers]
      @action_view_scope = [:views]
    end
  end
end
