class Episode < ActiveRecord::Base
  belongs_to :podcast

  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "500x500#" },
  	storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    dropbox_options: {path: proc{ |style| "#{style}/#{id}/#{episode_thumbnail.original_filename}" } }
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\Z/

  has_attached_file :mp3,
  	storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    dropbox_options: {path: proc{ |style| "#{id}/#{mp3.original_filename}" } }

  validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] }, :file_name => { :matches => [/mp3\Z/] }
 end	
