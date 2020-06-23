class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
