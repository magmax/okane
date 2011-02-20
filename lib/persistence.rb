# -*- coding: utf-8 -*-

require 'rubygems'
require 'dm-core'
require 'dm-validations'
require 'date.rb'

class ::Account
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n,  :movements

  validates_presence_of :name
end


class ::Movement
  include DataMapper::Resource

  property :id, Serial
  property :date, DateTime, :default => Date.today
  property :type, String
  property :concept, String
  property :value, Integer

  belongs_to :account

  validates_presence_of :concept, :value, :account
end


DataMapper.finalize
