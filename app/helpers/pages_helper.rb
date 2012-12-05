 module PagesHelper
  #Return the Correct Title
  def title
    base_title = "sschan"
    #if @title.nil?
     # base_title
    #else
     # "#{base_title} | #{@title}"
    #end
  end

  def news_line(line_num)

   counter = 1
   file = File.new("newslog.txt", "r")
   while (line = file.gets)

      if counter == line_num

        file.close
        return line

      end
      
      counter = counter + 1
      
  end
  file.close

  end

  def current_version_text

   counter = 1
   file = File.new("versionlog.txt", "r")
   while (line = file.gets)

      if counter == 1
        file.close
        return line
      end

      counter = counter + 1
      
  end
  file.close

  end

  def random_frontpage_yt_url

    yt_links = ["http://www.youtube.com/embed/IdHTnpgpLDc", "http://www.youtube.com/embed/HNrwhRkB_O4",
                "http://www.youtube.com/embed/nUQ1Y8nPz0Q", "http://www.youtube.com/embed/GlVwxSfaYhs", #original 4
                "http://www.youtube.com/embed/2R677MV--WI", "http://www.youtube.com/embed/bxzTrWUajZg",
                "http://www.youtube.com/embed/6-uMkAWj28o", "http://www.youtube.com/embed/TjkSyQHQddo",
                "http://www.youtube.com/embed/4dGJKh9hLTs", "http://www.youtube.com/embed/4wsNJ9K9ROw",
                "http://www.youtube.com/embed/gCCbIkCcRKk", "http://www.youtube.com/embed/KckGp2Hz9yU",
                "http://www.youtube.com/embed/4p8cH380Mrg", "http://www.youtube.com/embed/qeIqZWfVZqY", # layton battle, vow
                "http://www.youtube.com/embed/aG6OxCmWwtM", "http://www.youtube.com/embed/9PCEp8z7FNg" #romeo cinderella, nightmare
                ]

    return yt_links[rand(yt_links.size)]

  end

  def random_lily_url

    str = "lily/lily"

    r_num = rand(5) + 1

    str+= r_num.to_s + ".png"

  end

  def random_banner_url

    str = "banners/banner"
    r_num = rand(9) + 1

    str += r_num.to_s + ".png" #choose banners in the form 'bannerX.png'

    return str

  end

  def random_phrase

    phrases = [ "C'mon Simon! Use your fighting spirit!",
 "I'm not going there to die. I'm going to see if I'm really alive. ",
 "Do you know where hell is...? It's in your mind.",
"Your drill is the drill that's gonna bust straight through heaven and earth and even tomorrow!",
 "Good news, everyone!",
 "Soup's on, everypony!",
"Musn't run away...Musn't run away...",
"Courage is that magic that turns dreams into reality.",
 "Objection!",
 "A gentleman never leaves a puzzle unsolved.",
"Just who the hell do you think I am?!",
  "Take this!! My love! my anger! and all of my sorrow!",
 "Don't you think dreams and the Internet are similar? They are both areas where the repressed conscious mind vents.",
 "This is a foolish place to be... to inquire about the master of this dream.",
 "We can forget happy things. We can probably forget sad things too. People have the power to forget.",
  "The people would restart their lives in a simple, peaceful village, in the kind of place they wished they had grown up in.",
 "Elements of Harmony...I know I've heard that from somewhere.",
 "A train robbery is where you take a train to your destination, make your move, and take a train back, right?",
"Then... I'll spit on the car!",
"Is this the sad end of a materialistic culture?",
"Banishment, this world!",
"Could it be that the corner of an endless world of 4.5 tatami worlds I believed so strongly I was traveling through was in fact a small loop?",
"I had thought the days were all wasted, but they were such a bounty!",
"Always dreaming of the unrealistic, I never looked at what I had right around me...",
"That was the life I chose. And this is the result I wished for.",
"If a bowl of fresh cooked rice were placed before me, I am sure tears would flood down from my eyes in torrents!",
"That world is what I would call ... Paradise."
"Ozu, it's me!",
"You say some pretty mean things, you know.",
"Don't you see? We are connected by the black thread of fate." ]

    return phrases[rand(phrases.size)]

  end

end
