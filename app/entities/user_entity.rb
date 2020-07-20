class UserEntity < ApplicationEntity
  attribute :id, :integer
  attribute :name, :string
  attribute :email, :string
  attribute :password, :string

  def initialize(attrs = {})
    @attributes = self.class.attributes

    attrs.each_pair do |method_name, value|
      self.public_send("#{method_name}=", value) if respond_to?(method_name)
    end
  end
end

