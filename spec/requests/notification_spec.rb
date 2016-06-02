require "rails_helper"

RSpec.describe Notification, type: :request do

  it "creates a Notification" do
    headers = {
      "ACCEPT" => "application/json"
    }

    post "/notifications",
    {
      notification: {
        phone: "5555555555",
        body: "My Message",
        source_app: "my_app_name"
      }
    }, headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

  it 'renders an error status if the notification was not created' do
    headers = {
      "ACCEPT" => "application/json"
    }

    post "/notifications",
    {
      notification: {
        phone: "5555555555",
        body: "My Message"
      }
    }, headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:unprocessable_entity)
  end

end