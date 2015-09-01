class OrderTable < ActiveRecord::Base
  belongs_to :Host
  belongs_to :User
end
