require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    cards: Field::HasMany,
    blocks: Field::HasMany,
    authentications: Field::HasMany,
    current_block: Field::BelongsTo.with_options(class_name: "Block"),
    id: Field::Number,
    email: Field::String,
    crypted_password: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    salt: Field::String,
    remember_me_token: Field::String,
    remember_me_token_expires_at: Field::DateTime,
    reset_password_token: Field::String,
    reset_password_token_expires_at: Field::DateTime,
    reset_password_email_sent_at: Field::DateTime,
    current_block_id: Field::Number,
    locale: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :cards,
    :blocks,
    :authentications,
    :current_block,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :cards,
    :blocks,
    :authentications,
    :current_block,
    :id,
    :email,
    :crypted_password,
    :created_at,
    :updated_at,
    :salt,
    :remember_me_token,
    :remember_me_token_expires_at,
    :reset_password_token,
    :reset_password_token_expires_at,
    :reset_password_email_sent_at,
    :current_block_id,
    :locale,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :cards,
    :blocks,
    :authentications,
    :current_block,
    :email,
    :crypted_password,
    :salt,
    :remember_me_token,
    :remember_me_token_expires_at,
    :reset_password_token,
    :reset_password_token_expires_at,
    :reset_password_email_sent_at,
    :current_block_id,
    :locale,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
