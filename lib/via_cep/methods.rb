# frozen_string_literal: true

module ViaCep
  #
  # Constant with the params mapped
  #
  # return Hash
  #
  METHODS = {
    zipcode: :cep,
    street: :logradouro,
    complement: :complemento,
    neighborhood: :bairro,
    city: :localidade,
    state: :uf,
    ibge: :ibge,
    gia: :gia,
    error: :erro,
    ddd: :ddd,
    siafi: :siafi
  }.freeze
end
