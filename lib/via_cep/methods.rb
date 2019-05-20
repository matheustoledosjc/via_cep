# encoding: utf-8
# frozen_string_literal: true

module ViaCep
  # Translate methods allows us to use metaprogramming.
  METHODS = {
    zipcode: 'cep',
    street: 'logradouro',
    complement: 'complemento',
    neighborhood: 'bairro',
    city: 'localidade',
    state: 'uf',
    ibge: 'ibge',
    gia: 'gia'
  }.freeze
end
