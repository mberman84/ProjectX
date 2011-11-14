if Rails.env == "production"
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '109125412535038', '132b5c601566dcbbf531e9576600dca7'
  end
else
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '223287611071138', '157a0139342acc03aea261a37ac47e78'
  end
end