module Refinery
  module BaButtons
    class BaButton < Refinery::Core::BaseModel
      self.table_name = 'refinery_ba_buttons'

      attr_accessible :title, :url, :color, :position

      acts_as_indexed :fields => [:title, :url, :color]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
