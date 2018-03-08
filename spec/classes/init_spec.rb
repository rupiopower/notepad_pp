require 'spec_helper'
describe 'notepad_pp' do
  context 'with default values for all parameters' do
    it { should contain_class('notepad_pp') }
  end
end
