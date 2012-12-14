class Category < ActiveRecord::Base

  has_many :articles

  attr_accessible :title, :short_url, :description

end
