class AddAttachmentCrestToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :crest
    end
  end

  def self.down
    remove_attachment :teams, :crest
  end
end
