class UserSerializer
  include FastJsonapi::ObjectSerializer
    attribute :api_key do |user|
      user.auth_token
    end
end
