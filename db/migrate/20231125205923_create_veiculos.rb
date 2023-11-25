class CreateVeiculos < ActiveRecord::Migration[7.1]
  def change
    create_table :veiculos do |t|
      t.string :placa
      t.text :descricao
      t.string :modelo
      t.string :marca
      t.integer :ano
      t.string :cor

      t.timestamps
    end
  end
end
