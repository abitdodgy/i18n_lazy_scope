# I18nLazyScope

I18nLazyScope is a small library that lets you use lazy lookup with custom scopes in your locale files.

It inserts a customisable namespace in the scope, just below the locale. The following table illustrates the difference between I18nLazyLookup and the default [i18n-rails][3] behaviour.

|             | I18nLazyLookup                                  | Rails/I18n Lazy Lookup
|-------------|-------------------------------------------------|---------------------------------------|
| Controllers | `locale.controllers.controller_name.action.key` | `locale.controller_name.action.key`   |
| Mailers     | `locale.mailers.mailer_name.action.key`         | `locale.mailer_name.action.key`       |
| Views       | `locale.views.template_or_partial_path.key`     | `locale.template_or_partial_path.key` |


## What's Lazy Lookup?

[Lazy lookup][1] is a feature built into the [I18n][3] gem. It allows you to use translations without explicitly qualifying their scope. For example, consider the following code that lives in `app/views/users/show.html.erb`.

```erb
<%= t('.welcome_message') %>
```

Rails automatically converts `.welcome_message` to `en.users.show.welcome_message`. This saves you from having to type `users.show`, which is handy if you have lots of translations. But it forces you to structure your locale files the way Rails prefers.

```yaml
en:
  users:
    show:
      welcome_message: "You are such a star!"
```

Sometimes the above structure is not ideal. This is because `en.users` refers to both views and controllers. Other times it might be better to scope `users` under a namespace instead of having it under the top level namespace.

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

Large applications with lots of translations might find it hard to take advantage of lazy lookup. Wouldn't it be great if you could use lazy lookup with a custom namespace? Well, now you can.

```erb
<%= t_scoped(:welcome_message) %>
```

`t_scoped` converts `welcome_message` to `en.views.show.welcome_message`, or whatever namespace you specified in your initializer. It's a wrapper method around Rails' `translate` and its alias `t`.


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

Use `t_scoped` instead of `t` or `translate`, and make sure you add the corresponding keys in your locale files.

```erb
<!-- app/views/users/show.html.erb -->
<%= t_scoped :greeting %>
```

```yaml
# config/locales/en.yml
en:
  views:
    users:
      show:
       greeting: "Hello!"
```

### Customising the Namespace

By default, the library uses the following namespaces:

1. Controllers: `locale.controllers.controller_name.action_name.key`
2. Mailers: `locale.mailers.mailer_name.action_name.key`
3. Views: `locale.views.template_or_partial_path.key`

Add an initializer with a configuration block to customise the namespaces.

```ruby
# config/initializers/i18n_lazy_scope.rb
I18nLazyScope.configure do |config|
  # Resolves lazy lookup to `locale.custom.scope.controller_name.action_name.key`
  config.action_controller_scope = [:custom, :scope]
  # ... `locale.my.custom.scope.mailer_name.action_name.key`
  config.action_mailer_scope     = [:custom, :scope]
  # ... `locale.my.custom.scope.template_or_partial_path.key`
  config.action_view_scope       = [:custom, :scope]
end
```

### Interpolation

Interpolation works exactly as it would if you call `t` or `translate`.

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

If you find that you have to customise the scope on an individual basis, you should use `t` and `translate` that ship with Rails or the [I18n][3] gem. Scoping on individual basis defeats the point of this gem.

## API

```ruby
t_scoped(key, **args)
```

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
