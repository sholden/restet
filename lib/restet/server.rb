require 'sinatra/base'

module Restet
  class Server < Sinatra::Base
    require 'restet/server/command'
    dir = File.dirname(File.expand_path(__FILE__))
    
    post '/extractions' do
      slices = JSON.parse(params[:extraction])
      extractions = {}
      slices.each do |name, slice|
        extractions[name] = Command.new(params[:pdf][:tempfile], slice).execute
      end
      JSON.dump(extractions)
    end
  end
end