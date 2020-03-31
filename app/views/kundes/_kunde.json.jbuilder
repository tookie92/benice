json.extract! kunde, :id, :name, :email, :url, :ansprechpartner, :telefon, :created_at, :updated_at
json.url kunde_url(kunde, format: :json)
