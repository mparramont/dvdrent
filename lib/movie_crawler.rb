class MovieCrawler

	def initialize
		base_url = "http://www.rottentomatoes.com"
		url = base_url + "/top/bestofrt/?year=2014"

		page = Nokogiri::HTML(open(url))
		links = page.css('div.content_body table .articleLink')

    i = 0
		links.each do |link|
			puts i
			i = i + 1
		begin
			movie_page = Nokogiri::HTML(open(base_url + link['href']))
			title = movie_page.css(".movie_title span").first.text.strip.delete("(2014)")
			puts title
			description = movie_page.css("#movieSynopsis").text
			description = description.slice(0..(description.index('More')))
			description = description.strip
			puts description
			image_url = movie_page.css(".posterImage").first['src']

			Movie.create(title: title, description: description, cover: open(image_url))
		rescue => exception
		  puts exception.backtrace
		end

	end

end
