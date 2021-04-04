# frozen_string_literal: true

module ViaCep
  class Instance
    #
    # Default class to define methods based on the response
    #
    # return [ViaCep::Instance]
    #
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
