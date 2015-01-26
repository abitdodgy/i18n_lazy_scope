class FakeMailer
  include I18nLazyScope::ActionMailer::Helper
  include I18nLazyScope::Helper

  def t(*args)
    I18n.t(*args)
  end

  def mailer_name
    :user_mailer
  end

  def action_name
    :welcome_email
  end
end
