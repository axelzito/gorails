# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  email                   :string           default("")
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :string
#  last_sign_in_ip         :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  first_name              :string
#  last_name               :string
#  cpf                     :string
#  nickname                :string
#  provider                :string
#  uid                     :string
#  avatar                  :string
#  cover_photo             :string
#  bio                     :text
#  job_title               :string
#  company                 :string
#  gender                  :string
#  phone                   :string
#  celphone                :string
#  schooling               :string
#  birth_date              :date
#  marital_status          :string
#  father                  :string
#  mother                  :string
#  rg                      :string
#  consignor_organ         :string
#  place_of_birth          :string
#  special_needs           :string
#  occupation              :string
#  address                 :string
#  neighborhood            :string
#  zip_code                :string
#  complement              :string
#  need_certificate        :boolean
#  digital_certificate     :boolean
#  printed_certificate     :boolean
#  receber_email           :boolean          default(TRUE)
#  receber_email_parceiros :boolean          default(TRUE)
#  city                    :string
#  geography_state_id      :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'cpf_faker'

FactoryBot.define do
  factory :user do
    nickname 'MyNickName'
    first_name 'MyFirstName'
    last_name 'MyLastName'
    password '12345678'
    password_confirmation '12345678'
  end

  factory :user_with_cpf, parent: :user do
    email { generate(:email) }
    cpf { Faker::CPF.numeric }
  end

  factory :user_without_cpf, parent: :user do
    email { generate(:email) }
    cpf nil
  end

end
