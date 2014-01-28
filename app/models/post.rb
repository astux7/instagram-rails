class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, styles: { thumb: "300x300>"}, storage: :s3, s3_credentials: {
    access_key_id: 'AKIAIKOZJMHN7J6CNKSA',
    secret_access_key: Rails.application.secrets.s3_secret
  },
  bucket: Rails.application.secrets.s3_bucket 
  has_and_belongs_to_many :tags



  def tag_names
    tags.map {|tag| tag.name}.join(', ')
  end

  def tag_names=(tag_names)
    self.tags = tag_names.split(/,\s?/).map do |tag_name|
      tag_name.downcase.gsub(/[^a-z]/, '')
      Tag.find_or_create_by(name: tag_name)
    end
  end

  def self.for_tag_or_all(tag_name)
    tag_name.nil? ?  all :  Tag.find_by(name: tag_name).posts
  end
end
