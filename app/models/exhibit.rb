class Exhibit < ActiveRecord::Base
  attr_accessible :description, :title, :image, :image_content_type, :image_file_name, :image_file_size

  has_attached_file :image,
                    :styles => {
                        :small => '69x66#',
                        :list => '226x162#',
                        :slider => '329x270#',
                        :big => '726x726#',
                        :big_inner => '400x500>'
                    },
                    :default_url => "/exhibit_images/default.jpg",
                    :url => "/exhibit_images/:id/:style_:basename.:extension"

  validates_attachment_presence :image, :message => I18n.t("paperclip.errors.presence")
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => I18n.t("paperclip.errors.content_type")

  default_scope order("exhibit_order, id DESC")

  scope :approved, where("title <> ''")
  scope :to_index, where("title <> ''").order( :order => 'random()').limit(21)

  def previous
    Exhibit.where("exhibit_order <= ? AND id > ?", exhibit_order, id).last
  end

  def next
    Exhibit.where("exhibit_order >= ? AND id < ?", exhibit_order, id).first
  end

end
