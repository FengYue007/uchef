class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private
   def not_found
     render file: "#{Rails.root}/public/404.html",
            status: 404
   end
end
