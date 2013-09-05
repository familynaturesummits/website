module Refinery
  module BaButtons
    module Admin
      class BaButtonsController < ::Refinery::AdminController

        crudify :'refinery/ba_buttons/ba_button', :xhr_paging => true

      end
    end
  end
end
