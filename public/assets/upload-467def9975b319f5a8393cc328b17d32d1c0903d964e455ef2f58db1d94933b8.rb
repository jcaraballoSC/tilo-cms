class Upload < ActiveRecord::Base
	require 'action_view'
	include ActionView::Helpers::NumberHelper
	belongs_to :emission
	attr_accessor :upload_file
  before_save :upload_file

  default_scope { order("position ASC") }

  def upload_file=(imcoming_file)
		#en caso de que vengan mas de uno
		imcoming_file.each do |key, value|
			self.name = value.original_filename
			self.tipe = value.content_type
			@data = value.read
			self.path = 'uploads/' + self.name
			self.md5 = Digest::MD5.hexdigest(@data)
			numer = @data.size
			self.size= number_to_human_size(numer)
			self.time_to_air = "10"

			#Mueve el archivo al directorio
			File.open(Rails.root.join('public', 'uploads', self.name), 'wb') do |file|
				file.write(@data)
			end
		end

  end

  def filename=(new_filename)
  	write_attribute("filename", sanitize_filename(new_filename))
  end

private
  def sanitize_filename(filename)
  	just_filename = File.basename(filename)
  	just_filename.gsub(/[^\w\.\-]/, '-')
  end
end
