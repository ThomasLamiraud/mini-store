class AddPaperclipToAdvert < ActiveRecord::Migration
  def change
    add_attachment :adverts, :picture
  end
end
