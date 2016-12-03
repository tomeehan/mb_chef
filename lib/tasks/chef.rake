task :create_ticks => :environment do 
	
	# @tick = Tick.create!(complete: false, task_id: 200, temperature: nil, user_id: 1, staff_id: 1, active: true, stage: "ending")
	puts 'rake happened'

	@tasks = Task.where(midday: true).select("user_id")


	# @tasks.user_id =  Task.where(midday: true).user_id

	@tasks.each do 
	# Task.each do |task|
	 	Tick.create!(user_id: 1, complete: false, staff_id: 1, task_id: @tasks.ids, active: true, stage: "starting")
	 	puts 'hello world'
	 	puts @tasks.user_id
	end

end