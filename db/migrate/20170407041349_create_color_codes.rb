class CreateColorCodes < ActiveRecord::Migration
  def change
    create_table :color_codes do |t|
      t.string :state
      t.float :min
      t.float :max
      t.string :color
      t.string :alert
      t.string :attention_time
    end
  end
end
