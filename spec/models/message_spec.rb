require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '111111', :from => '2063971865')
    message.save {should equal false }
  end

  it 'adds an error if the number is invalid' do
    message = Message.new(:body => 'hi', :to => '11111', :from => '2063971865')
    message.save
    expect(message.errors[:base]).to eql(["The 'To' number 11111 is not a valid phone number."])
  end
end
