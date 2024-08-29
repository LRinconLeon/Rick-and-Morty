class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_enum :gender_enum, ["Male", "Female", "Other"]
    create_table :characters do |t|
      t.string :name
      t.string :status
      t.string :species
      t.enum :gender, enum_type: "gender_enum"
      t.string :origin
      t.string :image
      t.timestamps
    end
  end
end
