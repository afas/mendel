class Album < ActiveRecord::Base
  validates :title, :presence => true

  has_attached_file :preview,
                    :styles => {
                        :slider => '329x270#',
                        :list => '226x276#',
                        :big => '700x500>'
                    },
                    :default_url => '/articles/default.jpg',
                    :url => '/articles/:id/:style_:basename.:extension'

  validates_attachment_presence :preview
  #validates_attachment_content_type :preview, :content_type => ['image/jpeg', 'image/png'], :message => "Неверный формат файла изображения."


  default_scope order("id DESC")

  scope :to_index, where("to_index = ?", true).order("id DESC").limit(21)

  has_many :album_images

  belongs_to :category
  #belongs_to :article


  def album_images=(album_images_array)
    album_images_array.each do |album_image|
      self.album_images << AlbumImage.new(:image => album_image)
    end
  end

  def previous
    Album.where("id > ?", id).last
  end

  def next
    Album.where("id < ?", id).first
  end


end
