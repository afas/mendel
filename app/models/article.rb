# encoding: utf-8
class Article < ActiveRecord::Base

  belongs_to :category
  belongs_to :album

  has_attached_file :preview,
                    :styles => {
                        :small => '69x66#',
                        :list => '226x162#',
                        :big => '478x300#',
                        :big_inner => '400x500>'
                    },
                    :default_url => '/articles/default.jpg',
                    :url => '/articles/:id/:style_:basename.:extension'

  validates_attachment_presence :preview
  validates_attachment_content_type :preview, :content_type => ['image/jpeg', 'image/png'], :message => "Неверный формат файла изображения."

  default_scope order("id desc")
  scope :to_index, where("to_index = ?", true).order("id DESC").limit(6)

end
