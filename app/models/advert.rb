class Advert < ActiveRecord::Base
	has_one :order
	belongs_to :model

	has_attached_file :picture, styles: { top: "800x500#", default: "700x400#", small: "100x50#", show: "700x300#" }, default_url: "/images/:style/missing.png"

	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
