class Comment < ApplicationRecord
  belongs_to :opportunity, optional: true
end
