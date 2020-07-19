class ApplicationEntity
  attr_reader :model

  def self.safe_delegate(*attributes, to:)
    attributes.each do |attribute|
      define_method(attribute) do
        model_instance = public_send(to)
        return nil if model_instance.nil?
        model_instance.public_send(attribute)
      end
    end
  end

  def initialize(model = nil)
    @model = model
  end
end
