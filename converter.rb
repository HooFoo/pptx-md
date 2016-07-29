require 'require_all'
require 'powerpoint'

require_all './model'
require_all './util'

module PptxMd
  class Main
    def self.main argv
      #check parameters
      if argv.length < 2
        puts 'Usage: converter input.md output.pptx'
        exit
      end

      input = argv[0]
      output = argv[1]

      #parse files
      if input =~ /.+\.md/
        slides = Parser.parse_md input
      elsif input =~ /.+\.pptx/
        slides = Parser.parse_pptx input
      else
        puts 'Incorrect input format.'
        exit
      end

      #save files
      if output =~ /.+\.md/
        content = slides.inject('') { |res, slide| res+slide.to_md }
        IO.write(output, content)
      elsif output =~ /.+\.pptx/
        deck = Powerpoint::Presentation.new
        slides.each do |slide|
          deck.add_textual_slide slide.title.to_pptx, slide.text.to_pptx
        end
        deck.save output
      else
        puts 'Incorrect output format.'
        exit
      end
      
    end
  end
end
PptxMd::Main.main ARGV
