require "rails_helper"

RSpec.describe PurchaseConfirmation, :type => :mailer do
  describe "invoice" do

    before do 
     
  
      @alex = User.create(
        email: "a@a.fr",
        password: "123456789",
        password_confirmation: "123456789")
      end
    
let(:mail) { PurchaseConfirmation.invoice(@alex) }
    it "renders the headers" do
      expect(mail.subject).to eq("Invoice")
      expect(mail.to).to eq(["a@a.fr"])
      expect(mail.from).to eq(["bobongithub@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
