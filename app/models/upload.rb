class Upload < ActiveRecord::Base
	mount_uploaders :name, ImageUploader


   default_scope { order("position ASC") }
end
