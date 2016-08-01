module ViaCep
	module Validators
		module State
			class << self
				def valid?(state)
					self.states.include?(state.to_s)
				end

				def states
					%w(AC AL AP AM BA CE DF ES GO MA MT MS MG PR PB PA PE PI RJ RN RS RO RR SC SE SP TO)
				end
			end
		end
	end
end
