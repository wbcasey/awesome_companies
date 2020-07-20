class ApplicationEntity
  def self.attribute(name, type)
    @attributes ||= {}
    @attributes[name] = nil

    define_method("#{name}=") do |value|
      write_attribute(name, value)
    end

    define_method(name) do
      read_attribute(name)
    end
  end

  def self.attributes
    @attributes
  end

  def initialize(attrs = {})
    @attributes = self.class.attributes

    attrs.each_pair do |method_name, value|
      self.public_send("#{method_name}=", value)
    end
  end

  def attributes
    @attributes
  end

  private

  def read_attribute(name)
    @attributes[name]
  end

  def write_attribute(name, value)
    @attributes[name] = value
  end
end
