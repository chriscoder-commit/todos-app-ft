class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

# ORM => with an ORM we can write ruby to execute SQL