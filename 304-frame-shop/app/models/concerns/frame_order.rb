class FrameOrder < ActiveRecord::Base
  validates :material_id,   presence: true
  validates :linear_inches, presence: true
  belongs_to :material, class_name: "Material", foreign_key: "material_id"
end
