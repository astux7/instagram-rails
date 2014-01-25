require 'spec_helper'

describe 'Edit post' do 
  before do
    create(:post)
  end

  it 'should Edit post title' do
    visit '/posts'
    click_link 'Edit post'
    fill_in 'Title', with: 'New Title'
    click_button 'Update Post'
    expect(page).to have_content('New Title')
    expect(current_path).to eq '/posts'
  end
end