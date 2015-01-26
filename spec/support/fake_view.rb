class FakeView
  include I18nLazyScope::ActionView::Helper
  include I18nLazyScope::Helper

  def initialize
    @virtual_path = 'users.show.user_profile'
  end

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
