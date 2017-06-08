class ItenaryPage
	include Capybara::DSL

	def visit_page(itenary)
		visit("/itenaries/#{itenary.id}")
		self
	end

	def print_pdf
		click_on("Create PDF document")
		self
	end

end