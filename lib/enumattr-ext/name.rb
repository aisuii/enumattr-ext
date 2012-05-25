# -*- encoding: utf-8 -*-
module Enumattr
  module Ext
    module Name
      extend ActiveSupport::Concern

      included do
        Enumattr::Enums::Enum.send :include, Decorator
        class << self
          alias_method_chain :define_enumattr_class_methods,    :name
          alias_method_chain :define_enumattr_instance_methods, :name
        end
      end

      module ClassMethods
        def define_enumattr_class_methods_with_name(enumattr_name)
          define_enumattr_class_methods_without_name(enumattr_name)

          method_prefix = "#{enumattr_name}_"
          class_eval(<<-METHOD, __FILE__, __LINE__)
            def self.#{method_prefix}names
              enumattrs[:#{enumattr_name}].enums.map(&:name)
            end

            def self.#{method_prefix}options
              enumattrs[:#{enumattr_name}].enums.map do |enum|
                [ enum.name, enum.value ]
              end
            end
          METHOD
        end

        def define_enumattr_instance_methods_with_name(enumattr_name)
          define_enumattr_instance_methods_without_name(enumattr_name)

          enums = enumattrs[enumattr_name]
          method_prefix = "#{enumattr_name}_"

          class_eval(<<-METHOD, __FILE__, __LINE__)
            def #{method_prefix}name
              enum = #{method_prefix}enum
              enum && enum.name
            end
          METHOD
        end
      end

      module Decorator
        def name
          default = @extras.first || key.to_s
          scope = ["#{@container.base.name}.#{@container.enumattr}"]
          I18n.translate(key, :scope => scope, :default => default)
        end
      end
    end
  end
end
