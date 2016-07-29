module PptxMd
  class Slide

    attr_accessor :title
    attr_accessor :text

    def to_pptx
      #dummy because i don't need it, but interface is good
    end

    def to_md
      "#{@title.to_md}\n#{@text.to_md}---\n"
    end
  end
end
