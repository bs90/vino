class Noun < ActiveRecord::Base
  def search_images
    Google::Search::Image.new(query: self.word).to_a.first(10).map(&:uri) |
      Google::Search::Image.new(query: self.meaning).to_a.first(10).map(&:uri)
  end
end
