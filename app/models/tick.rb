class Tick < ApplicationRecord
	belongs_to :task
	belongs_to :user

	belongs_to :staff

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |tick|
				csv << tick.attributes.values_at(*column_names)
			end
		end
	end

end
