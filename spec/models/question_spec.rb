require 'spec_helper'

describe Question do
  let(:question) { FactoryGirl.build(:question) }
  subject { question }

  # it { should validate_presence_of(:title) }
  # it { should validate_presence_of(:body) }
  # it { should allow_mass_assignment_of(:body) }
  # it { should have_many(:answers) }

end
