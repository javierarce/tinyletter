require 'rubygems'
require_relative 'tinyletter/version'
require_relative 'tinyletter/newsletter'

module Tinyletter
  class << self
    attr_accessor :log
    attr_accessor :debug
  end

  self.log = false
  self.debug = false
end
