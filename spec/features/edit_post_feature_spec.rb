require 'spec_helper'

describe 'Edit post' do 
  before do
    create(:post)
  end

  it 'should Edit post title' do
    visit '/posts'
    click_link 'Edit post'
    fill_in 'Title', with: 'New Title'
    fill_in 'Content', with: 'New Content'
    click_button 'Update Post'
    expect(page).to have_content('New Title')
    expect(page).to have_content('New Content')
    expect(current_path).to eq '/posts'
  end
end