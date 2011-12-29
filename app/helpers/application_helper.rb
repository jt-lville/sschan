module ApplicationHelper
  def title
    base_title = "SSChan"
    #if @title.nil?
     # base_title
    #else
     # "#{base_title} | #{@title}"
    # end
  end

    def filter_comment(c) #use for both OP's and comments

    c1 = c.content

    str1 = '<p class = "unkfunc">'
    str2 = '</p>'

    if c1 != nil
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
  
  def errorImage(user, field)
    if user.errors.any?
      registrationsErrorImage(user.errors[field].blank?, user, field)
    else
      image_tag('errors_blank.png')
    end
  end
  
  def registrationsErrorImage(is_error)
      if is_error
          image_tag('errors_check.png')
      else
        image_tag('errors_x.png')
      end
  end
end