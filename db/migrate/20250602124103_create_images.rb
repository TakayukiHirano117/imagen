class CreateImages < ActiveRecord::Migration[8.0]
  def change
    create_table :images do |t|
      t.string :cloudinary_path

      t.timestamps
    end
  end
end
