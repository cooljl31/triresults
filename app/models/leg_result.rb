class LegResult
  include Mongoid::Document
  field :secs, type: Float

  embedded_in :entrant
  embeds_one :event, as: :parent

  validates_presence_of :event

  def calc_ave
  end

  def secs= seconds
    self[:secs] = seconds
    calc_ave
  end

  after_initialize do |leg_result|
    calc_ave
  end
end