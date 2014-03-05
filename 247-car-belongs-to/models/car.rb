class Car < ActiveRecord::Base
  belongs_to :member, class_name: "Member", foreign_key: "member_id"
end
