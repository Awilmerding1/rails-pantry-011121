class CustomFormBuilder < ActionView::Helpers::FormBuilder

  #  def fields_for(association)
  #   association_attributes_method = "#{association}_attributes="
  #   object_class_downcase = self.object.class.to_s.downcase
  #   association_attributes = "#{association}_attributes"
  #    if object.methods.include?(association.to_sym) && object.methods.include?(association_attributes_method.to_sym)
  #       object.send(association).each_with_index.map do |a, i|
  #           new_object_name = "#{object_class_downcase}[#{association_attributes}][#{i}]"
  #           new_form_builder = CustomFormBuilder.new(new_object_name, a, @template, @options)
  #         # binding.pry
  #         yield(new_form_builder)
  #         if a.id
  #           hidden_field(:id)
  #         end
  #       end
  #    end.join("").html_safe
  # end

  def my_fields_for(association, collection=nil)
   association_attributes_method = "#{association}_attributes="
   object_class_downcase = self.object.class.to_s.downcase
   association_attributes = "#{association}_attributes"
   # binding.pry
    if object.methods.include?(association.to_sym) && object.methods.include?(association_attributes_method.to_sym)

        collection_for_iteration = collection ||  object.send(association)

       collection_for_iteration.each_with_index.map do |a, i|
           new_object_name = "#{object_class_downcase}[#{association_attributes}][#{i}]"
           new_form_builder = CustomFormBuilder.new(new_object_name, a, @template, @options)

         yield(new_form_builder)
         # binding.pry
         if a.id
           new_form_builder.hidden_field(:id)
         end
       end
    end.join("").html_safe
 end

end
