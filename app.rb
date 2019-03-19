class User
  attr_reader :nome, :idade, :cidade

  def initialize(nome, idade, cidade)
    @nome = nome
    @idade = idade
    @cidade = cidade
  end

  def boasvindas
    imprime_pergunta

    resposta = gets

    prosseguir_para_o_jogo?(resposta)
  end

  private

  def imprime_pergunta
    puts "Seja bem-vindo #{nome}!"
    puts 'Você quer jogar?'
    puts 'Digite S ou N'
  end

  def prosseguir_para_o_jogo?(resposta)
    resposta.downcase[0] == 's'
  end
end

# Uso:
user = User.new('André', '30', 'São José do Rio Preto')

if user.boasvindas
  puts 'Iniciando jogo...'
end
