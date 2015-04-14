# == Schema Information
#
# Table name: bank_users
#
#  id         :integer          not null, primary key
#  bank_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe BankUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
