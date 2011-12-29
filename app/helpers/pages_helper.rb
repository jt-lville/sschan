 module PagesHelper
  #Return the Correct Title
  def title
    base_title = "SSChan"
    #if @title.nil?
     # base_title
    #else
     # "#{base_title} | #{@title}"
    #end
  end

  def random_phrase

    r_num = rand(10)
    str = ""

    if r_num == 0
      str = "C'mon Simon! Use your fighting spirit!"
    elsif r_num == 1
      str = "I'm not going there to die. I'm going to see if I'm really alive. "
    elsif r_num == 2
      str = "Do you know where hell is...? It's in your mind."
    else
      str = "Elements of Harmony...I know I've heard that from somewhere."
    end

    return str

  end

end
