class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  def to_param
    name
  end

  def to_s
    '#'+name
  end
end
