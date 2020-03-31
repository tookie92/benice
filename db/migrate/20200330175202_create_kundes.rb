class CreateKundes < ActiveRecord::Migration[6.0]
  def change
    create_table :kundes do |t|
      t.string :name
      t.string :email
      t.string :url
      t.string :ansprechpartner
      t.string :telefon

      t.timestamps
    end
  end
end
