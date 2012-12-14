#encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :secondname, :surname, :faculty, :kafedra, :course, :about, :avatar,
                  :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at

  has_attached_file :avatar,
                    :styles => {
                        :small => '55x55#',
                        :medium => '144x144#'
                    },
                    :default_url => '/users/avatar/default.png',
                    :url => '/users/avatar/:id/:style_:basename.:extension'

  #validates_attachment_presence :avatar
  #validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png'], :message => "Неверный формат файла изображения."

  belongs_to :role

  def role?(role_name)
    self.role && self.role.name == role_name.to_s
  end

  def full_name
    full_name = ""
    if self.name != ""
      full_name += self.name.capitalize
      if self.secondname != ""
        full_name += " #{self.secondname.capitalize}"
      end
      if self.surname != ""
        full_name += " #{self.surname.capitalize}"
      end
    else
      full_name = self.email
    end
  end

end
