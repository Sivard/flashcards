require 'elasticsearch/persistence/model'
class Statistic
  include Elasticsearch::Persistence::Model
  attribute :controller, String, mapping: { analyzer: 'snowball' }
  attribute :action, String, mapping: { analyzer: 'snowball' }
  attribute :user_id, Integer, mapping: { analyzer: 'snowball' }
end