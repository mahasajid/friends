class MyFormBuilder < ActionView::Helpers::FormBuilder
  
    def prefix(first_name, options={})
        first_n = "Mr".concat(first_name.to_s) if options[:mr]
        first_n = "Miss".concat(first_name.to_s) if options[:ms]

        return first_n
    end
    
  end