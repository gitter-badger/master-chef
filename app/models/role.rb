class Role < ActiveRecord::Base
  belongs_to :project

  validates :name, presence: true, uniqueness: { scope: :project_id }
  validates :project, presence: true

  def parameterized_name
    name.parameterize
  end

end
