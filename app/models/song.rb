
require 'carrierwave/orm/activerecord'

class Song < ActiveRecord::Base

	#attr_accessible :title,:artist,:album,:musicfile
	belongs_to :user
	mount_uploader :musicfile, MusicfileUploader

	
	#def after_initialize(attributes = {})
    	#	self[:title]  = attributes[:title]
    	#	self[:artist] = attributes[:artist]
    	#	self[:album]  = attributes[:album]
    	#	self[:musicfile] = attributes[:musicfile]
  	#end
	
end
