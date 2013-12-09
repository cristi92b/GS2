require 'active_model'
require 'carrierwave/orm/activerecord'

class Song < ActiveRecord::Base
	include ActiveModel::Model
	attr_accessible :title,:artist,:album,:musicfile
	belongs_to :user
	mount_uploader :musicfile, MusicfileUploader
end
