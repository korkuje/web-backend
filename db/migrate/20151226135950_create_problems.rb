class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :line, index: true, foreign_key: true
      t.integer :reason
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
