class CreateSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :specialties do |t|
      t.string   :name
      t.timestamps
    end
    remove_column :doctors, :specialty
  end
end
