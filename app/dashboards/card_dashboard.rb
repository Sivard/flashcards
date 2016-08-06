require "administrate/base_dashboard"

class CardDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    block: Field::BelongsTo,
    id: Field::Number,
    original_text: Field::Text,
    translated_text: Field::Text,
    review_date: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image: Field::String,
    interval: Field::Number,
    repeat: Field::Number,
    efactor: Field::Number.with_options(decimals: 2),
    attempt: Field::Number,
    quality: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :block,
    :id,
    :original_text,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :block,
    :id,
    :original_text,
    :translated_text,
    :review_date,
    :created_at,
    :updated_at,
    :image,
    :interval,
    :repeat,
    :efactor,
    :attempt,
    :quality,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :block,
    :original_text,
    :translated_text,
    :review_date,
    :image,
    :interval,
    :repeat,
    :efactor,
    :attempt,
    :quality,
  ].freeze

  # Overwrite this method to customize how cards are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(card)
  #   "Card ##{card.id}"
  # end
end
