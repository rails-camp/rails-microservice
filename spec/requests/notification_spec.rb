require "rails_helper"

RSpec.describe Notification, type: :request do
  before do
    client = FactoryGirl.create(:client)

    @headers = {
      "ACCEPT" => "application/json",
      "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials(client.source_app, client.api_key)
    }
  end

  it "creates a Notification" do
    post "/notifications",
    {
      notification: {
        phone: "5555555555",
        body: "My Message",
        source_app: "my_app_name"
      }
    }, @headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

  it 'renders an error status if the notification was not created' do
    post "/notifications",
    {
      notification: {
        phone: "5555555555",
        body: "My Message"
      }
    }, @headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'sends a text message via the Twilio API after a notification is created' do
    post "/notifications",
    {
      notification: {
        phone: "1234567890",
        body: "New Message",
        source_app: "my_app_name"
      }
    }, @headers

    expect(FakeSms.messages.last.num).to eq("1234567890")
  end
end