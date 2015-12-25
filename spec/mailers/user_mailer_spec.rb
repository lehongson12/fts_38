require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  let(:user) {mock_model User, name: "Test", email: "test@email.com"}
  let(:mail) {UserMailer.notifications_new_category user.email}
  
  describe "#notifications_new_category" do
    it "renders the subject" do
      expect(mail.subject).to eq("FTS : New category")
    end

    it "renders the receiver email" do
      expect(mail.to).to eq [user.email]
    end

    it "renders the sender email" do
      expect(mail.from).to eq ["from@example.com"]
    end

    it "assigns @name" do
      expect(mail.body.encoded).to match "UserMailer#New Category"
    end
  end
end
