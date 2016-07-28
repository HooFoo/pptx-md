require 'require_all'
require_all './model'
require_all './util'

class Main
  def self.main argv
    #check parameters
    if argv.length < 2
      puts 'Usage: converter input.md output.pptx'
      exit
    end

    input = argv[0]
    output = argv[1]

    if input =~ /.+\.md/
      slides = Parser.parse_md input
    elsif input =~ /.+\.pptx/
      slides = Parser.parse_pptx input
    else
      puts 'Incorrect input format.'
      exit
    end
  end
end
Main.main ARGV
