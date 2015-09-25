require 'spec_helper'

describe CartolaProvisoriaReducer do
  it "should return the transactions", reducing: 'cartola', live: true do
    expect(reducer.transactions).not_to be_empty
  end

  it "should parse the date", reducing: 'cartola' do
    expect(reducer.transactions[0].date).to eq("25-09")
  end

  it "should parse the document", reducing: 'cartola' do
    expect(reducer.transactions[9].document).to eq("39825641")
  end

  it "should parse the description", reducing: 'cartola' do
    expect(reducer.transactions[0].description).to eq('Cargo por compra en PETROBRAS SANTA M el 24/09/2015 a las 15:36:34 hrs., monto 28004.')
  end

  it "should set value when is positive", reducing: 'cartola' do
    expect(reducer.transactions[1].amount).to eq(199052.0)
  end

  it "should set value when is negative", reducing: 'cartola' do
    expect(reducer.transactions[0].amount).to eq(-28004.0)
  end

  it "should get the balance", reducing: 'cartola', live:'true' do
    expect(reducer.transactions[1].balance).to eq(3393308.0)
  end
end
