require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "an account must have a name" do
    account = Account.new
    assert !account.save, "Saved the Account without a name"
  end

end
