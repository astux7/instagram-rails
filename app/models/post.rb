class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, styles: { thumb: "300x300>"}, storage: :s3, s3_credentials: {
    access_key_id: 'AKIAIKOZJMHN7J6CNKSA',
    secret_access_key: Rails.application.secrets.s3_secret
  },
  bucket: Rails.application.secrets.s3_bucket 
end
