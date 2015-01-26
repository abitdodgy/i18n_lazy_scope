class FakeController
  include I18nLazyScope::ActionController::Helper
  include I18nLazyScope::Helper

  def t(*args)
    I18n.t(*args)
  end

  def controller_name
    :users
  end

  def action_name
    :show
  end
end
