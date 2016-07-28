class Slide

  attr_accessor :title
  attr_accessor :text

  def initialize
    @text = []
  end

  def to_md
    "#{title} \n #{text} \n ---"
  end
end