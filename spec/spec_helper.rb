require "i18n_lazy_scope/action_controller/helper"
require "i18n_lazy_scope/action_mailer/helper"
require "i18n_lazy_scope/action_view/helper"

require "i18n_lazy_scope/helper"

require "i18n"

RSpec.configure do |config|
  config.before :all do
    I18n.load_path = [[File.dirname(__FILE__) + '/support/en.yml']]
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
