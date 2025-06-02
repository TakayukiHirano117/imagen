require 'httparty'

class ImagesController < ApplicationController
  include HTTParty

  def index
  end

  def show
  end

  def new
    base_url = "https://api.openai.com/v1/images/generations"
    api_key = ENV["OPENAI_API_KEY"]

    headers = {
      "Authorization" => "Bearer #{api_key}",
      "Content-Type" => "application/json"
    }
    
    response = HTTParty.post(base_url, headers: headers, body: {
      model: "gpt-image-1",
      prompt: "A beautiful sunset over a calm ocean",
      n: 1,
      size: "1024x1024",
    }.to_json)

    if response.success?
      @base64_image = response.dig("data", 0, "b64_json")
    else
      Rails.logger.error "OpenAI API Error: #{response.body}"
      @base64_image = nil
    end
  end

  def create
  end

  def delete
  end
end
