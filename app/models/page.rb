require 'lib/assets/position_mover'
class Page < ActiveRecord::Base

  include positionMover

  belongs_to :subject
  has_many :sections

  attr_accessible :name, :permalink, :position, :visible, :subject_id

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  validates_uniqueness_of :permalink

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('pages.position ASC')

  private

  def position_scope
    "pages.subject_id = #{subject_id.to_i}"
  end

end
