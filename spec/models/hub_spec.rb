require 'spec_helper'

describe Hub do
  
  before { @hub = Hub.new(name: "Hub Berkeley",
                          email: "hubberkeley@example.com",
                          password: "foobar",
                          password_confirmation: "foobar") }
                          
  subject { @hub }
  
  it { should respond_to :name }
  it { should respond_to :email }
  
  it { should be_valid }
  
  
  describe "with a password that's too short" do
    before { @hub.password = @hub.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
  
  describe "when password is not present" do
    before { @hub.password = @hub.password_confirmation = " " }
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { @hub.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "when password confirmation is nil" do
    before { @hub.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  describe 'when email is already taken' do
    before do
      dupe_hub = @hub.dup
      dupe_hub.email = @hub.email.upcase
      dupe_hub.save
    end
    
    it { should_not be_valid }
  end
  
  describe 'when email is not present' do
    before { @hub.email = "" }
    it { should_not be_valid }
  end
  
  describe 'when email is not valid' do
    addresses = ['asdfsafasdf', 'asdfadsf@asdfasdf', 'asdfsdf_asdfaf.com', 'foo@bar+barbarbar.com']
    addresses.each do |addr|
      before { @hub.email = addr }
      it { should_not be_valid }
    end
  end
  
  
  
end