module PptxMd
  class Text

    attr_accessor :blocks

    def initialize array = []
      @blocks = array
    end

    def to_pptx
      @blocks
    end

    def to_md
      @blocks.inject("") { |result, item| "#{result}#{item}\n" }
    end
  end
end