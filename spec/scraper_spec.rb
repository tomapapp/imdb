# data for #fetch_movies_url:
# [
#   "http://www.imdb.com/title/tt0111161/",
#   "http://www.imdb.com/title/tt0068646/",
#   "http://www.imdb.com/title/tt0071562/",
#   "http://www.imdb.com/title/tt0468569/",
#   "http://www.imdb.com/title/tt0050083/"
# ]

require_relative '../scraper'

describe "#fetch_movie_urls" do
  it 'should scrape top 5 urls from imdb' do
    actual = fetch_movies_url
    expected = [
      "http://www.imdb.com/title/tt0111161/",
      "http://www.imdb.com/title/tt0068646/",
      "http://www.imdb.com/title/tt0071562/",
      "http://www.imdb.com/title/tt0468569/",
      "http://www.imdb.com/title/tt0050083/"
    ]

    expect(actual).to eq(expected)
  end
end




# data for #scrape_movie:
# {
#   cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
#   director: "Christopher Nolan",
#   storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
#   title: "The Dark Knight",
#   year: 2008
# }