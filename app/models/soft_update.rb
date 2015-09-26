class SoftUpdate < ActiveRecord::Base
	mount_uploader :name, ImageUploader
end
