class CreateNow < ActiveRecord::Migration[7.1]
  def change
    create_table :nows do |t|
      t.timestamps
    end
  end
end
