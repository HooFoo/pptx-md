module PptxMd
  class Title

    attr :text

    def initialize string = ''
      @text = string
    end

    def to_pptx
      @text
    end

    def to_md
      "\##{@text}"
    end
  end
end