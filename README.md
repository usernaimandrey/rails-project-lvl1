### Hexlet tests and linter status

[![Actions Status](https://github.com/usernaimandrey/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/usernaimandrey/rails-project-lvl1/actions)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

[![CI](https://github.com/usernaimandrey/rails-project-lvl1/actions/workflows/CI.yml/badge.svg)](https://github.com/usernaimandrey/rails-project-lvl1/actions/workflows/CI.yml)

# HexletCode

This is gem allows you to automatically generate a form in your web application

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

```Bash
bundle install
```

Or install it yourself as:

```Bash
gem install hexlet_code
```

## Usage

```Ruby
requare hexlet_code

User = Struct.new(:name, :job, :gender, keyword_init: true) # create an object with fields
user = User.new name: 'rob', job: 'hexlet', gender: 'm' # add data

HexletCode.form_for user do |f|
  # Checks if there is a value inside name
  f.input :name
  # Checks if there is a value inside job
  f.input :job, as: :text
end
#->
# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
# </form>

```

If the specified field does not exist in the object. then an error occurs

```Ruby
html = HexletCode.form_for user, url: '/users' do |f|
  f.input :name
  f.input :job, as: :text
  # the user does not have an age field
  f.input :age
end
# =>  `public_send': undefined method `age' for #<struct User id=nil, name=nil, job=nil> (NoMethodError)
```

with custom attributes

```Ruby
html = HexletCode.form_for @user1, url: '/users' do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit
    end

# ->
# <form action="/users" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="rob" class="user-input">
#   <label for="job">Job</label>
#   <textarea cols="50" rows="50" name="job">hexlet</textarea>
#   <input name="commit" type="submit" value="Save">
# </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/usernaimandrey/hexlet_code>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/usernaimandrey/hexlet_code/blob/master/CODE_OF_CONDUCT.md).
