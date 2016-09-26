# encoding: utf-8
# frozen_string_literal: true
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'via_cep'
