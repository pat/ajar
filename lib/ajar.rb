require 'open-uri'
require 'httparty'

class Ajar
  SERVER  = 'http://ajar-web.herokuapp.com'
  HEADERS = {'Content-Type' => 'application/json'}

  def initialize(graph, developer_key)
    @graph, @developer_key = graph, developer_key
  end

  def put_connections(*arguments)
    options = arguments.pop
    options.keys.each do |key|
      options[key] = external_uri_for options[key]
    end if local_environment?

    graph.put_connections *(arguments + [options])
  end
  
  private
  
  attr_reader :graph, :developer_key
  
  def external_uri_for(internal_uri)
    HTTParty.post("#{SERVER}/api/pages.json",
      :body => {
        :page => {
          :internal_uri => internal_uri,
          :content => open(internal_uri).read
        },
        :key => developer_key
      }.to_json,
      :headers => HEADERS
    )['url']
  end
  
  def local_environment?
    Rails.env.development? || Rails.env.test?
  end
end
