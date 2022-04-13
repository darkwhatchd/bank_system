class OperableSavingService
  def initialize(resource, operable_type)
    @resource = resource
    @operable_type = operable_type
  end

  def call
    operable = @operable_type.safe_constantize.new
    @resource.operable = operable
  end
end
