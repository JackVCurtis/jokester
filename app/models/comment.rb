class Comment < ActiveRecord::Base
	belongs_to :joke 
	belongs_to :user
	validates :body, presence: true
	validates :joke_id, numericality: true, presence: true
	validates :user_id, numericality: true, presence: true
end