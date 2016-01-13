class Podcast < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :episodes

  has_attached_file :thumbnail, 
  	storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    dropbox_options: {path: proc{ |style| "#{style}/#{id}/#{thumbnail.original_filename}" } },
    styles: { large: "1000x1000#", medium: "500x500#" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end
