

module Jekyll
  module CapitalizeFirstLetters
    def capitalize_firsts(input)
      input.split(' ').map(&:capitalize).join(' ')
    end
  end
end

Liquid::Template.register_filter(Jekyll::CapitalizeFirstLetters)
