class CreateJoinTableOrdemPeca < ActiveRecord::Migration[7.1]
  def change
    create_join_table :ordems, :pecas do |t|
      # t.index [:ordem_id, :peca_id]
      # t.index [:peca_id, :ordem_id]
    end
  end
end
