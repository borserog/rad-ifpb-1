# frozen_string_literal: true

# Analisa uma linha de string e informa a frequencia das palavras repetidas
class AnalisadorLinha
  attr_accessor :linha_numero, :conteudo, :palavras_maior_freq, :freq

  def initialize(linha_numero, conteudo)
    @linha_numero = linha_numero
    @conteudo = conteudo
    @palavras_de_maior_freq = maior_freq(@conteudo)
  end

  def maior_freq(conteudo)
    string_array = conteudo.split
    result_hash = {}
    frequency = 0

    string_array.each do |current_word|
      if !result_hash.include?(current_word)
        result_hash[current_word] = 1
      else
        result_hash[current_word] += 1
      end

      frequency = result_hash[current_word] if result_hash[current_word] > frequency
    end

    result_hash.delete_if { |_, v| v < frequency }

    @palavras_maior_freq = result_hash.keys
    @freq = frequency
  end

  def to_s
    "Na linha #{@linha_numero}, as palavra(s) #{@palavras_maior_freq} apareceram #{@freq} vezes"
  end
end
