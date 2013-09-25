require 'spec_helper'

describe "Questions", js: true do

  describe 'Viewing' do
    let!(:user) {create(:user)}
    let!(:question) {create(:question, title: 'First Question', user: user)}

    it 'own story should have edit buttons' do
      visit root_path
      click_link('First Question')
      page.should have_content 'First Question'
    end
  end
end