class Static < ActiveRecord::Base

  attr_accessible :title, :short_url, :static_order, :static_id, :content

  has_many :statics
  belongs_to :static

  default_scope order(:static_order, :id)
  scope :first_level, where("static_id is null")

end
