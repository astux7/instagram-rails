require 'spec_helper'

describe 'Create a post' do
  it ' should create a pot ' do
    visit '/posts/new'
    fill_in 'Title', with: 'First Post'
    fill_in 'Content', with: 'First Content'
    click_button 'Create Post'
    expect(page).to have_content 'First Post'
    expect(page).to have_content 'First Content'
    expect(current_path).to eq '/posts'
  end
end