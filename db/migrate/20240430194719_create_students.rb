class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.json :notes
      t.string :ra
      t.timestamps
    end
  end
end
