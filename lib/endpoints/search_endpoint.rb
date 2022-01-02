require 'json'
class SearchEndpoint


  attr_accessor :query,:pageNumber, :generalSearchInput, :numberOfResultsPerPage, :pageSize, :requireAllWords

  def initialize(query,pageNumber, generalSearchInput, numberOfResultsPerPage, pageSize, requireAllWords)
    @query = query
    @pageNumber = pageNumber
    @generalSearchInput = generalSearchInput
    @numberOfResultsPerPage = numberOfResultsPerPage
    @pageSize = pageSize
    @requireAllWords = requireAllWords
  end

  def as_json(options={})
    {
      query: @query,
      pageNumber: @pageNumber,
      generalSearchInput: @generalSearchInput,
      numberOfResultsPerPage: @numberOfResultsPerPage,
      pageSize: @pageSize,
      requireAllWords: @requireAllWords
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end

