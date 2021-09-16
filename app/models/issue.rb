class Issue < ApplicationRecord
  validates_presence_of :latitude, :longitude, :altitude, :image
  
  has_many :issue_types
  has_many :types, through: :issue_types

  has_many :status

  before_save :set_lonlat_pointer

  scope :within, -> (longitude, latitude, distance_in_km = 5) {
    where(%{
      ST_Distance(lonlat, 'POINT(%f %f)') < %d
    } % [longitude, latitude, distance_in_km * 1000])
  }

  private

  def set_lonlat_pointer
    self.lonlat = "POINT(#{self.longitude} #{self.latitude})"
  end
end