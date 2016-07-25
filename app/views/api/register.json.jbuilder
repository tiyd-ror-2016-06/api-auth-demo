json.user @user, :id, :email, :created_at
json.token         @token.nonce
json.token_expires @token.expires_at
