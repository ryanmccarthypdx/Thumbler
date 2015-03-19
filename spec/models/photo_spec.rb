require 'rails_helper'

describe Photo do

  it { should have_and_belong_to_many(:users)}



end
