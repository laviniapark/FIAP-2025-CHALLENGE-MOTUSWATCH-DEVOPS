# 🏍️ MotusWatch - Sistema de Gestão de Motos

## 👤 Integrantes

| Turma | RM       | Nome Completo         |
|:-----:|:--------:|:---------------------:|
| 2TDSB | RM555679 | Lavinia Soo Hyun Park |
| 2TDSB | RM559123 | Caroline de Oliveira  |
| 2TDSB | RM554473 | Giulia Correa Camillo |

## Índice
1. [Descrição do Projeto](#descrição-do-projeto)
2. [Diagrama da Arquitetura](#diagrama-da-arquitetura)
3. [Como Executar Localmente](#como-executar-localmente)

## Descrição do Projeto
O MotusWatch é um **sistema de gestão e monitoramento de motos** utilizado para organizar o pátio da Mottu, aplicando um modelo visual de classificação por cores que facilita a identificação do estado de cada moto.

A solução permite que operadores e administradores acompanhem rapidamente **quais motos estão prontas para uso, em manutenção, com problemas administrativos ou em reparo grave**, otimizando o fluxo operacional e reduzindo o tempo de ociosidade.

Além disso, o sistema conta com **controle de usuários com diferentes níveis de acesso**, **histórico de movimentações** e um painel visual com indicadores que auxiliam na tomada de decisão.

### 💻 Tecnologias Utilizadas

| Categoria              | Tecnologia        |
|:----------------------:|:-----------------:|
| Linguagem              | Java 17           |
| Framework Web          | Spring Boot       |
| Segurança              | Spring Security   |
| Persistência ORM       | Spring Data JPA   |
| Versionamento de Banco | Flyway            |
| Banco de Dados         | SQL Server (JDBC) |
| Gerenciador de Build   | Maven             |
| Template Engine        | Thymeleaf         |
| Redução de boilerplate | Lombok            |

### ⚙️ Funcionalidades

#### 🌈 Classificação por Cores
- **Verde**: Pronta para uso (sem limite de tempo)
- **Amarelo**: Reparos rápidos (limite de 15 minutos)
- **Vermelho**: Reparos graves (prioridade alta)
- **Roxo**: Problemas administrativos (até resolução)

#### 🔒 Autenticação e Autorização
- Sistema de login com Spring Security
- Dois tipos de usuário:
    - **ADMIN**: Acesso completo (criar, editar, excluir)
    - **USER**: Acesso de leitura apenas

#### 🧩 Funcionalidades Principais
- Gestão de motos (CRUD completo)
- Gestão de usuários
- Controle de movimentações
- Dashboard com estatísticas
- Relatórios por área
- Sistema de alertas por tempo de permanência

## Diagrama da Arquitetura

![Arquitetura do Projeto](/docs/images/arquitetura-projeto.png)

### 🧱 Detalhamento dos Componentes
|   Nome do Componente    |                  Tipo                  |                                               Descriçao Funcional                                                |             Tecnologia / Ferramenta             |
|:-----------------------:|:--------------------------------------:|:----------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------:|
|        Developer        |                Persona                 |                      Responsável por escrever, versionar e atualizar o código da aplicaçao                       |                        -                        |
|      Usuário Final      |                Persona                 |                                   Utiliza a aplicação através da interface web                                   |                        -                        |
|         GitHub          |         Repositório de Código          |                                  Armazena e versiona o código-fonte do projeto                                   |                     GitHub                      |
|  Azure DevOps Pipeline  | CI/CD (Orquestrador de Build e Deploy) |                  Automatiza o processo de build, geração da imagem Docker e deploy da aplicação                  |          Azure DevOps (Pipeline YAML)           |
| Spring Boot Application |           Aplicação Back-End           | Responsável pela estrutura e funcionamento da aplicação, com conexão ao Banco de Dados e Thymeleaf para o visual | Spring Boot + Spring Security + JPA + Thymeleaf |
|         Docker          |            Containerização             |                                        Empacota a aplicação em uma imagem                                        |                     Docker                      |
|           ACR           |          Registro de Imagens           |                           Armazena e versiona as imagens Docker geradas pela pipeline                            |            Azure Container Registry             |
|      Azure Web App      |     Ambiente Principal de Execução     |                 Hospeda e executa a aplicação continuamente, servindo o acesso ao usuário final                  |                  Azure Web App                  |
|           ACI           |          Ambiente Secundário           |               Permite rodar rapidamente a aplicaçao em container isolado para testes ou validações               |            Azure Container Instance             |
|   Azure SQL Database    |             Banco de Dados             |                                 Armazena informações persistidas pela aplicação                                  |                Azure SQL Server                 |

### 🔄 Explicação do Fluxo

1. O desenvolvedor realiza um commit e envia as alterações para o repositório no GitHub. 
2. Esse commit dispara automaticamente a pipeline de CI/CD no Azure DevOps. 
3. A pipeline executa o build da aplicação Spring Boot, validando o código e dependências. 
4. Após o build, é gerada a imagem Docker da aplicação. 
5. A imagem é então enviada (push) para o Azure Container Registry (ACR). 
6. A partir da imagem armazenada no ACR, é realizado o deploy principal no Azure Web App, onde a aplicação é executada. 
7. Como opção de execução alternativa, a mesma imagem pode ser implantada no Azure Container Instances (ACI) para testes isolados. 
8. A aplicação em execução (no Web App ou ACI) se conecta ao Azure SQL Database para armazenamento e consulta dos dados.

## Como Executar Localmente
### Passos
1. Clone o repositório
2. Execute `git clone [link-repositorio]` no caminho da pasta de sua preferência
3. Abra o projeto em uma IDE (IntelliJ, VS Code ou outro)
3. Execute o comando: `mvn clean spring-boot:run`
4. Acesse: `http://localhost:8080`

> Observação: A execução local utiliza o banco de dados H2 em memória, permitindo testes sem necessidade de configuração adicional

### Usuários de Teste
| Perfil | Usuário |  Senha   |
|:------:|:-------:|:--------:|
| Admin  |  admin  | admin123 |
|  User  |  user   | user123  |
