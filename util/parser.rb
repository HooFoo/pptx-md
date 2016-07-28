require 'ruby_powerpoint'

class Parser

  def self.parse_pptx file
    result = []
    presentation = RubyPowerpoint::Presentation.new file
    presentation.slides.each do |slide|
      item = Slide.new
      item.title = Title.new slide.title
      item.text = Text.new slide.content
      result << item
    end
    return result
  end

  def self.parse_md file
    result = []
    lines = IO.readlines file
    index = 0
    while index<lines.length do
      slide_lines = []
      while slide_lines.last != '---' && index < lines.length
        slide_lines << lines[index].strip
        index += 1
      end
      result << self.parse_slide(slide_lines)
    end
    return result
  end

  private

  def self.parse_slide lines
    slide = Slide.new
    text = Text.new
    lines.each do |l|
      if l.start_with? '#'
        slide.title = Title.new l
      elsif l != '---'
        text.blocks << l
      end
    end
    slide.text = text
    return slide
  end
end