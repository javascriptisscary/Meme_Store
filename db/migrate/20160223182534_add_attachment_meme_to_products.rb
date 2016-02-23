class AddAttachmentMemeToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :meme
    end
  end

  def self.down
    remove_attachment :products, :meme
  end
end
