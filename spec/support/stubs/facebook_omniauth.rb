def stub_facebook_auth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    provider: 'facebook',
    uid: '850442195103609',
    info: {
      email: 'njacques9@yahoo.com',
      name: 'Nicholas Jacques',
      image: 'http://graph.facebook.com/v2.6/850442195103609/picture'
    },
    credentials: {
      token: 'EAAYPAHkaK4sBABQsyrTslc98vv0QFFJv9kZCAhAKm7gzMtr9MOvZCPENY9Ir7REvWJSbnkk40JjM6BnEmFoM8hzjjjg243t7QRIKXsfkZCQlDzEDzmveC4UHoQ6tbP9IZAxiqcsjRPZAmZARafHubUOZBz7xpQrnPdmZB7I5SSqq2wZDZD',
      expires_at: 1506208266,
      expires: true
    },
    extra: {
      raw_info: {
        name: 'Nicholas Jacques',
        email: 'njacques9@yahoo.com',
        id: '850442195103609'
        }
      }
    })
end