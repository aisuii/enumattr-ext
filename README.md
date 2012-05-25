# Enumattr::Ext

enumattr (https://github.com/aisuii/enumattr) extensions.

## Installation

Add this line to your application's Gemfile:

    gem 'enumattr-ext'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enumattr-ext

## Usage

### example:

Ruby code:

    class User
      include Enumattr::Base
      include Enumattr::Ext::Name

      attr_accessor :status

      enumattr :status do
        enum :active,   1
        enum :inactive, 2
        enum :deleted,  3
      end

      def initialize(status)
        @status = status
      end
    end

I18n locales:

    ja:
      enumattr:
        User:
          status:
            active:   有効
            inactive: 無効
            deleted:  削除

and

    I18n.load_path = ['path/to/locales.yml']
    I18n.locale = :ja

then

    User.status_names
    # => ["有効", "無効", "削除"]

    User.status_name(:active)
    # => "有効"

    User.status_options
    #=> [["有効", 1], ["無効", 2], ["削除", 3]]

    user = User.new(1)
    user.status_name
    # => "有効"

see also: https://github.com/aisuii/enumattr

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
