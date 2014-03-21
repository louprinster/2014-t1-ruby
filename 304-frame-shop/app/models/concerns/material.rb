class Material < ActiveRecord::Base
  has_many :frame_orders, class_name: "FrameOrder", foreign_key: "material_id"
end