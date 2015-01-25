class Article < ActiveRecord::Base
	has_many :comments
	validate :title, presence: true,
					 				:length { minimum: 5 }
end
