module ActionCable
  module Connection
    class Base
      # rubocop:disable Metrics/MethodLength
      def handle_open
        ActiveSupport::Notifications.instrument('connect.action_cable', notification_payload('connect')) { super }
      end
      # rubocop:enable Metrics/MethodLength

      def handle_close
        ActiveSupport::Notifications.instrument('disconnect.action_cable', notification_payload('disconnect')) { super }
      end

      private

      def notification_payload(method_name)
        { connection_class: self.class.name, action: method_name, data: request.params }
      end
    end
  end
end
