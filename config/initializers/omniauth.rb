Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '223287611071138', '157a0139342acc03aea261a37ac47e78'
end