module Restet
  class Server
    class Command
      def initialize(file, slice)
        puts file.class.name
        @file, @slice = file, slice
      end
      
      def pageopt
        "includebox={{#{@slice['bottom_left'].join(' ')} #{@slice['top_right'].join(' ')}}}"
      end
      
      def execute
        cmd = "tet --text --pageopt \"#{pageopt}\" --outfile - #{File.realpath(@file)}"
        result = `#{cmd}`
        result.gsub(/PDFlib TET: PDFlib Text Extraction Toolkit, 4.0p2\n\(c\) 2002-2010 PDFlib GmbH  www.pdflib.com  sales@pdflib.com\n/, '')
      end
    end
  end
end