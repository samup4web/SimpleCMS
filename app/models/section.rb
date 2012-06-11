require 'lib/assets/position_mover'
class Section < ActiveRecord::Base

  include positionMover

  belongs_to :page
  has_many :section_edits

  attr_accessible :page_id, :name, :position, :visible, :content_type, :content

  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
                         :message => "must be one of : #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('sections.position ASC')

  private

  def position_scope
    "sections.subject_id = #{page_id.to_i}"
  end

end
