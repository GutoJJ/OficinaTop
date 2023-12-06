class CreateJoinTableEquipesMecanicos < ActiveRecord::Migration[7.1]
  def change
    create_join_table :equipes, :mecanicos do |t|
      t.index [:equipe_id, :mecanico_id]
      t.index [:mecanico_id, :equipe_id]
    end
  end
end
