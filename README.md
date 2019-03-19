# Dicas de programação em Ruby

## Propósito:

Registrar dicas de programação que surgiram por conta de uma conversa/[pergunta](https://t.me/rubybrasil/82504) que rolou no grupo [Ruby Brasil do Telegram](https://t.me/rubybrasil).

Por favor registre dúvidas e/ou sugestões como [issues](https://github.com/serradura/dicas-programacao-em-ruby/issues). 😉

[Contribuições](https://www.digitalocean.com/community/tutorials/como-criar-um-pull-request-no-github-pt) são mais que bem-vindas! 😊

## Implementação original:

```ruby
class User
  attr_accessor :nome, :idade, :cidade

  def boasvindas
    puts 'Seja bem-vindo ' << nome << '!'
    puts 'Você quer jogar?'
    puts 'Digite S ou N'

    resposta = gets

    if resposta.downcase[0] == ('s')
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
```

## Configuração do projeto:
1. Instale o Ruby (dica: [rbenv](https://medium.com/@phinfonet/primeiros-passos-com-ruby-instala%C3%A7%C3%A3o-com-rbenv-ab705559fc5c))
2. Instale o bundler: `gem install bundler`

## Executando os testes:
```sh
  bundle exec rspec
```

## Dicas

Exemplos de boas práticas de desenvolvimento de software em Ruby + técnicas de refatoração.

### Dica 1

Faça uso de interpolação, é mais performático que concatenar strings.

```ruby
class User
  attr_accessor :nome, :idade, :cidade

  def boasvindas
    puts "Seja bem-vindo #{nome}!"
    puts 'Você quer jogar um jogo?'
    puts 'Digite S ou N'
    resposta = gets

    if resposta.downcase == 's'
      jogar = true
    else
      jogar = false
    end

    return jogar
  end
end
```

### Dica 2

Use métodos privados, para:
1. Encapsular/esconder comportamentos
2. Melhorar a legibilidade de métodos públicos
3. Permitir reuso

```ruby
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
      jogar = true
    else
      jogar = false
    end

    return jogar
  end
end
```

### Dica 3

Remova variáveis caso o valor atribuído seja o último a ser retornado.
(Mudança: Foi removido a variável `jogar` do método `prosseguir_para_o_jogo`).

```ruby
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
```
