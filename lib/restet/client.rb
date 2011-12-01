require 'net/http'
require 'net/http/post/multipart'
require 'restet/client/extraction_params'

module Restet
  class Client
    def initialize(uri)
      @uri = uri
    end
    
    def extract(file)
      params = ExtractionParams.new(file)
      yield params if block_given?
      Net::HTTP.start(@uri.host, @uri.port) do |http|
        response = http.request build_request(file, params)
        return JSON.parse(response.body, :symbolize_keys => true)
      end
    end
    
    def build_request(file, params)
      upload_io = UploadIO.new(file, 'application/pdf')
      Net::HTTP::Post::Multipart.new(@uri.path, :pdf => upload_io, :extraction => params.to_json)
    end
  end
end