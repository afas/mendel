class SearchController < ApplicationController
  def results
    if params[:q_search]
      search_phrase = params[:q_search]
      search_phrase = search_phrase.split()
      condition = ""

      search_phrase.each do |phrase|
        if condition == ""
          condition = "title like '%#{phrase}%' OR short_description like '%#{phrase}%' OR content like '%#{phrase}%'"
        else
          condition = condition + " or title like '%#{phrase}%' OR short_description like '%#{phrase}%' OR content like '%#{phrase}%'"
        end
      end

      @articles = Article.where(condition)
    end
  end
end
