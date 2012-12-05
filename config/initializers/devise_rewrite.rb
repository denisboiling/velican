module Devise
  module Models
    module Confirmable
      extend ActiveSupport::Concern

      included do
        before_save :generate_confirmation_token, :if => :now_available?
        after_save :send_activation_message, :if => :now_available?
      end

      protected

      def now_available?
        self.available_change == [false, true]
      end

      def send_activation_message
        send_devise_notification(:confirmation_instructions)
      end

      def send_on_create_confirmation_instructions
        return unless self.available?
        super
      end

    end
  end
end
