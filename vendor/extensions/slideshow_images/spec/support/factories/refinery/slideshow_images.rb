
FactoryGirl.define do
  factory :slideshow_image, :class => Refinery::SlideshowImages::SlideshowImage do
    sequence(:header) { |n| "refinery#{n}" }
  end
end

