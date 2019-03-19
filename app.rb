class User
  attr_accessor :nome, :idade, :cidade

  def boasvindas
    imprime_pergunta

    resposta = gets

    return prosseguir_para_o_jogo(resposta)
  end

  private

  def imprime_pergunta
    puts "Seja bem-vindo #{nome}!"
    puts 'Você quer jogar?'
    puts 'Digite S ou N'
  end

  def prosseguir_para_o_jogo(resposta)
    if resposta.downcase[0] == 's'
      true
    else
      false
    end
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
