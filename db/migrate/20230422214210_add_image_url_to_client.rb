class AddImageUrlToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :image_url, :string, default: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fmissing.png?alt=media&token=cdb32fbb-6c4d-4814-92cf-6aa36b136ee6'
  end
end
