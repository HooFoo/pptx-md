module PptxMd
  class Slide

    attr_accessor :title
    attr_accessor :text

    def to_pptx

    end

    def to_md
      "#{@title.to_md}\n#{@text.to_md}---\n"
    end
  end
end