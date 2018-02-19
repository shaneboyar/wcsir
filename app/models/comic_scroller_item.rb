# == Schema Information
#
# Table name: comic_scroller_items
#
#  id                :integer          not null, primary key
#  comic_scroller_id :integer
#  issue_id          :integer
#  position          :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_comic_scroller_items_on_comic_scroller_id  (comic_scroller_id)
#  index_comic_scroller_items_on_issue_id           (issue_id)
#

class ComicScrollerItem < ApplicationRecord
  belongs_to :comic_scroller
  belongs_to :issue

  validates :position, presence: true, uniqueness: { scope: :comic_scroller,
    message: "Positions must be unique within a scroller" }
  validates :issue_id, presence: true, uniqueness: { scope: :comic_scroller,
    message: "This issue already exists in this scroller" }
end
