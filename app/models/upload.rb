class Upload < ActiveRecord::Base
	mount_uploader :name, ImageUploader


   default_scope { order("position ASC") }
end
