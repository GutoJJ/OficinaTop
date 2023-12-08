class Peca < ApplicationRecord
    has_and_belongs_to_many :ordens, join_table: 'ordems_pecas'
end
