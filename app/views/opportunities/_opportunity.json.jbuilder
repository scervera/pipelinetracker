json.extract! opportunity, :id, :customer_name, :stage, :quantity, :created_at, :updated_at
json.url opportunity_url(opportunity, format: :json)
