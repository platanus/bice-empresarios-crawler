class CartolaProvisoriaReducer < Crabfarm::BaseReducer
  has_field :transactions

  def run
    self.transactions = transaction_list.map{ |t| parse_transaction(t) }
  end

  def transaction_list
    document.document.search('.//script').remove
    @transaction_list ||= search("form[name='form1'] table:eq(2) tr:not(:eq(0)):not(:eq(1))")
  end

  def parse_transaction(html)
    transaction = Transaction.new
    transaction.date = get_date(html.search("td:eq(0)"))
    transaction.document = get_document(html.search("td:eq(1)"))
    transaction.description = get_description(html.search("td:eq(2)"))
    transaction.balance = get_balance(html.search("td:eq(5)"))
    transaction.amount = get_amount(
      html.search("td:eq(4)"), # cargo
      html.search("td:eq(3)")  # abono
    )

    transaction
  end

  def get_date(date_element)
    Date.strptime(clean_str(date_element.text),"%d-%m")
  end

  def get_document(document_element)
    clean_str(document_element.text)
  end

  def get_description(description_element)
    clean_str(description_element.text)
  end

  def clean_str(string)
    string.gsub(/\t\n/,"")
  end

  def get_amount(deposit, remittance)
    deposit = get_float(deposit)
    deposit > 0 ? deposit : (get_float(remittance) * -1)
  end

  def get_float(html)
    html.text.gsub(/[^0-9]*/,"").to_f
  end

  def get_balance(balance)
    get_float(balance)
  end
end
