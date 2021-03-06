class ApplicationRepository
  def self.model=(value)
    @model_klass = value
  end

  def self.entity=(value)
    @entity_klass = value
  end

  def self.model_klass
    @model_klass
  end

  def self.entity_klass
    @entity_klass
  end

  def find_by(*attributes)
    record = model_klass.find_by(*attributes)
    return nil if record.nil?

    entity_klass.new(record.attributes)
  end

  def find(identifier)
    record = model_klass.find(identifier)
    entity_klass.new(record.attributes)
  end

  def create(entity)
    model_klass.create(entity.attributes)
  end

  private

  def entity_klass
    self.class.entity_klass
  end

  def model_klass
    self.class.model_klass
  end
end
