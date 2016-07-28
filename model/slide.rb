class Slide

  attr_accessor :title
  attr_accessor :text

  def initialize
    @text = []
  end

  def to_md
    txt = @text.join "\n"
    "#{@title} \n #{txt} \n--- \n"
  end
end