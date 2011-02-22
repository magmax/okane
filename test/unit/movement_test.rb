require 'test_helper'

class MovementTest < ActiveSupport::TestCase
  test "must have a concept" do
    account = Account.new
    account.name = "Jailbrack"
    account.save
    movement = Movement.new
    movement.value = 1000
    movement.account = account
    assert !movement.save, "Saved the movement without a concept"
  end

  test "must have a value" do
    account = Account.new
    account.name = "Show business"
    account.save
    movement = Movement.new
    movement.concept = "Blackice"
    movement.account = account
    assert !movement.save, "Saved the movement without a value"
  end

  test "must have an account" do
    movement = Movement.new
    movement.concept = "Baby, please don't go"
    movement.value = 1000
    assert !movement.save, "Saved the movement without an account"
  end



end
