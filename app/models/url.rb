class Url < ActiveRecord::Base
  # This is Sinatra! Remember to create a migration!

  #random_url = [*'0'..'9',*'A'..'Z',*'a'..'z']Array.new(100){ range.sample }.join
  #This creates a range array using the ranges from before as well as the splat operator (that is, *). If you haven't seen this before, the splat operator creates a list of the items that would otherwise be an array, turning *0..9 into 0, 1, 2, 3... etc. Then new array of size 100 is created with all random items pulled from the array, then joined together as a string.

  #random_url = SecureRandom.hex(3)
  #hex generates a random hex string. The argument n specifies the length of the random length. The length of the result string is twice of n.
  
  #this is a callback method that gets runned each time the Url.create instruction is given. It runs even before the instruction to create is being runned.
  before_create :shorten

  def shorten
    # random = [*'0'..'9',*'A'..'Z',*'a'..'z']Array.new(10){ range.sample }.join
    # self.random_url = [*'0'..'9',*'A'..'Z',*'a'..'z']Array.new(10){ range.sample }.join
    self.url_short = SecureRandom.hex(3) #url_short is the column name in the database
    # self.url_short = "http://www.bitly.com/#{random}"
  end

  def counting_clicks
    self.click_count +=1 #click_count is the column name in the database.
    self.save
  end
end