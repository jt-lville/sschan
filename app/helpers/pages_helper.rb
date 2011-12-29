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

  def random_lily_url

    str = "lily/lily"

    r_num = rand(5) + 1

    str+= r_num.to_s + ".png"

  end

  def random_banner_url

    str = "banners/banner"
    r_num = rand(5) + 1

    str += r_num.to_s + ".png" #choose banners in the form 'bannerX.png'

    return str

  end

  def random_phrase

    r_num = rand(17)
    str = ""

    if r_num == 0
      str = "C'mon Simon! Use your fighting spirit!"
    elsif r_num == 1
      str = "I'm not going there to die. I'm going to see if I'm really alive. "
    elsif r_num == 2
      str = "Do you know where hell is...? It's in your mind."
    elsif r_num == 3
      str = "Yours is the drill that will bust through the heavens!"
    elsif r_num == 4
      str = "Good news, everyone!"
    elsif r_num == 5
      str = "Soup's on, everypony!"
    elsif r_num == 6
      str = "Musn't run away...Musn't run away..."
    elsif r_num == 7
      str = "Courage is that magic that turns dreams into reality."
    elsif r_num ==8
      str = "Objection!"
    elsif r_num == 9
      str = "A gentleman never leaves a puzzle unsolved."
    elsif r_num == 10
      str = "Just who the hell do you think I am?!"
    elsif r_num == 11
      str = "Take this!! My love! my anger! and all of my sorrow!"
    elsif r_num == 12
      str = "Don't you think dreams and the Internet are similar? They are both areas where the repressed conscious mind vents."
    elsif r_num == 13
      str = "This is a foolish place to be... to inquire about the master of this dream."
    elsif r_num == 14
      str = "We can forget happy things. We can probably forget sad things too. People have the power to forget."
    elsif r_num == 15
      str = "The people would restart their lives in a simple, peaceful village, in the kind of place they wished they had grown up in."
    else
      str = "Elements of Harmony...I know I've heard that from somewhere."
    end

    return str

  end

end
