programa {

    cadeia login = "vaina"
    cadeia senha = "web"
    cadeia nomeItem
    inteiro qtdItem, quantidadeItens
    inteiro valorItem

    inteiro totalItens = 0

    cadeia estoqueNome[20]
    inteiro estoqueQtd[20]
    real estoqueValor[20]
    inteiro estoqueID[20]

    funcao inicio() {

        escreva("---- Sistema de Autenticação ----")

        escreva("\nDigite seu login: ")
        leia(login)
        escreva("Digite sua senha: ")
        leia(senha)

        se (login == "vaina" e senha == "web") {
            escreva("Logado!\n")
            menu()
        } senao {
            escreva("Login ou Senha errado - Digite novamente!\n")
            menu()
        }
    }

    funcao menu() {
        real op

        escreva("\n1. Adicionar item ao estoque.\n2. Remover item do estoque.\n3. Exibir estoque.\n4. Sair.\n")
        leia(op)

        escolha(op) {
            caso 1:
                adicionarEstoque()
                pare
            caso 2:
                removerEstoque()
                pare
            caso 3:
                exibirEstoque()
            caso 4:
                limpa()
                escreva("Saindo do programa!")
                pare
            caso contrario:
                escreva("Opção inválida. Tente novamente\n")
                menu()
        }
    }

    funcao adicionarEstoque() {
      escreva("Quantos itens adicionar? ")
      leia(quantidadeItens)

      se (quantidadeItens > 20) {
        escreva("Você escolheu uma quantidade de itens acima da capacidade do estoque. Utilizando capacidade padrão de 20.\n")
        quantidadeItens = 20
      }

      para(inteiro i = 1; i <= quantidadeItens; i++){
        escreva("Nome:")
        leia(nomeItem)
      
        escreva("Quantidade: ")
        leia(qtdItem)
      
        escreva("Valor:")
        leia(valorItem)
                  
	      estoqueNome[totalItens] = nomeItem
	      estoqueQtd[totalItens] = qtdItem
	      estoqueValor[totalItens] = valorItem
	      estoqueID[totalItens] = totalItens
	      
	      totalItens++
	 	  }

        menu()
    }

    funcao removerEstoque() {
      inteiro removerItem

      escreva("\nQual indice item você irá remover? ")
      leia(removerItem)

      se(removerItem >= totalItens ou removerItem < 0){
        escreva("\nProduto não encontrado\n")
        menu()
      } senao {
        para(inteiro i = removerItem; i < totalItens - 1; i++){
          escreva("total: ", totalItens, " indice: ", removerItem)
          estoqueNome[i] = estoqueNome[i + 1]
          estoqueQtd[i] = estoqueQtd[i + 1]
          estoqueValor[i] = estoqueValor[i + 1]
          estoqueID[i] = estoqueID[i + 1]
        }
      }
      totalItens--
      menu()
    }

    funcao exibirEstoque() {
        para (inteiro j = 0; j < totalItens; j++) {
            escreva(j, "° - Produto: ", estoqueNome[j], " - Quantidade: ", estoqueQtd[j], " - Preço: ", estoqueValor[j], "\n")
        }

        menu()
    }

}