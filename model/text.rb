class Text

  attr :blocks

  def initialize array
    @blocks = array
  end

  def to_pptx
    @blocks
  end

  def to_md
    @blocks.inject("") { |result, item| "#{result} #{item} \n"  }
  end
end