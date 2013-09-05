Refinery::Page.class_eval do
  # Whitelist the :background_image_id parameter for form submission
  attr_accessible :featured, :sitemap

end