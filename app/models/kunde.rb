class Kunde < ApplicationRecord
   validates_presence_of :email
   validates_presence_of :telefon
   validates_presence_of :url
   validates :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }
   validates :url, :url => true

end
