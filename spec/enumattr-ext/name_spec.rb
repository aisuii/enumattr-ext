# -*- encoding: utf-8 -*-

require 'spec_helper'
require 'user'

describe Enumattr::Ext::Name do
  describe User do
    context "with locales/ja.yml" do
      before do
        examples_dir = File.join(File.dirname(__FILE__), '..', '..', 'examples')
        I18n.locale = :ja
        I18n.load_path = [File.join(examples_dir, 'locales', 'ja.yml')]
      end
    end

    context "with locales/en.yml" do
    end

    context "without locales" do
    end
  end
end
