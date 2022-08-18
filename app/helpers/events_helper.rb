module EventsHelper
  
	def price(event)
		if event.price == 0
			"Free"
		else
			number_to_currency(event.price, precition: 0) 
		end
	end

	def day_and_time(event)
		event.starts_at.strftime("%B %d at %I:%M %p")
	end
end
