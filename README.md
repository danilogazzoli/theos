## Projeto para avaliação

Projeto desenvolvido em RAD Studio Delphi Tokyo.

Banco de dados firebird 2.5

Para o exercício 2 funcionar, basta editar o arquivo Parametros.ini (database, user_name e password)

O Banco de dados DATABASE.FDB se encontra na pasta /EntidadesCalculo/db.
.


## Programador Delphi 

# Instruções

    Esse teste é público. Todos os interessados que fizerem pull request receberão um feedback da equipe
    Theòs Sistemas
    
    1. Faça um fork deste repositório;
    2. Crie uma branch com o seu nome.
    2. Adicione seu currículo na raiz do repositório.
    3. Envie-nos o PULL-REQUEST para que seja avaliado.
    
### O Teste

### Exercício 1 – Calculadora 

Criar uma calculadora usando conceitos de orientação a objetos. 
Gostaríamos que sigam um pensamento simples e não se prendam muito a interface gráfica, 

    * Quando digitarmos um número e escolhermos uma operação, a calculadora checa se é a primeira vez. 
		* Se for, o resultado é o número do visor. 
    * Conforme trocamos, as operações são executadas, o valor é armazenado e a operação é atualizada.
    * Ao clicar em igual, checamos se é a primeira vez. 
		* Se for, executamos a última operação com o número do visor. 
		* Caso não seja, a operação será executada, mas usamos o que guardamos do visor no primeiro clique de igual. Isso permite que façamos 5 / 5 * 2 (igual, igual).

### Novas funcionalidades na calculadora:
    * Utilizando a calculadora acima aumente as funcionalidades criando botões com cálculos específicos e com os seguintes impostos abaixo em cada botão:
		* Imposto A = Base de Cálculo (Valor imposto na calculadora) * 20 % - 500.
		* Imposto B = Imposto A – 15.
		* Imposto C = Imposto A + imposto B.

### Exercício 2 – Entidades de cálculo.

    * Criar uma classe Funcionário com as seguintes propriedades 
		* (Nome, CPF, Salário) 
	* Criar uma classe Dependente com as seguintes propriedades 
		* (Nome, IsCalculaIR, IsCalculaINSS)	
	* A classe de Funcionario terá uma lista de dependentes
	* Cálculo de INSS e IR aplicado ao funcionário usando o valor do salário como base.
		* Regras de negócio
			* INSS - O cálculo de INSS será descontado 8% do valor do funcionário caso o dependente calcula INSS
			* IR – O cálculo de IR será deduzido da base, salário 100 reais para cada dependente que possuir calcula IR e por fim desconta 15% do salário do funcionário.
			* Ex. Funcionário que ganha 1000,00 e que tenha dois dependentes onde o IsCalculaIR e IsCalculaINSS estejam marcados.
			* INSS = 1000,00 – 8% = 80,00
			* IR = 1000,00 - (2 * 100) = 800,00 – 15% = 120,00.		
	* Criar a mesma estrutura em um banco de dados e gravar as informações usando uma camada de banco de dados para o acesso
			
### Diferencial – Testes unitários 

	* Realizar testes unitários nos métodos de cálculo dos impostos dos exercícios 1.
	* Realizar testes unitários nos métodos de cálculo do exercício 2.
		
### Observações:
	* O sistema deverá ser desenvolvido na plataforma delphi, 
	(banco de dados preferêncialmente firebird, caso for usado outro banco, informar no pull-request e enviar os scripts para criação do mesmo)
	

    obs: Teste terá como avaliação principal os requisitos solicitados nos exercícios,  porém os testes
    poderá ser critério de desempate.
 



