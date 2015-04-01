module RemoveAccents
  class Base
    def initialize(opts={}, &block)
      Configuration.configure_with_path
    end

    def config
      Configuration.config
    end
    
  end
end

class String
  # The extended characters map used by removeaccents. The accented characters 
  # are coded here using their numerical equivalent to sidestep encoding issues.
  # These correspond to ISO-8859-1 encoding.
  
  # Remove the accents from the string. Uses String::ACCENTS_MAPPING as the source map.
  def removeaccents    
    str = String.new(self)
    RemoveAccents.new.config["replacements"].each {|letter,accents|
      packed = accents.pack('U*')
      rxp = Regexp.new("[#{packed}]", nil)
      str.gsub!(rxp, letter)
    }
    
    str
  end
  
  
  # Convert a string to a format suitable for a URL without ever using escaped characters.
  # It calls strip, removeaccents, downcase (optional) then removes the spaces (optional)
  # and finally removes any characters matching the default regexp (/[^-_A-Za-z0-9]/).
  #
  # Options
  #
  # * :downcase => call downcase on the string (defaults to true)
  # * :convert_spaces => Convert space to underscore (defaults to false)
  # * :regexp => The regexp matching characters that will be converting to an empty string (defaults to /[^-_A-Za-z0-9]/)
  def urlize(options = {})
    options[:downcase] ||= false
    options[:convert_spaces] ||= false
    options[:regexp] ||= /[^-_A-Za-z0-9]/
    
    str = self.strip.removeaccents
    str.downcase! if options[:downcase]
    str.gsub!(/\ /,'_') if options[:convert_spaces]
    str.gsub(options[:regexp], '')
  end
end
