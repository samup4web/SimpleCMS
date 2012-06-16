class DemoController < ApplicationController

  def index

  end


  def javascript

  end

  def escape_output

  end

  def make_error
    #render(:text => "test #syntax error
    #render(:text => @somethin.upcase) #undefined method
    #render(:text => "1" + 1) #can't convert'
  end
end
