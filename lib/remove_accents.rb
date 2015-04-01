require 'csv'
require 'yaml'
require 'net/http'
require 'uri'
require 'json'
require "remove_accents/configuration"
require "remove_accents/version"

module RemoveAccents
  
  def self.new
    RemoveAccents::Base.new
  end

end


require 'remove_accents/base'