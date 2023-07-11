# Ambientes

### Ambiente de Desenvolvimento
- **Objetivo:** O ambiente de desenvolvimento é usado pelos desenvolvedores para criar e testar novas funcionalidades da aplicação.
- **Função:** Nesse ambiente, os desenvolvedores trabalham no código-fonte, realizam testes unitários e integração de código e fazem iterações rápidas de desenvolvimento.
- **Características:**
  - Geralmente, cada desenvolvedor possui uma cópia do ambiente de desenvolvimento em suas próprias máquinas locais.
  - Usa um banco de dados de desenvolvimento para testes locais.
  - Pode ter servidores de desenvolvimento para executar a aplicação localmente durante o desenvolvimento.

### Ambiente de Testing (Teste Automatizado)
- **Objetivo:** O ambiente de testing é usado para executar testes automatizados, como testes unitários, testes de integração e testes de aceitação.
- **Função:** Nesse ambiente, os testes automatizados são executados de forma sistemática para verificar a funcionalidade, a integridade e a qualidade geral da aplicação.
- **Características:**
  - É uma infraestrutura dedicada para execução contínua de testes automatizados.
  - Utiliza frameworks e ferramentas de teste, como RSpec, Cucumber, Capybara, entre outros.
  - Pode ser integrado a um sistema de integração contínua (CI) para automação do processo de teste.
  - Normalmente, é configurado para ser executado em resposta a eventos específicos, como a conclusão de um novo código ou uma nova solicitação de alteração.
  - Os testes automatizados são escritos pelos desenvolvedores e/ou pela equipe de teste para verificar a funcionalidade, a lógica do negócio e a integração entre componentes da aplicação.
  - Os testes automatizados ajudam a garantir a estabilidade do código e permitem a detecção precoce de problemas.

### Ambiente de Teste (QA)
- **Objetivo:** O ambiente de teste, também conhecido como ambiente de qualidade (QA), é usado para testar a aplicação antes de ser implantada em produção.
- **Função:** Nesse ambiente, os testadores realizam testes funcionais, de integração e de regressão para identificar problemas antes que a aplicação seja liberada para os usuários finais.
- **Características:**
  - Usualmente, possui uma infraestrutura dedicada para testes.
  - Utiliza um banco de dados de teste separado para evitar interferência com dados de produção.
  - Pode ter servidores de teste que refletem o ambiente de produção, mas com capacidade reduzida.

Ambiente de Staging:
Objetivo: O ambiente de staging (pré-produção) é usado para testar as alterações em um ambiente semelhante ao de produção antes de serem implantadas para os usuários finais.
Função: Nesse ambiente, as alterações passam por um último estágio de validação antes de serem promovidas para a produção, permitindo uma revisão final e a identificação de problemas específicos do ambiente de produção.
Características:
Reflete de perto o ambiente de produção em termos de configurações, infraestrutura e serviços externos.
Pode usar um banco de dados de staging para testes finais.
Geralmente, compartilha a mesma base de código com o ambiente de produção.

Ambiente de Produção:
Objetivo: O ambiente de produção é onde a aplicação é implantada e disponibilizada para os usuários finais.
Função: Nesse ambiente, a aplicação lida com o tráfego real dos usuários e oferece uma experiência de produção estável e confiável.
Características:
Usa um banco de dados de produção com dados reais.
Possui uma infraestrutura robusta e dimensionada para suportar a carga de produção.
Geralmente, possui mecanismos de monitoramento, escalabilidade e backups configurados para garantir alta disponibilidade e desempenho.

Proposta 01

Neste fluxo, as alterações seguem o seguinte caminho:

Ambiente de Desenvolvimento:
Os desenvolvedores trabalham no código da aplicação neste ambiente.
Ambiente de Testing:
Após a conclusão das alterações no ambiente de desenvolvimento, as alterações são enviadas para o ambiente de testing para execução dos testes automatizados.
Ambiente de Qa:
Após a execução dos testes automatizados no ambiente de testing, as alterações são enviadas para o ambiente de teste (QA) para execução de testes manuais e/ou testes adicionais realizados pela equipe de teste.
Ambiente de Staging:
Uma vez que as alterações tenham passado pelos testes no ambiente de teste (QA) e sejam consideradas prontas para a próxima etapa, elas são implantadas no ambiente de staging para validação final antes da implantação em produção.
Ambiente de Produção:
Após a validação bem-sucedida no ambiente de staging, as alterações são implantadas no ambiente de produção para disponibilização aos usuários finais.

Branches/github

ATUAL
PROPOSTA
AMBIENTE
development
development
Desenvolvimento
-

-

Testing
-

qa
Qa
main
staging
Staging
production
production
Produção

Proposta 02

Neste fluxo, as alterações seguem o seguinte caminho:

Ambiente de Desenvolvimento:
Os desenvolvedores trabalham no código da aplicação neste ambiente.
Ambiente de Testing:
Após a conclusão das alterações no ambiente de desenvolvimento, as alterações são enviadas para o ambiente de testing para execução dos testes automatizados.
Ambiente de Qa:
Após a execução dos testes automatizados no ambiente de testing, as alterações são enviadas para o ambiente de teste (QA) para execução de testes manuais e/ou testes adicionais realizados pela equipe de teste.
Ambiente de Produção:
Após a validação bem-sucedida no ambiente de Qa, as alterações são implantadas no ambiente de produção para disponibilização aos usuários finais.

Branches/github

ATUAL
PROPOSTA
AMBIENTE
development
main (Cópia)
Desenvolvimento
-

-

Testing
main
qa
Qa
production
main
Produção

Aqui está uma explicação detalhada de cada parte do arquivo (actions.yml) YML:

```yml
name: "CI/CD with GitHub Actions"
```

O nome do fluxo de trabalho.

```yml
on:
  push:
    branches: [ "*" ]
  pull_request:
    types:
      - opened
      - synchronize
      - reopened
```

Define quando o fluxo de trabalho será acionado. Ele será acionado em qualquer push para todas as branches e em pull requests abertos, sincronizados ou reabertos.

```yml
jobs:
  test:
    name: Test
    runs-on: ubuntu-latest
```

Define um trabalho chamado "Test" que será executado em uma máquina virtual com o sistema operacional Ubuntu mais recente.

```yml
services:
  postgres:
    image: postgres:11-alpine
    ports:
      - "5432:5432"
    env:
      POSTGRES_HOST: localhost
      POSTGRES_USER: rails
      POSTGRES_PASSWORD: password
      POSTGRES_PORT: 5432
      POSTGRES_DB: rails_test
      POSTGRES_TIMEOUT: 5000
```

Configura um serviço de contêiner Postgres para uso durante os testes. Ele usa a imagem do Postgres 11 Alpine e expõe a porta 5432. Também define algumas variáveis de ambiente para configuração do banco de dados.

```yml
steps:
  - name: Checkout code
    uses: actions/checkout@v3
```

Realiza o checkout do código do repositório.

```yml
  - name: Install Ruby and gems
    uses: ruby/setup-ruby@55283cc23133118229fd3f97f9336ee23a179fcf
    with:
      bundler-cache: true
```

Configura o ambiente Ruby e instala as gems necessárias para a aplicação. O cache do Bundler é ativado para melhorar a velocidade das instalações subsequentes.

```yml
  - name: Rubocop
    run: bin/bundle exec rubocop --require rubocop-rails
```

Executa a verificação de estilo de código usando o Rubocop.

```yml
  - name: Migration
    run: bin/rails db:create db:migrate
```

ou

```yml
  - name: Structure Load
    run: bin/rails db:structure:load
```

Cria e migra o banco de dados.

```yml
  - name: Rspec tests
    run: bin/rake
```

Executa os testes RSpec.

Os outros jobs (deploy_qa e deploy_production) têm estruturas semelhantes, mas são acionados apenas em eventos específicos (push para a branch "qa" ou "main" respectivamente). Eles executam etapas de implantação, como migrações de banco de dados e implantação em ambientes específicos.

```yml
slackNotification:
  if: ${{ always() }}
  needs: [test, deploy_qa, deploy_production]
  name: Slack Notification
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@master
```

Configura um job chamado "slackNotification" que é acionado sempre. Ele depende dos jobs anteriores (test, deploy_qa, deploy_production) e é executado em uma máquina virtual com o sistema operacional Ubuntu mais recente.

```yml
    - name: Slack Notification
      uses: bryannice/gitactions-slack-notification@2.0.0
      env:
        SLACK_INCOMING_WEBHOOK: ${{ secrets.SLACK_INCOMING_WEBHOOK }}
        SLACK_TITLE: "Resultado do deploy"
        SLACK_MESSAGE: |
          Autor: ${{ github.actor }}
          Branch: ${{ github.ref }}
          Commit: ${{ github.sha }}
          Messagem de Commit: ${{ github.event.head_commit.message }}
          Test: ${{ needs.test.result }}
          Deploy Qa: ${{ needs.deploy_qa.result }}
          Deploy Production: ${{ needs.deploy_production.result }}
```

Utiliza uma ação do GitHub chamada "bryannice/gitactions-slack-notification" para enviar uma notificação para o Slack. Os detalhes da notificação, como o webhook do Slack e as informações do deploy, são configurados como variáveis de ambiente.

Arquivo completo (actions.yml)

```yml
name: "CI/CD with GitHub Actions"
on:
  push:
    branches: [ "*" ]
  pull_request:
    types:
      - opened
      - synchronize
      - reopened
jobs:
  test:
    name: Test
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:11-alpine
        ports:
          - "5432:5432"
        env:
          POSTGRES_HOST: localhost
          POSTGRES_USER: rails
          POSTGRES_PASSWORD: password
          POSTGRES_PORT: 5432
          POSTGRES_DB: rails_test
          POSTGRES_TIMEOUT: 5000
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Install Ruby and gems
        uses: ruby/setup-ruby@55283cc23133118229fd3f97f9336ee23a179fcf
        with:
          bundler-cache: true
      - name: Rubocop
        run: bin/bundle exec rubocop --require rubocop-rails
      - name: Migration
        run: bin/rails db:create db:migrate
      - name: Rspec tests
        run: bin/rake
  deploy_qa:
    needs: test
    name: Deploy Qa
    runs-on: ubuntu-latest
    if: ${{ (github.event_name == 'push' && (github.ref == 'refs/heads/qa' || github.ref == '^refs/heads/qa_')) || (github.event_name == 'push' && github.ref == 'refs/heads/main') }}
    steps:
      - name: Verify Environment
        uses: actions/checkout@v3
      - name: Migrate QA
        run: echo "Rode as migrations"
      - name: Data Migrate QA
        run: echo "Rode as data migrations"
      - name: Deploy Qa
        run: |
          echo "Faça deploy para QA"
          # gcloud beta run jobs create neurolead-migration-job \
          # --image ${{ vars.IMAGE_DOCKFILE_APPLICATION }} \
          # --command "bundle exec rake db:migrate" \
          # --execute-now --wait
  deploy_production:
    needs: test
    name: Deploy Production
    runs-on: ubuntu-latest
    if: ${{ github.event_name == 'push' && github.ref == 'refs/heads/main' }}
    steps:
      - name: Verify Environment
        uses: actions/checkout@v3
      - name: Migrate Production
        run: echo "Rode as migrations"
      - name: Data Migrate Production
        run: echo "Rode as data migrations"
      - name: Deploy Production
        run: echo "Faça deploy para produção"
  slackNotification:
      if: ${{ always() }}
      needs: [test, deploy_qa, deploy_production]
      name: Slack Notification
      runs-on: ubuntu-latest
      steps:
      - uses: actions/checkout@master
      - name: Slack Notification
        uses: bryannice/gitactions-slack-notification@2.0.0
        env:
          SLACK_INCOMING_WEBHOOK: ${{ secrets.SLACK_INCOMING_WEBHOOK }}
          SLACK_TITLE: "Resultado do deploy"
          SLACK_MESSAGE: |
            Autor: ${{ github.actor }}
            Branch: ${{ github.ref }}
            Commit: ${{ github.sha }}
            Messagem de Commit: ${{ github.event.head_commit.message }}
            Test: ${{ needs.test.result }}
            Deploy Qa: ${{ needs.deploy_qa.result }}
            Deploy Production: ${{ needs.deploy_production.result }}
```
