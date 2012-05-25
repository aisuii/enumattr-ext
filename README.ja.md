# Enumattr::Ext

enumattr (https://github.com/aisuii/enumattr) のエクステンションです。

## 導入

bundler を利用しているなら、Gemfile に以下の行を加え、

    gem 'enumattr-ext'

以下のコマンドを実行します。

    $ bundle

あるいは自身でインストールすることもできます。

    $ gem install enumattr-ext

## 使い方

### 例:

Ruby のコードで以下のように書いて、

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

I18n の locales を以下のように用意して、

    ja:
      enumattr:
        User:
          status:
            active:   有効
            inactive: 無効
            deleted:  削除

I18n のロードパスにいれます。
(Rails なら置くべきところに置いて、Rails から見えるようになっていればよい)

    I18n.load_path = ['path/to/locales.yml']
    I18n.locale = :ja

すると、以下のようなクラスメソッドとインスタンスメソッドが定義されます。

    User.status_names
    # => ["有効", "無効", "削除"]

    User.status_name(:active)
    # => "有効"

    User.status_options
    #=> [["有効", 1], ["無効", 2], ["削除", 3]]

    user = User.new(1)
    user.status_name
    # => "有効"

素の enumattr で既に用意されているものについては https://github.com/aisuii/enumattr/blob/master/README.ja.md を参照してください。

## その他の例

_examples/*.rb_ と _spec/enumattr-ext/*.rb_ を参照してください。

## ご意見・ご指導

ご意見やご指導よろしくおねがいします。

1. Fork して
2. feature branch を作って (`git checkout -b my-new-feature`)
3. コミットして (`git commit -am 'Added some feature'`)
4. branch を push して (`git push origin my-new-feature`)
5. Pull Request してください
