class CreateEquipes < ActiveRecord::Migration[7.1]
  def change
    create_table :equipes do |t|
      t.string :nomeEquipe
      t.references :mecanico, null: true, foreign_key: true

      t.timestamps
    end
  end
end
