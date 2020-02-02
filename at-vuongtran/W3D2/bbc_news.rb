require_relative 'news'

class BbcNews < News
  attr_accessor :list_new

  def initialize(id, tittle, content, category)
    super
    @category = category
    @@list_new << self
  end
end
