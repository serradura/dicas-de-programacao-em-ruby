class User
  attr_accessor :nome, :idade, :cidade

  def boasvindas
    puts "Seja bem-vindo #{nome}!"
    puts 'Você quer jogar?'
    puts 'Digite S ou N'
    resposta = gets

    if resposta.downcase[0] == 's'
      jogar = true
    else
      jogar = false
    end

    return jogar
  end
end

# Uso:
user = User.new
user.nome = 'André'
user.idade = '30'
user.cidade = 'São José do Rio Preto'

if user.boasvindas
  puts 'Iniciando jogo...'
end
