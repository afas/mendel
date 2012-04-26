class AlbumImage < ActiveRecord::Base
  has_attached_file :image,
                    :styles => {
                        :list => '170x100#',
                        :full => '1000x800>'
                    },
                    :default_url => '/album_images/default.png',
                    :url => '/album_images/:id/:style_:basename.:extension'
end
