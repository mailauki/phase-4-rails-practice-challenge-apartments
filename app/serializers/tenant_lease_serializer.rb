class TenantLeaseSerializer < ActiveModel::Serializer
  attributes :rent, :apartment_number

  def apartment_number
    object.apartment.number
  end

end
