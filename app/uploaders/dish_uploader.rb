# encoding: utf-8

class DishUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :fog

  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAIMA2O5NAJAC466EQ',       # required
      :aws_secret_access_key  => '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',                        # required
      :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
      #:host                   => 'http://s3.amazonaws.com/',             # optional, defaults to nil
      #:endpoint               => '' # optional, defaults to nil
    }
    config.fog_directory  = 'foodspotting-clone/assets/image'                     # required
    #config.fog_public     = false                                   # optional, defaults to true
    #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.id}"
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
  version :thumb do
    process :resize_to_limit => [300,300]
  end

  version :middle do
    process :resize_to_limit => [500,500]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
