class Author < ActiveRecord::Base
  has_many :recipes, class_name: "Recipe", foreign_key: "author_id"
end
