class ApartmentLeaseSerializer < ActiveModel::Serializer
  attributes :rent, :tenant_name

  def tenant_name
    object.tenant.name
  end

end
