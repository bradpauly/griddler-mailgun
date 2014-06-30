module Griddler
  module Mailgun
    class Adapter
      def initialize(params)
        @params = params
      end

      def self.normalize_params(params)
        adapter = new(params)
        adapter.normalize_params
      end

      def normalize_params
        {
          to: to_recipients,
          cc: cc_recipients,
          from: determine_sender,
          subject: params[:subject],
          text: params['body-plain'],
          html: params['body-html'],
          attachments: attachment_files,
          headers: headers
        }
      end

      private

      attr_reader :params

      def determine_sender
        sender = param_or_header(:From)
        sender ||= params[:sender]
      end

      def to_recipients
        to_emails = param_or_header(:To)
        to_emails ||= params[:recipient]
        to_emails.split(',').map(&:strip)
      end

      def cc_recipients
        cc = param_or_header(:Cc) || ''
        cc.split(',').map(&:strip)
      end

      def headers
        @headers ||= extract_headers
      end

      def extract_headers
        extracted_headers = {}
        if params['message-headers']
          parsed_headers = JSON.parse(params['message-headers'])
          parsed_headers.each{ |h| extracted_headers[h[0]] = h[1] }
        end
        ActiveSupport::HashWithIndifferentAccess.new(extracted_headers)
      end

      def param_or_header(key)
        if params[key].present?
          params[key]
        elsif headers[key].present?
          headers[key]
        else
          nil
        end
      end

      def attachment_files
        attachment_count = params['attachment-count'].to_i

        attachment_count.times.map do |index|
          params.delete("attachment-#{index+1}")
        end
      end
    end
  end
end
