# -*- coding: utf-8 -*-
require 'date.rb'
require 'test/unit'
require 'lib/persistence.rb'

class Movement_test < Test::Unit::TestCase
  @sut = nil
  def setup
    @sut = Movement.new
  end

  def test_has_associated_account
    account = 123456789
    @sut.associated_account = account
    assert_equal @sut.associated_account, account
  end

  def test_has_date_of_movement
    date = Date.new
    @sut.date = date
    assert_equal @sut.date, date
  end

  def test_today_is_the_default_date
    assert_equal @sut.date, Date.today
  end

  def test_has_type_of_movement
    type = 'Cowboys from Hell'
    @sut.type = type
    assert_equal @sut.type, type
  end

  def test_has_concept
    concept = 'Nothing else Mathers'
    @sut.concept = concept
    assert_equal @sut.concept, concept
  end
  
  def test_has_value
    value = 12345
    @sut.value = value
    assert_equal @sut.value, value
  end
end
