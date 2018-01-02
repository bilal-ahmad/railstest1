class API < Grape::API
  prefix    'api'
  format    :json

  rescue_from :all, :backtrace => true

  mount V1::Clients
  mount V1::Projects
  mount V1::Employees

end