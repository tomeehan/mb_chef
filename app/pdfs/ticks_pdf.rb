class TicksPdf < Prawn::Document
	def initialize(ticks)
		super(top_margin: 70)
		@ticks = Tick.order("id DESC").all
		tick_id
	end

	def tick_id
		table tick_id_all do
			row(0).font_style = :bold
			columns(1..3).align = :left
			self.header = true
		end
	end

	def tick_id_all
		[["Name (Time)", "Scheduled", "Date", "Completed", "Name"]] + 
		@ticks.map do |tick|
			[tick.task.name, 
				if tick.stage == "starting"
					"Morning"
				else 
					if tick.stage == "middle"
						"Afternoon"
					else 
						"Evening"
					end
				end, 
					tick.updated_at.to_s, tick.complete.to_s, tick.staff.first_name + " " + tick.staff.surname]
		end
	end
end