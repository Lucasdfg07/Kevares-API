class CreateIssueTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :issue_types do |t|
      t.belongs_to :issue
      t.belongs_to :type
      t.timestamps
    end
  end
end
