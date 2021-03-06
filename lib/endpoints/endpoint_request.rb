require 'fig_newton'
require_relative '../../.api_key.rb'

class EndpointRequest

  attr_accessor :url_part,:request_body

  def initialize (url_part, request_body=nil)
    @url_part = url_part
    @request_body = request_body
    endpoint_url_start = FigNewton.apiurl
    endpoint_url = endpoint_url_start + @url_part
    @uri = URI(endpoint_url)
    @uri_api_key = "?api_key=#{$api_key}"
    @https = Net::HTTP.new(@uri.host, @uri.port)
    @https.use_ssl = true
  end

  def post_request
    req = Net::HTTP::Post.new(@uri.path + @uri_api_key, 'Content-Type' => 'application/json')
    req.body = request_body
    result = @https.request(req)
  rescue => e
    puts "failed #{e}"

  end




end
