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

    green_text_count = c1.scan(">").length

    green_text_indices = []
    newline_indices = []
    
    str1 = '<p class = "unkfunc">'
    str2 = '</p>'

    offset = 0
    while green_text_count > 0

      green_text_index = c1.index(">", offset)

      if green_text_index == nil
        break
      end

      newline_index = c1.index("\n", offset)

      green_text_indices << green_text_index
 
      if newline_index == nil
        newline_indices << c1.size-1
      else
        newline_indices << newline_index
      end

      offset = green_text_index+1
      green_text_count -= 1

    end

    i = 0
    green_text_indices.each do |g|

      c1.insert(g + i*(str1.size), str1)
      i += 1
    end

    i = 0
    newline_indices.each do |n|

      c1.insert(n + i*(str2.size), str2)
      i += 1
    end

#    c1 = c1.gsub('>', str1+">").html_safe ##greentext
#    c1 = c1.gsub('\n', str2+"\n").html_safe ##greentext

    c2 = c1.gsub("\n", '<br/>').html_safe

    c2 = c2.gsub("eels bad man", "eelings baddingly mans").html_safe #troll wordfilters
    c2 = c2.gsub("eels good man", "eelings baddingly mans").html_safe
    c2.gsub("ucking", "ookin'").html_safe

  end
  
end
