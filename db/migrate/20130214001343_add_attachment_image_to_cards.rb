class AddAttachmentImageToCards < ActiveRecord::Migration
  def self.up
    change_table :cards do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :cards, :image
  end
end
