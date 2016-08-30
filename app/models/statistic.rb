require 'elasticsearch/persistence/model'
class Statistic
  include Elasticsearch::Persistence::Model
  attribute :controller, String, mapping: { analyzer: 'snowball' }
  attribute :action, String, mapping: { analyzer: 'snowball' }
  attribute :user_id, Integer, mapping: { analyzer: 'snowball' }

  def self.esearch(params)
    Statistic.search(
      query: {
        filtered: {
          query: {
            multi_match: {
              query: params[:q],
              fields: ['controller', 'action']
            }
          },
          filter: {
            term: {
              "user_id": params[:user_id]
            }
          }
        }
      }
    )
  end
end
