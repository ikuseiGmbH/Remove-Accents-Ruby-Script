module RemoveAccents
  class Configuration
    @config = {
              "replacements" => {
                'E' => [200,201,202,203],
                'e' => [232,233,234,235],
                'A' => [192,193,194,195,196,197],
                'a' => [224,225,226,227,228,229,230],
                'C' => [199],
                'c' => [231],
                'O' => [210,211,212,213,214,216],
                'o' => [242,243,244,245,246,248],
                'I' => [204,205,206,207],
                'i' => [236,237,238,239],
                'U' => [217,218,219,220],
                'u' => [249,250,251,252],
                'N' => [209],
                'n' => [241],
                'Y' => [221],
                'y' => [253,255],
                'Ae' => [306],
                'ae' => [346],
                'Oe' => [188],
                'oe' => [189],
                'Ue' => [220],
                'ue' => [252],
                'ss' => [223]
              }
            }

    @valid_config_keys = @config.keys

    # Configure through hash
    def self.configure(opts = {})
      opts.each {|k,v| @config[k.to_s] = v if @valid_config_keys.include? k.to_s}
    end

    # Configure through yaml file
    def self.configure_with_path
      if defined?(::Rails).nil?
        path_to_yaml_file = "../config/remove_accents.yml"
      else
        path_to_yaml_file = "#{::Rails.root}/config/remove_accents.yml"
      end
      begin
        config = YAML::load(IO.read(path_to_yaml_file))
      rescue Errno::ENOENT
        #puts "YAML configuration file couldn't be found. Using defaults."
        return
      rescue Psych::SyntaxError
        puts "YAML configuration file contains invalid syntax. Using defaults."
        return
      end

      configure(config)
    end

    def self.config
      @config
    end
  end
end
