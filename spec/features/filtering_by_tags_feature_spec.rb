require 'spec_helper'

describe 'filtering by tags ' do 
  before do
    tag = create(:tag, name: 'yolo')

    tagged = create(:post, title: 'Something')
    create(:post, title: 'Another')

    tagged.tags << tag
  end

  it 'can filer by clicking on a tag' do
    visit '/posts'
    click_link '#yolo'

    expect(page).to have_content 'Something'
    expect(page).to_not have_content 'Another'
  end
  
end