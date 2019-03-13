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

