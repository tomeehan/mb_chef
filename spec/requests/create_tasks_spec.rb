require 'rails_helper'

RSpec.describe "CreateTasks", type: :request do
	it 'creates a task when creating tick' do 
		task = create(:task)
		visit new_task_path
	end
end
