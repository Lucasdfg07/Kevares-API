class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.belongs_to :issue
      t.integer :name
      t.timestamps
    end
  end
end
