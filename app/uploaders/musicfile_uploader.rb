# encoding: utf-8

class MusicfileUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  #def set_userid(userid)
  #	@userid=userid
  #end
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

	
  #overriding filename and url - always overload them together
  def filename
	"#{model.id}.mp3"
  end
  def url
    "/#{store_dir}/#{model.id}.mp3"
  end
  #def filename
  #  if original_filename.present?
  #    "#{secure_token}.#{file.path.split('.').last.downcase}"
  #  else
  #    super
  #  end
  #end
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #def cache_dir
  #	"#{Rails.root}/uploads/tmp"
  #end
  def store_dir
  	#"#{Rails.root}/uploads/#{@userid}/"
    "#{Rails.root}/public/uploads/#{model.user_id}"
    #"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{Song.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(mp3)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
