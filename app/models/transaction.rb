class Transaction < ApplicationRecord
  has_and_belongs_to_many :tags, join_table: "transaction_tags", uniq: true

  searcher do
    label :tag, from: :tags, field: 'name'
  end
end
