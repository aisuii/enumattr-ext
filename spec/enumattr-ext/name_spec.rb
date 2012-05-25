# -*- encoding: utf-8 -*-

require 'spec_helper'
require 'user'
require 'admin_user'
require 'anonymous'

describe Enumattr::Ext::Name do
  context "use I18n name when locale file and enum :keyword, value, name" do
    before do
      I18n.load_path = Dir[File.join(File.dirname(__FILE__), '../../examples/locales/*.yml')]
    end

    describe "class methods" do
      subject { User }

      context "locale :ja" do
        before { I18n.locale = :ja }
        its(:status_names) { should == ["有効", "無効", "削除"] }
        its(:status_options) { should == [["有効", 1], ["無効", 2], ["削除", 3]] }
        describe 'status_name(:active)' do
          it 'should == "有効"' do
            subject.status_name(:active).should == "有効"
          end
        end
      end

      context "locale :en" do
        before { I18n.locale = :en }
        its(:status_names) { should == ["activated status", "inacitive status", "deleted status"] }
        its(:status_options) { should == [["activated status", 1], ["inacitive status", 2], ["deleted status", 3]] }
        describe 'status_name(:active)' do
          it 'should == "activated status"' do
            subject.status_name(:active).should == "activated status"
          end
        end
      end
    end

    describe "instance methods" do
      subject { User.new(User.status_value(:active)) }

      context "locale :ja" do
        before { I18n.locale = :ja }
        its(:status_name) { should == "有効" }
      end

      context "locale :en" do
        before { I18n.locale = :en }
        its(:status_name) { should == "activated status" }
      end
    end
  end

  context "use enum name when no locale file and enum :keyword, value, name" do
    describe "class methods" do
      subject { AdminUser }

      context "locale :ja" do
        before { I18n.locale = :ja }
        its(:status_names) { should == ['activated', 'disabled', 'deleted'] }
        its(:status_options) { should == [["activated", 1], ["disabled", 2], ["deleted", 3]] }
        describe 'status_name(:active)' do
          it 'should == "activated"' do
            subject.status_name(:active).should == "activated"
          end
        end
      end

      context "locale :en" do
        before { I18n.locale = :en }
        its(:status_names) { should == ['activated', 'disabled', 'deleted'] }
        its(:status_options) { should == [["activated", 1], ["disabled", 2], ["deleted", 3]] }
        describe 'status_name(:active)' do
          it 'should == "activated"' do
            subject.status_name(:active).should == "activated"
          end
        end
      end
    end

    describe "instance methods" do
      subject { AdminUser.new(AdminUser.status_value(:active)) }

      context "locale :ja" do
        before { I18n.locale = :ja }
        its(:status_name) { should == 'activated' }
      end

      context "locale :en" do
        before { I18n.locale = :en }
        its(:status_name) { should == 'activated' }
      end
    end
  end

  context "use keyword.to_s when no locale file and enum :keyword, value" do
    describe "class methods" do
      subject { Anonymous }

      context "locale :ja" do
        before { I18n.locale = :ja }
        its(:status_names) { should == ['active', 'inactive', 'deleted'] }
        its(:status_options) { should == [["active", 1], ["inactive", 2], ["deleted", 3]] }
        describe 'status_name(:active)' do
          it 'should == "active"' do
            subject.status_name(:active).should == "active"
          end
        end
      end

      context "locale :en" do
        before { I18n.locale = :en }
        its(:status_names) { should == ['active', 'inactive', 'deleted'] }
        its(:status_options) { should == [["active", 1], ["inactive", 2], ["deleted", 3]] }
        describe 'status_name(:active)' do
          it 'should == "active"' do
            subject.status_name(:active).should == "active"
          end
        end
      end
    end

    describe "instance methods" do
      subject { Anonymous.new(Anonymous.status_value(:active)) }

      context "locale :ja" do
        before { I18n.locale = :ja }
        its(:status_name) { should == 'active' }
      end

      context "locale :en" do
        before { I18n.locale = :en }
        its(:status_name) { should == 'active' }
      end
    end
  end
end
