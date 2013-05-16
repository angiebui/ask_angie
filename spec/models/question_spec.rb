require 'spec_helper'

describe Question do #model tests, record tests

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should allow_mass_assignment_of(:body) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:user_id) }
  it { should have_many(:answers) }
  it { should belong_to (:user) }

end
