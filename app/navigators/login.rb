class Login < Crabfarm::BaseNavigator

  def run
    browser.goto "www.bice.cl"

    browser.search(".navbar-home .hidden-tablet a:contains('Empresas')").click

    browser.search("body").wait(:present).search("a.login").click

    login_box = browser.goto(frame: browser.search("iframe.cboxIframe"))
    login_box.search("#optionsRadios2").set true
    login_box.search("#inputRut").set params[:rut]
    login_box.search("#inputPassword").set params[:password]
    login_box.search("button:contains('Entrar')").click

    {} #bugfix
  end

end
