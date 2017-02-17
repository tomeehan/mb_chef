# README

Minibarra Chef Rails App

- Ruby 2.3.0
- Rails 5 
- Bootstrap 3
- PostgreSQL

Getting started: 

- `bundle install`
- `rails db:create`
- `rails db:migrate`

***

Task categories and regularity will need to be created manually using the console: 

For categories:

- `rails console`
- `> Category.connection`
- `> Category.create(name: "Temperature") # for temperature records`
- `> Category.create(name: "Check") # (i.e. for cleaning checks)`

For regularities:

- `rails console`
- `> Regularity.connection`
- `> Regularity.create(name: "Daily") # for daily tasks`
- `> Regularity.create(name: "Weekly") # for weekly tasks`
- `> Regularity.create(name: "Monthly") # for monthly tasks`

***

The apps core functionality rests on two models: **Tasks and Ticks**. 

Each `Tick` belongs_to a `Task`
Each `Task` has_many `Ticks`

- Users create a task (i.e. Fridge Temperature). 
- That task has creates its respective ticks.
- User mark `Ticks` as complete or incomplete. 
- When a user submits a Tick's form for the first time, the tomorrow's tick is created. 

[www.minibarra.com](http://www.minibarra.com)