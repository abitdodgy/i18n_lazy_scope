# I18nLazyScope

I18nLazyScope lets you use lazy lookup and keep a better structure for your locale files when localising strings in your Ruby on Rails application. This means quicker translations without sacrificing the structure of your locale files.

```ruby
redirect_to @user, notice: scoped_t(:welcome_message)
```

```yaml
en:
  controllers: # <- Oh, look, it's a controller scope with lazy lookup! Yay!
    users:
      create:
        welcome_message: "You are such a star!"
```

## What Problem Does This Solve

Imagine you are in the `users_controller#show` action, and you want to flash a localised welcome message.

```ruby
def create
  if @user.save
    redirect_to @user, notice: t('welcome_message')
  end
end
```

This scopes the translation to `locale.welcome_message`. If your current--or default--locale is English, the corresponding key in your locale file would be `en.welcome_message`.

This is an awful way to structure translations. You want to scope them instead. You create a key in your locale file.

```yaml
en:
  controllers:
    users:
      create:
        welcome_message: "You are such a star!"
```

And you add the key to your code.

```ruby
redirect_to @user, notice: t('controllers.users.create.welcome_message')
```

Great. But after some time you tire of typing `controllers.users.create.welcome_message` repeatedly. You read the documentation and discover [lazy lookup][1]--brilliant. You decide to use it.

```ruby
redirect_to @user, notice: t('.welcome_message')
```

Soon after, when testing, you discover that you have a `translation missing` error in your template. This is because lazy lookup will scope the translation to `en.users.create.welcome_message`. The neat `controller` namespace we created is missing.

You have two choices:

1. Change the structure of your locale file to match how lazy lookup works.
2. Use verbose, fully qualified scopes.

Option one might cause your locale file to become a mess, or worse, cause namespace collisions because view, controller, mailer,--etc...--translations share part of the scope: `en.users.action.key`. Optional two is annoying to type all the time.

I18nLazyScope lets you use lazy lookup and keep a better structure for your locale files.

```erb
redirect_to @user, notice: scoped_t(:welcome_message)

```

```yaml
en:
  controllers: # or mailers, views, etc.
    users:
      create:
        welcome_message: "You are such a star!"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'i18n_lazy_scope'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n_lazy_scope

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/i18n_lazy_scope/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
