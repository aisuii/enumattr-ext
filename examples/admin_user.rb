# -*- encoding: utf-8 -*-

class AdminUser
  include Enumattr::Base
  include Enumattr::Ext::Name

  attr_accessor :status

  enumattr :status do
    enum :active,   1, 'activated'
    enum :inactive, 2, 'disabled'
    enum :deleted,  3, 'deleted'
  end

  def initialize(status)
    @status = status
  end
end
