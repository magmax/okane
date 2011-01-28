# -*- coding: utf-8 -*-
require 'date.rb'

class Movement
  attr_accessor :associated_account
  attr_accessor :date
  attr_accessor :type
  attr_accessor :concept
  attr_accessor :value

  def initialize
    @date = Date.today
  end
end
