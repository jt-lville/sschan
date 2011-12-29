module CommentsHelper
  
  
#  def update_status
#    @comment.relative_value = @comment.points_up - @comment.points_down
#    
#    randomize!
#  end
#  
#  def randomize! #this performs a random shuffle of comments with similar relative values
#    #ensures that all posts of equal value have an equal chance of being read
#    
#    @comment.relative_value += (rand() - 0.5)/10.0
#    @comment.save
#  end

  def filter_comment(c)

    c1 = c.content

    str1 = '<p class = "unkfunc">'
    str2 = '</p>'

    arr_lines = c1.split('\n') #split the text into lines

    arr_lines.each do |a|
      if a[0] == ">"
        a.insert(0, str1) #add the greentext tag
        a << str2 #close the greentext tag
        #a << "DERP"
      end
    end

    c1 = ""

    arr_lines.each do |a|
      strtmp = '\n'
      if arr_lines.index(a) == (arr_lines.size - 1) #recombine the lines into text
        strtmp = ""
      end
      c1 += a + strtmp
    end


    c2 = c1.gsub("\n", '<br/>').html_safe

    c2 = c2.gsub("eels bad man", "eelings baddingly mans").html_safe #troll wordfilters
    c2 = c2.gsub("eels good man", "eelings baddingly mans").html_safe
    c2.gsub("ucking", "ookin'").html_safe

  end
  
end
