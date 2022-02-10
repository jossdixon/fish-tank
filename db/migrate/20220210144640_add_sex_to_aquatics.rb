class AddSexToAquatics < ActiveRecord::Migration[6.0]
  def change
    add_column :aquatics, :sex, :integer
  end
end
