class Waifudb < ApplicationRecord
  validates :name, uniqueness: :true
  validates :imgwaifu, uniqueness: :true
end
