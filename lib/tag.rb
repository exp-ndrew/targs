
class Tag < ActiveRecord::Base
  validates :name, :presence => :true
  has_and_belongs_to_many :items, -> { uniq }
  
  before_save :downcase_name

  private

  def downcase_name
    self.name = self.name.downcase
  end

end
