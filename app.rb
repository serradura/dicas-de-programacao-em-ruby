class User
  attr_reader :nome, :idade, :cidade

  def initialize(nome:, idade:, cidade:)
    @nome = nome
    @idade = idade
    @cidade = cidade
  end
end

class Game
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def start
    boas_vindas
    # Poderá receber mais métodos que venham fazer sentindo ao jogo/projeto...
  end

  private

  def boas_vindas
    imprime_pergunta

    resposta = gets

    prosseguir_para_o_jogo?(resposta)
  end

  def imprime_pergunta
    puts "Seja bem-vindo #{user.nome}!"
    puts 'Você quer jogar?'
    puts 'Digite S ou N'
  end

  def prosseguir_para_o_jogo?(resposta)
    resposta.downcase[0] == 's'
  end
end

# Uso:
user = User.new(nome: 'André', idade: '30', cidade: 'São José do Rio Preto')

game = Game.new(user)

if game.start
  puts 'Iniciando jogo...'
end
