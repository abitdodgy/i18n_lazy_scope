# I18nLazyScope

I18nLazyScope is a tiny library that lets you use lazy lookup and custom scoping in your locale files when localising strings in your Ruby applications. This means quicker translations without sacrificing the structure of your locale files.

The library inserts a customisable namespace in the scope for you, just below the locale. The following table illustrates the difference between I18nLazyLookup and Rails when resolving lazy lookup keys.

|             | I18nLazyLookup                                       | Rails/I18n Lazy Lookup
| ------------|------------------------------------------------------|------------------------------------------|
| Controllers | `locale.controllers.controller_name.action_name.key` | `locale.controller_name.action_name.key` |
| Mailers     | `locale.mailers.mailer_name.action_name.key`         | `locale.mailer_name.action_name.key`     |
| Views       | `locale.views.template_or_partial_path.key`          | `locale.template_or_partial_path.key`    |


## What's Lazy Lookup?

[Lazy lookup][1] is a feature that ships with Rails and the [I18n][3] gem. It allows you to translate strings without explicitly qualifying their entire scope. For example, consider the following code that lives in `show.html.erb` inside `app/views/users`, and that your application's locale is English.

```erb
<%= t('.welcome_message') %>
```

Rails automatically converts `.welcome_message` to `en.users.show.welcome_message`. This saves you from having to type `users.show`, which is handy if you have lots of translations. But it forces you structure your locale files the way Rails prefers.

```yaml
en:
  users:
    show:
      welcome_message: "You are such a star!"
```

The above structure can get messy because `en.users` can refer to a view or a controller, and it feels wrong for `users` to be floating under the top level namespace. Most developers prefer to keep their translations under a scope.

```yaml
en:
  controllers:
    users:
      show:
        success: "Yay!"
  views:
    users:
      show:
        welcome_message: "Yay!"
```

So applications with lots of translations will find it hard to take advantage of lazy lookup. Wouldn't it be great if you could use lazy lookup and a custom namespace? Well, now you can.

```erb
<%= t_scoped('welcome_message') %>
```

The `scoped_t` method will automatically convert `welcome_message` to `en.views.show.welcome_message`. And you can customise the `views` part of the scope to anything you like. Your locale file would contain the `views` namespace to keep view translations organised as demonstrated above.

I18nLazyScope provides a wrapper method around the `translate` and `t` methods in Rails and the Ruby I18n gem.


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

Call the `t_scoped` method instead of `t`, or `translate`, and make sure you have the corresponding keys in your locale files. Say you are in `app/views/users/show.html.erb`.

```erb
<%= t_scoped 'greeting' %>
```

```yaml
en:
  views:
    users:
      show:
       greeting: "Hello!"
```

The library inserts a top level name in the scope for you. Here are the defaults:

1. Conrollers: `locale.controllers.controller_name.action_name.key`
2. Mailers: `locale.mailers.mailer_name.action_name.key`
3. Views: `locale.views.template_or_partial_path.key`

### Customising the Namespace

I18nLazyScope accepts a configuration block. This is an example that you might put into a Rails initializer at `config/initializers/i18n_lazy_scope.rb`:

```ruby
I18nLazyScope.configure do |config|
  # Resolves lazy lookup to `locale.my.custom.scope.controller_name.action_name.key`
  config.action_controller_scope = [:my, :custom, :scope]
  # Resolves lazy lookup to `locale.my.custom.scope.mailer_name.action_name.key`
  config.action_mailer_scope     = [:my, :custom, :scope]
  # Resolves lazy lookup to `locale.my.custom.scope.template_or_partial_path.key`
  config.action_view_scope       = [:my, :custom, :scope]
end
```

### Interpolation

It works exactly as it would if you call `t` or `translate`.

```erb
<%= t_scoped 'greeting', name: @user.name %>
```

```yaml
en:
  views:
    users:
      show:
       greeting: "Hello, %{name}!"
```

### A Note on Scoping

If you have to customise the scope on individual basis, then you should use `t` and `translate` that ship with Rails or the [I18n][3] gem. Scoping on individual basis defeates the point of this gem. This gem isn't meant to replace the I18n; it's a tiny wrapper that depends on it.

## API

```ruby
t_scoped(key, **args)
```

## A Note on Ruby Versions

I18nLazyScope requires Ruby 2.0 because it uses the [double splat `**` operator][2] to capture all keyword arguments.

## Version

I18nLazyScope uses semantic versioning.

## Contributing

1. Fork it ( https://github.com/abitdodgy/i18n_lazy_scope/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[1]: http://guides.rubyonrails.org/i18n.html#lazy-lookup
[2]: http://stackoverflow.com/questions/18289152/what-does-a-double-splat-operator-do
[3]: https://github.com/svenfuchs/rails-i18n
