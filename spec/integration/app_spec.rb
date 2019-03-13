require 'spec_helper'

RSpec.describe 'app.rb', type: :aruba do
  context 'Usuário quer jogar' do
    it 'inicializa o jogo quando o jogador insere "S"' do
      setup_aruba

      run_command("ruby #{File.join(File.realpath('.'), 'app.rb')}")

      type 'S'
      stop_all_commands
      sleep(0.5)

      expect(last_command_started.output).to include('Seja bem-vindo André!')
      expect(last_command_started.output).to include('Você quer jogar?')
      expect(last_command_started.output).to include('Digite S ou N')
      expect(last_command_started.output).to include('Iniciando jogo...')
    end

    it 'inicializa o jogo quando o jogador insere "s"' do
      setup_aruba

      run_command("ruby #{File.join(File.realpath('.'), 'app.rb')}")

      type 's'
      stop_all_commands
      sleep(0.5)

      expect(last_command_started.output).to include('Seja bem-vindo André!')
      expect(last_command_started.output).to include('Você quer jogar?')
      expect(last_command_started.output).to include('Digite S ou N')
      expect(last_command_started.output).to include('Iniciando jogo...')
    end
  end

  context 'Usuário não quer jogar' do
    it 'Não inicializa o jogo quando o jogador insere "N"' do
      setup_aruba

      run_command("ruby #{File.join(File.realpath('.'), 'app.rb')}")

      type 'n'
      stop_all_commands
      sleep(0.5)

      expect(last_command_started.output).to include('Seja bem-vindo André!')
      expect(last_command_started.output).to include('Você quer jogar?')
      expect(last_command_started.output).to include('Digite S ou N')
      expect(last_command_started.output).to_not include('Iniciando jogo...')
    end

    it 'Não inicializa o jogo quando o jogador insere "n"' do
      setup_aruba

      run_command("ruby #{File.join(File.realpath('.'), 'app.rb')}")

      type 'n'
      stop_all_commands
      sleep(0.5)

      expect(last_command_started.output).to include('Seja bem-vindo André!')
      expect(last_command_started.output).to include('Você quer jogar?')
      expect(last_command_started.output).to include('Digite S ou N')
      expect(last_command_started.output).to_not include('Iniciando jogo...')
    end
  end
end
