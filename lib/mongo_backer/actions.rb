module MongoBacker
  module Actions
   include Thor::Actions
   
   def ask_with_default (msg, default_value)
     answer = ask(msg + "(#{default_value})")
     
     if answer.nil? or answer.empty?
       answer = default_value
     end
     
     answer
   end
   
  end
end