# Dicas de programação em Ruby

## Propósito

Registrar dicas de programação que surgiram por conta de uma conversa/[pergunta](https://t.me/rubybrasil/82504) que rolou no grupo [Ruby Brasil do Telegram](https://t.me/rubybrasil).

Por favor registre dúvidas e/ou sugestões como [issues](https://github.com/serradura/dicas-programacao-em-ruby/issues). 😉

[Contribuições](https://www.digitalocean.com/community/tutorials/como-criar-um-pull-request-no-github-pt) são mais que bem-vindas! 😊

## Implementação original

A ideia deste projeto é demonstrar pequenas dicas/mudanças para aprimorar o exemplo abaixo.

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

---

## Como utilizar este guia/projeto?

### 1) Use o menu de [dicas](#dicas):

![Como utilizar este guia](https://raw.githubusercontent.com/serradura/dicas-de-programacao-em-ruby/master/assets/como-utilizar-este-guia.png)

---

### 2) Configure o projeto e teste cada mudança/dica:

**Configurando o projeto**

1. Instale o Ruby (dica: [rbenv](https://medium.com/@phinfonet/primeiros-passos-com-ruby-instala%C3%A7%C3%A3o-com-rbenv-ab705559fc5c))
2. Instale o bundler: `gem install bundler`
3. Execute o bundler: `bundle install`

**Executando os testes**

```sh
bundle exec rspec
```

**Sugestão:**

Após configurar, acesso o primeiro commit `git checkout f42f6b92` e aplique os conceitos deste guia. Feito isso, use a suite de testes para verificar se o comportamento da aplicação continua sendo o garantido.

---

## Dicas

Exemplos de boas práticas de desenvolvimento de software em Ruby + técnicas de refatoração.

* [`400d121`](https://github.com/serradura/dicas-programacao-em-ruby/compare/f42f6b9..400d121#diff-cc95738088603531796e0d0f246a5d77) Dica 1 - Interpolação [🔗](#dica-1-diff)
* [`11445ef`](https://github.com/serradura/dicas-programacao-em-ruby/compare/400d121..11445ef#diff-cc95738088603531796e0d0f246a5d77) Dica 2 - Use métodos privados [🔗](#dica-2-diff)
* [`824501f`](https://github.com/serradura/dicas-programacao-em-ruby/compare/11445ef..824501f#diff-cc95738088603531796e0d0f246a5d77) Dica 3 - Remova variáveis desnecessárias [🔗](#dica-3-diff)
* [`f6300e9`](https://github.com/serradura/dicas-programacao-em-ruby/compare/824501f..f6300e9#diff-cc95738088603531796e0d0f246a5d77) Dica 4 - Defina métodos predicativos [🔗](#dica-4-diff)
* [`9f8f36e`](https://github.com/serradura/dicas-programacao-em-ruby/compare/f6300e9..9f8f36e#diff-cc95738088603531796e0d0f246a5d77) Dica 5 - Ternário [🔗](#dica-5-diff)
* [`b7fb557`](https://github.com/serradura/dicas-programacao-em-ruby/compare/9f8f36e..b7fb557#diff-cc95738088603531796e0d0f246a5d77) Dica 6 - Elimine a condicional quando o retorno for um boolean [🔗](#dica-6-diff)
* [`baeb46e`](https://github.com/serradura/dicas-programacao-em-ruby/compare/b7fb557..baeb46e#diff-cc95738088603531796e0d0f246a5d77) Dica 7 - return é opcional quando usado na última linha de um método [🔗](#dica-7-diff)
* [`f86e29d`](https://github.com/serradura/dicas-programacao-em-ruby/compare/baeb46e..f86e29d#diff-cc95738088603531796e0d0f246a5d77) Dica 8 - Use o construtor + getters (métodos somente leitura) [🔗](#dica-8-diff)
* [`4d79c49`](https://github.com/serradura/dicas-programacao-em-ruby/compare/f86e29d..4d79c49#diff-cc95738088603531796e0d0f246a5d77) Dica 9 - Use keywords arguments [🔗](#dica-9-diff)
* [`ec016e0`](https://github.com/serradura/dicas-programacao-em-ruby/compare/4d79c49..ec016e0#diff-cc95738088603531796e0d0f246a5d77) Dica 10 - Escreva métodos e variáveis no formato snake_case [🔗](#dica-10-diff)
* [`66b1048`](https://github.com/serradura/dicas-programacao-em-ruby/compare/ec016e0..66b1048#diff-cc95738088603531796e0d0f246a5d77) Dica 11 - Separe classes por responsabilidade (coesão) [🔗](#dica-11-diff)

---

### Dica 1 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/f42f6b9..400d121#diff-cc95738088603531796e0d0f246a5d77)]

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

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---

### Dica 2 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/400d121..11445ef#diff-cc95738088603531796e0d0f246a5d77)]

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

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---

### Dica 3 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/11445ef..824501f#diff-cc95738088603531796e0d0f246a5d77)]

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

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---

### Dica 4 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/824501f..f6300e9#diff-cc95738088603531796e0d0f246a5d77)]

Defina métodos predicativos (terminam com `?` - interrogação) quando o resultado do mesmo for um `boolean` (`true` ou `false`).

```ruby
class User
  attr_accessor :nome, :idade, :cidade

  def boasvindas
    imprime_pergunta

    resposta = gets

    return prosseguir_para_o_jogo?(resposta)
  end

  private

  def imprime_pergunta
    puts "Seja bem-vindo #{nome}!"
    puts 'Você quer jogar?'
    puts 'Digite S ou N'
  end

  def prosseguir_para_o_jogo?(resposta)
    if resposta.downcase[0] == 's'
      true
    else
      false
    end
  end
end
```

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---

### Dica 5 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/f6300e9..9f8f36e#diff-cc95738088603531796e0d0f246a5d77)]

Use um ternário para expressar condicionais simples/curtas.

```ruby
class User
  attr_accessor :nome, :idade, :cidade

  def boasvindas
    imprime_pergunta

    resposta = gets

    return prosseguir_para_o_jogo?(resposta)
  end

  private

  def imprime_pergunta
    puts "Seja bem-vindo #{nome}!"
    puts 'Você quer jogar?'
    puts 'Digite S ou N'
  end

  def prosseguir_para_o_jogo?(resposta)
    resposta.downcase[0] == 's' ? true : false
  end
end
```

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---

### Dica 6 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/9f8f36e..b7fb557#diff-cc95738088603531796e0d0f246a5d77)]

Elimine o ternário/expressão condicional quando o retorno for um boolean.

```ruby
class User
  attr_accessor :nome, :idade, :cidade

  def boasvindas
    imprime_pergunta

    resposta = gets

    return prosseguir_para_o_jogo?(resposta)
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
```

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---

### Dica 7 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/b7fb557..baeb46e#diff-cc95738088603531796e0d0f246a5d77)]

Métodos sempre retornam o resultado da última linha, logo o uso de return se torna opcional/desnecessário.

```ruby
class User
  attr_accessor :nome, :idade, :cidade

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
```

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---

### Dica 8 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/baeb46e..f86e29d#diff-cc95738088603531796e0d0f246a5d77)]

Faça uso do construtor + getters (métodos de leitura) para evitar que o estados do(s) seu(s) objetos se corrompa por conta de uma manipulação indevida/equivocada.

```ruby
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
```

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---

### Dica 9 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/f86e29d..4d79c49#diff-cc95738088603531796e0d0f246a5d77)]

Faça uso de keywords arguments para tornar os argumentos/dependências de seus métodos mais expressivos.

```ruby
class User
  attr_reader :nome, :idade, :cidade

  def initialize(nome:, idade:, cidade:)
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
user = User.new(nome: 'André', idade: '30', cidade: 'São José do Rio Preto')

if user.boasvindas
  puts 'Iniciando jogo...'
end
```

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---

### Dica 10 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/4d79c49..ec016e0#diff-cc95738088603531796e0d0f246a5d77)]

Por convensão Ruby faz uso de `snake_case` na declaração de métodos e variáveis, quando o mesmo contém mais de um termo. Com isso o método *boasvindas* se torna _**boas_vindas**_.

```ruby
class User
  attr_reader :nome, :idade, :cidade

  def initialize(nome:, idade:, cidade:)
    @nome = nome
    @idade = idade
    @cidade = cidade
  end

  def boas_vindas
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
```

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---

### Dica 11 [[diff](https://github.com/serradura/dicas-programacao-em-ruby/compare/ec016e0..66b1048#diff-cc95738088603531796e0d0f246a5d77)]

Separe suas classes de acordo com suas responsabilidades (que conceito elas expressam?).
Isso poderá facilitar a manutenção e entendimento do código.

PS: Responsabilidade única/pouca tem haver com o que chamamos de coesão.

```ruby
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

user = User.new(nome: 'André', idade: '30', cidade: 'São José do Rio Preto')

game = Game.new(user)
game.start
```

<small>[🔝 Ir para menu de dicas](#dicas)</small>

---
