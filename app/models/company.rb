#encoding: utf-8
class Company < ActiveRecord::Base
  attr_accessible :company_order, :description, :about, :name, :short_url, :logo

  has_attached_file :logo,
                    :styles => {
                        :small => '132x30#',
                        :list => '226x162>'
                    },
                    :default_url => '/companies/default.jpg',
                    :url => '/companies/:id/:style_:basename.:extension'

  validates_attachment_presence :logo
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png'], :message => "Неверный формат файла изображения."

  default_scope order("company_order, id")
  scope :to_index, order( :order => 'random()').limit(9)



  def previous
    Company.where("company_order <= ? AND id < ?", company_order, id).last
  end

  def next
    Company.where("company_order >= ? AND id > ?", company_order, id).first
  end

end
