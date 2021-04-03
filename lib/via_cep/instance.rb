module ViaCep
  class Instance
    def define_attributes(response)
      ViaCep::METHODS.each do |method_name, response_key|
        value = response[response_key.to_s]

        instance_variable_set("@#{method_name}", value)
        self.class.define_method(method_name) do
          instance_variable_get("@#{method_name}")
        end
      end
    end
  end
end