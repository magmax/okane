# -*- coding: utf-8 -*-

require 'test/unit'
#require 'test/unit/notify'
require 'rubygems'
require 'dm-core'
require './lib/persistence'
require  'dm-migrations'

class TestPersistence < Test::Unit::TestCase

  def setup
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, 'sqlite::memory:')
    #DataMapper.setup(:default, 'sqlite:///path/to/project.db')
    #DataMapper.setup(:default, 'mysql://localhost/the_database_name')
    DataMapper::Model.raise_on_save_failure = true
    DataMapper.auto_migrate!
  end

  def test_create_Account
    account = Account.create :name => 'Inject the Venom'
    assert account.valid?
    account.save

    assert_equal 1, Account.count
  end

  def test_account_name_is_mandatory
    assert_raises DataMapper::SaveFailureError do
      account = Account.create
      account.save
    end
  end

  def test_create_Movement
    account = Account.create :name => 'Hell Bells'
    account.save
    movement = Movement.new
    movement.value = 1000
    movement.concept = 'Blackice'
    movement.account = account
    assert movement.valid?
    movement.save

    assert_equal 1, Movement.count
  end

  def test_movements_has_default_date
    account = Account.create :name => 'Jailbreak'
    account.save
    movement = Movement.new
    movement.account = account
    movement.value = 1
    movement.concept = 'Show Business'

    assert_equal false, (movement.date==nil)
  end

  def test_movements_must_have_an_account
    assert_raises DataMapper::SaveFailureError do
      movement = Movement.create
      movement.concept = "You ain't got a hold on me"
      movement.value = 99
      movement.save
    end
  end

  def test_movements_must_have_a_value
    account = Account.create :name => "Soul Stripper"
    account.save
    assert_raises DataMapper::SaveFailureError do
      movement = Movement.create
      movement.concept = "Baby, please don't go"
      movement.account = account
      movement.save
    end
  end

  def test_movements_must_have_a_concept
    account = Account.create :name => "Rock N Rock Train"
    account.save
    assert_raises DataMapper::SaveFailureError do
      movement = Movement.create
      movement.value = 10000
      movement.account = account
      movement.save
    end
  end
end
