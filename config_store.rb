require 'bigdecimal'

class ConfigStore

  def self.parse(filename="#{File.expand_path(File.dirname(__FILE__))}/config/settings.txt")
    config = File.open(filename, "r").read

    format(config).each do |line|
      # Read key/value pair if one exists in this line
      (key, value) = line.split("=", 2)
      if key && value
        define_method(key) do
          return make_bool(value) if bool?(value)
          return make_numeric(value) if numeric?(value)
        end
      end
    end
  end

  private

  def self.format(config)
    config = config.gsub(/^#.*/, "").strip.split("\n")
    config.map {|line| line.gsub(" ", "")}
  end

  # convert string value to boolean
  def make_bool(value)
    value = value.downcase
    if bool?(value)
      value = (value == "true" || value == "on" || value == "yes")
    else
      value
    end
  end

  # convert string value to integer or float
  def make_numeric(value)
    num = BigDecimal.new(value)
    if num.frac == 0
      num.to_i
    else
      num.to_f
    end
  end
  
  # return true if value is boolean
  def bool?(value)
    ["true", "false", "on", "off", "yes", "no"].include?(value)
  end

  # return true if value is numeric
  def numeric?(value)
    num = BigDecimal.new(value)
    num.nonzero? == nil ? false : true
  end

  parse
end

