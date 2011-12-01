module Restet
  class Client
    class ExtractionParams
      attr_reader :file, :slices
      
      def initialize(file, slices = {})
        @file, @slices = file, slices
      end
      
      def slice(name, bottom_left, top_right)
        @slices[name.to_sym] = {:bottom_left => bottom_left, :top_right => top_right}
      end
      
      def to_json
        JSON.dump(@slices)
      end
    end
  end
end