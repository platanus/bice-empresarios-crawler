require 'spec_helper'

describe CartolaProvisoria do
  before do
    navigate :login, rut: '11.111.111-1', password: '1234'
  end

  let!(:reducer) { spy_reducer CartolaProvisoriaReducer }

  it "should get the balance sheet", navigating: 'bice-empresarios' do
    navigate
    expect(browser.search("#contenido_columnas").text).to include("Saldo Contable:")
  end
end
