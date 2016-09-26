class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.column :to, :string
      t.column :from, :string
      t.column :body, :text

      t.timestamps
    end
  end
end
