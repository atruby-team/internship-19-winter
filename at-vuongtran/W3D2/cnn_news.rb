require_relative 'news'

class CnnNews < News
  def initialize(id, tittle, content, publication_date)
    super
    @publication_date = publication_date
    @@list_new << self
  end
end
