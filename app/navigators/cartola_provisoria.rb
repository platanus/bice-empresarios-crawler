class CartolaProvisoria < Crabfarm::BaseNavigator

  def run

    menu = browser.search("#nav-list li:contains('Cuentas MN')")
    menu.search("a:first").click
    menu.search("a:contains('Cartola Provisoria')").click

    reduce_with_defaults
  end

end
