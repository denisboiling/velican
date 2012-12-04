module Devise
  module Models
    module Confirmable
      extend ActiveSupport::Concern

      included do
        after_save :send_confirmation_instructions, :if => :now_available?
      end

      protected

      def now_available?
        self.available_change == [false, true]
      end

      def send_on_create_confirmation_instructions
        return unless self.available?
        send_devise_notification(:confirmation_instructions)
      end

    end
  end
end
