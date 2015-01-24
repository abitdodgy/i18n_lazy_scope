# I18nLazyScope

I18nLazyScope is a tiny library that lets you use lazy lookup and keep a better structure for your locale files when localising strings in your Ruby applications. This means quicker translations without sacrificing the structure of your locale files.

```ruby
# users_controller#create
redirect_to @user, notice: scoped_t('welcome_message')
```

```yaml
en:
  controllers: # <- Oh, look, it's a controller scope with lazy lookup! Yay!
    users:
      create:
        welcome_message: "You are such a star!"
```

I18nLazyScope provides a wrapper method around the `translate` and `t` methods in Rails and the Ruby [I18n][3] gem.

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

Oh dear! This is an awful way to structure translations. You want to scope them instead. You create a key in your locale file.

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

Holy Semantics, Batman! `controllers.users.create` is a lot to type before each key name. And after some time you tire of typing it repeatedly. You read the documentation and discover [lazy lookup][1]--brilliant. You decide to use it, and diligently place a dot before your key name.

```ruby
redirect_to @user, notice: t('.welcome_message')
```

Soon after, when testing, you discover that you have a `translation missing` error in your template. This is because lazy lookup will scope the translation to `en.users.create.welcome_message`. The neat `controller` namespace we created is missing.

You have two choices:

1. Change the structure of your locale file to match how lazy lookup works.
2. Use verbose, fully qualified scopes.

Option one might cause your locale file to become a mess, or worse, cause namespace collisions because views and controllers share part of the namespace: `en.users`. And option two is annoying to type all the time.

**I18nLazyScope** lets you use lazy lookup and keep a better structure for your locale files.

```erb
redirect_to @user, notice: scoped_t('welcome_message')

```

```yaml
en:
  controllers: # or mailers, views, or, whatever you want
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

Call the `t_scoped` method instead of `t`, or `translate`, and make sure you have the corresponding keys in your locale file. Say you are in `app/views/users/show.html.erb`.

```erb
<%= t_scoped 'weclome' %>
```

```yaml
en:
  views:
    users:
      show:
       greeting: "Hello!"
```

### Interpolation

It works exactly as it would if you call `t` or `translate`.

```erb
<%= t_scoped 'weclome', name: @user.name %>
```

```yaml
en:
  views:
    users:
      show:
       greeting: "Hello, %{name}!"
```

### Scoping

If you have to customise the scope on individual basis, then you should use `t` and `translate` that ship with the [I18n][3] gem. Scoping on individual basis defeates the point of this gem. This gem isn't meant to replace the I18n; it's a tiny wrapper that depends on it. But in future releases you will be able to customise top level namespaces, such as `views`, `controllers`, `mailers`, etc.

## API

```ruby
t_scoped(key, **args)
```

## A Note on Ruby Versions

I18nLazyScope requires Ruby 2.0 because it uses the [double splat `**` operator][2] to capture all keyword arguments.

## Contributing

1. Fork it ( https://github.com/abitdodgy/i18n_lazy_scope/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[1]: http://guides.rubyonrails.org/i18n.html#lazy-lookup
[2]: http://stackoverflow.com/questions/18289152/what-does-a-double-splat-operator-do
[3]: https://github.com/svenfuchs/rails-i18n
