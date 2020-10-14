class Todo < ApplicationRecord
end

# get all items from a table
# SELECT * FROM todos;
# Todo.all

# find one item
# SELECT * FROM todos WHERE id == 1;
# Todo.find("2")

# create a new todo
# Todo.create
# best way to add things to db
# Todo.new
# another way to add to the db
# remember to also call .save