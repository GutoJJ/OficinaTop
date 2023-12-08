class CreateOrdems < ActiveRecord::Migration[7.1]
  def change
    create_table :ordems do |t|
      t.text :descricao
      t.date :data_comeco
      t.date :data_termino
      t.date :previsao
      t.decimal :valor
      t.references :cliente, null: false, foreign_key: true
      t.references :equipe, null: false, foreign_key: true
      t.references :veiculo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
