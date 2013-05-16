require 'spec_helper'

describe Answer do

it { should validate_presence_of (:body) }
it { should belong_to(:user) }
it { should belong_to(:question) }
it { should have_many (:votes) }
it { should allow_mass_assignment_of (:body) }
it { should allow_mass_assignment_of (:question_id) }
it { should allow_mass_assignment_of (:user_id) }

end
