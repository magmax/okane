class Movement < ActiveRecord::Base
  belongs_to :account

  validates_presence_of :concept, :value, :account
end
