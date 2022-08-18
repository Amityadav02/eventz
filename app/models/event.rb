class Event < ApplicationRecord

	validates  :name, :description, :location, presence: true

def self.upcoming
	where("starts_at > ?", Time.now).order("starts_at")
end

  def free?
		price.blank? || price.zero?
	end
end
