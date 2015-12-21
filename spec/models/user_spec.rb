require "rails_helper"
require "cancan/matchers"

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create :user}
  let(:admin_user) {FactoryGirl.create :admin}

  context "invalid input" do
    it "name is blank" do
      user.name = ""
      expect(user).not_to be_valid
    end

    it "email is blank" do
      user.email = ""
      expect(user).not_to be_valid
    end

    it "when email is already taken" do
      expect{ 
        user_with_same_email = user.dup
        user_with_same_email.save
      }.to change{User.count}.by 1
    end

    it "password is blank" do
    	user.password = ""
    	expect(user).not_to be_valid
    end

    it "password length < 8" do
    	user.password = Faker::Internet.password 6
    	expect(user).not_to be_valid
    end
  end

  context "association" do
    it "has many exam" do
    	as = User.reflect_on_association :exams
    	expect(as.macro).to eq :has_many
    end

    it "has many question" do
    	as = User.reflect_on_association :questions
    	expect(as.macro).to eq :has_many
    end

    describe "has abilities" do
      context "is an admin account" do
        subject(:ability){Ability.new admin_user}
        it {is_expected.to be_able_to :manage, :all}
      end

      context "is an user nomarl account" do
        subject(:ability){Ability.new user}
        it {is_expected.to be_able_to :read, Exam}
        it {is_expected.to be_able_to :create, Exam}
        it {is_expected.to be_able_to :update, Exam}
        it {is_expected.to be_able_to :read, Category}      
        it {is_expected.to be_able_to :read, Question}
        it {is_expected.to be_able_to :create, Question}
        it {is_expected.to be_able_to :update, Question}
        it {is_expected.to be_able_to :destroy, Question}
      end
    end
  end

  describe "role" do
    it "is assigned default role" do
      u = User.new
      expect(u.role).to eq "user" 
    end
  end
end
