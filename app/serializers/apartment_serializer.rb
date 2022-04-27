class ApartmentSerializer < ActiveModel::Serializer
  attributes :id, :number

  has_many :leases, serializer: ApartmentLeaseSerializer
end
