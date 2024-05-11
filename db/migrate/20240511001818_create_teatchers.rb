class CreateTeatchers < ActiveRecord::Migration[7.1]
  def change
    create_table :teatchers do |t|
      t.string "teatcherName"
      t.string "credential"
      t.string "discipline"
      t.string "password_digest", null: false

      t.timestamps
    end
  end
end
