class CreatePecas < ActiveRecord::Migration[7.1]
  def change
    create_table :pecas do |t|
      t.string :nome
      t.decimal :preco

      t.timestamps
    end
  end
end
