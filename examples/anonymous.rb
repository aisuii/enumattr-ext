# -*- encoding: utf-8 -*-

class Anonymous
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
