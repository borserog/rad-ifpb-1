# frozen_string_literal: true

require_relative 'analisador_linha'

arquivo = File.open('./test-file.txt')
linhas_do_arquivo = arquivo.readlines.map(&:chomp)
result = []

linhas_do_arquivo.each_with_index do |linha, index|
  result.push(AnalisadorLinha.new(index + 1, linha))
end

puts result
