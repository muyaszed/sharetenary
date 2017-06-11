require 'rails_helper'
require_relative '../support/login_form'
require_relative '../support/itenary_page'

feature "pdf generation" do
	let(:user) {FactoryGirl.create(:user_with_itenaries)}
	let(:itenary) {user.itenaries.last}
	let(:login_form) {LoginForm.new}
	let(:itenary_page) {ItenaryPage.new}
	
	scenario "authenticate user can generate a pdf file through a link" do
		

		login_form.visit_page.sign_in(user)
		itenary_page.visit_page(itenary).print_pdf
		
		expect(page.response_headers).to have_content("application/pdf")
		convert_pdf_to_page
		expect(page).to have_content("#{itenary.title}")
	end
end

def convert_pdf_to_page
  temp_pdf = Tempfile.new('pdf')
  temp_pdf << page.source.force_encoding('UTF-8')
  reader = PDF::Reader.new(temp_pdf)
  pdf_text = reader.pages.map(&:text)
  temp_pdf.close
  page.driver.response.instance_variable_set('@body', pdf_text)
end