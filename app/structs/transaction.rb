class Transaction < Crabfarm::BaseStruct

  has_string :document, default: ""
  has_string :description, default: ""
  has_float :amount
  has_field :date
  has_float :balance

  def signed_amount(negative, positive)
    negative = assert(negative).is_i default: nil, thousand_mark: '.'
    positive = assert(positive).is_i default: nil, thousand_mark: '.'

    raise Crabfarm::AssertionError, 'invalid amounts' if negative.nil? && positive.nil?

    self.amount = (negative.nil? || negative == 0) ? positive : -negative
  end

  def is_signed?
    !self.signature.nil?
  end

end
