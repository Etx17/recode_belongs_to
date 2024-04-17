module ActiveRecord::Associations
  extend ActiveSupport::Concern # to have constantize and classify

  class_methods do
    def belongs_to(name, options = {})

      class_name = name.to_s.classify
      foreign_key = "#{name}_id"

      define_method(name) do
        class_name.constantize.find_by(id: send(foreign_key))
      end

      define_method("#{name}=") do |new_value|
        send("#{foreign_key}=", new_value&.id)
      end

    end
  end
end
ActiveRecord::Base.include ActiveRecord::Associations


module ActiveRecord::Associations
  extend ActiveSupport::Concern # to have constantize and classify

  class_methods do
    def belongs_to(name, options= {})
      class_name = name.to_s.classify || options[:class_name].to_s.classify
      foreign_key = options[:foreign_key] || "#{name}_id"

      define_method(name) do
        class_name.constantize.find_by(id: send(foreign_key)) # le send(foreign_key) ! crucial car send est sur la classe
        # def user
        #   User.find_by(id: user_id)
        # end
      end

      define_method("#{name}=") do |new_value|
        send("#{foreign_key}=", new_value&.id)
        # def user=(value)
        #   self.user_id = value.id
        # end
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end


# Convertit le nom du tableau en nom de classe
table_name = "users"
class_name = table_name.classify  # Retourne "User"

# Si vous avez une table nommée de manière irrégulière
table_name = "people"
class_name = table_name.classify  # Retourne "Person"
