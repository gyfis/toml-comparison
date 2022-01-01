#!/usr/bin/env ruby

require_relative '../implementations/toml/lib/toml'
require 'json'

def replace_primitives(object)
    if object.is_a?(Hash)
        object.map do |key, value|
            [key, replace_primitives(value)]
        end.to_h
    elsif object.is_a?(Array)
        object.map { |value| replace_primitives(value) }
    elsif object.is_a?(Time) || object.is_a?(DateTime)
        { "type": "datetime", "value": object.to_s }
    elsif object.is_a?(Float)
        value = 
            if object.nan?
                'nan'
            elsif object.infinite? == -1
                '-inf'
            elsif object.infinite? == 1
                '+inf'
            else
                object.to_s
            end

        { "type": "float", "value": value }
    elsif object.is_a?(Numeric)
        { "type": "integer", "value": object.to_s }
    elsif object.is_a?(String)
        { "type": "string", "value": object }
    elsif [true, false].include?(object)
        { "type": "bool", "value": object.to_s }
    end
end

input = ARGF.read.strip
parsed_toml = TOML.load(input)

puts JSON.generate(replace_primitives(parsed_toml))
