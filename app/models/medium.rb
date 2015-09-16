class Medium < ActiveRecord::Base
	 mount_uploader :file_name, MediaUploader
	 validates_presence_of :file_name
	 validates_integrity_of :file_name
	 validates_processing_of :file_name
	 belongs_to :emission
	 attr_accessor :key

   default_scope { order("position ASC") }

end
