require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Zoho < OmniAuth::Strategies::OAuth2

      option :client_options, {
          :site          => 'https://accounts.zoho.com',
          :authorize_url => '/oauth/v2/auth',
          :token_url     => '/oauth/v2/token'
      }

      option provider_ignores_state: true
      option :authorize_options, %i[access_type prompt scope]

      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |k|
            params[k] = request.params[k.to_s] unless [nil, ''].include?(request.params[k.to_s])
          end

          params[:access_type] = 'offline' if params[:access_type].nil?
        end
      end

      def callback_phase
        options[:client_options][:site] = request.params['accounts-server']
        super
      end

      def build_access_token
        token = super
        token.client.site = token.params['api_domain']
        token
      end

      uid{ raw_info['id'] }

      info do
        {
            :email => raw_info['primary_email'],
            :api_domain => access_token.params['api_domain']
        }
      end

      extra do
        {
            'raw_info' => raw_info
        }
      end

      credentials do
        hash = {"token" => access_token.token}
        hash.merge!("refresh_token" => access_token.refresh_token) if access_token.refresh_token
        hash.merge!("expires_at" => Time.now.to_i + access_token.params['expires_in_sec'].to_i) if access_token.params['expires_in_sec']
        hash.merge!("expires" => access_token.expires?)
        hash
      end

      def raw_info
        endpoint = access_token.params['api_domain']
        @raw_info ||= access_token.get("#{endpoint}/crm/v2/org").parsed['org'].first
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
