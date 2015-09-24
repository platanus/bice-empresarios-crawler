require 'spec_helper'

describe Login do

  it "should login", navigating: 'bice-empresarios' do
    navigate rut: '11.111.111-1', password: '1234'
    expect(browser.search("#utilitarios").wait(:present).text.include? 'Cerrar Sesión').to be(true)
  end

end
