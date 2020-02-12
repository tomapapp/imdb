require 'open-uri'
require 'nokogiri'

def fetch_movies_url
  # scrape https://www.imdb.com/chart/top

  top_url = []
  html_file = open("https://www.imdb.com/chart/top/").read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.titleColumn a').each do |element|
    top_url << "http://www.imdb.com" + element.attribute('href').value
  end



  # identify which class to scrape
  # .lister-item-header
  # target the class using nokogiri method... #search
  # #search output is an array
  # take only first 5 with #first method #take
  # iterate the attribute --> href
  # push the value of href into top_url

  return top_url.first(5)


  # output
  # [
  #   "http://www.imdb.com/title/tt0111161/",
  #   "http://www.imdb.com/title/tt0068646/",
  #   "http://www.imdb.com/title/tt0071562/",
  #   "http://www.imdb.com/title/tt0468569/",
  #   "http://www.imdb.com/title/tt0050083/"
  # ]
end

p fetch_movies_url

def scrape_movie(url)
  # scrape individual movie url
  movie_hash = {}
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.credit_summary_item h1').map do |element|
    movie_hash[element.text.strtip] = 1
  end
  return movie_hash

  # {
  #   cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
  #   director: "Christopher Nolan",
  #   storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
  #   title: "The Dark Knight",
  #   year: 2008
  # }
end

p scrape_movie("http://www.imdb.com/title/tt0050083/")
