---
title: "{PT} O Git e o GitHub"
subtitle: "Texto em construção"
layout: single-sidebar
excerpt: "Olá, você teria um momento para ouvir a palavra do Git e do GitHub?"
author: Marília Melo Favalesso
date: '2021-08-17'
slug: Git/GitHub
categories: 
  - PT
  - Git
  - GitHub
tags: 
  - PT
  - Git
  - GitHub
images: ~
series: ~
alt: ''
featured: no
draft: no
image:
  focal_point: 'Center'
  placement: 2
  preview_only: no
output:
  blogdown::html_page:
    toc: yes
    number_sections: no
    toc_depth: 1
---

```{r setup, echo=FALSE}
library(xaringanExtra)

knitr::opts_chunk$set(eval=FALSE, 
                      echo=FALSE,
                      fig.align = "center")

htmltools::tagList(
  xaringanExtra::use_clipboard(
    button_text = "<i class=\"fa fa-clipboard\"></i> Copy Code",
    success_text = "<i class=\"fa fa-check\" style=\"color: #90BE6D\"></i> Copied!",
  ),
  rmarkdown::html_dependency_font_awesome()
)
```

```{css, eval=TRUE}
.page-main img {
  box-shadow: 0px 0px 2px 2px rgba( 0, 0, 0, 0.2 );
}
```
# Introdução

O [*Git*](https://www.atlassian.com/br/git/tutorials/what-is-git) é um software de [controle de
versões](https://www.devmedia.com.br/sistemas-de-controle-de-versao/24574) que visa gerenciar arquivos de texto, principalmente códigos de programação. Esta ferramenta funciona de forma semelhante aos sistemas em nuvem (Google Drive, Dropbox, Mega, etc.), em que podemos compartilhar edições de um script com uma equipe, além de retomar versões antigas de nossos arquivos. Resumidamente, *Git* examina as alterações feitas nos arquivos em um diretório e mantém essas informações para compartilhar com outros usuários e possibilitar a reversão das alterações feitas. Além de ser uma ferramenta útil, o *Git* se conecta ao serviço de hospedagem e armazenamento de versão chamado [*GitHub*](https://github.com/). A partir do *GitHub*, é possível contribuir com projetos de qualquer parte do mundo, além de compartilhar nossos códigos para fins de divulgação e colaboração.


# Como funciona o controle de versões?

O Git é um exemplo de sistema de controle de versão distribuído (DVCS)
comumente utilizado para código aberto e desenvolvimento de softwares.
Os DVCSs permitem acesso total a todos os arquivos, ramificações e
iterações de um projeto e permitem que todos os usuários acessem um
histórico completo e independente de todas as alterações.

Usando o *Git*, você pode fazer upload de novas versões de um projeto para um repositório (em outras palavras, um servidor) onde seus arquivos serão armazenados e o histórico de suas versões será salvo. Nesse caso, nosso armazenamento estará no GitHub. Todos os colaboradores/desenvolvedores podem acessar e recuperar a versão mais recente do projeto disponível no *GitHub* e copiar em suas máquinas locais (seus computadores). Eles podem trabalhar nisso e continuar o processo de desenvolvimento em paralelo com outros colegas. Com cada alteração feita, você pode enviar suas alterações para o repositório e atualizar sua versão de outras feitas por outros desenvolvedores.

**Por exemplo**: Digamos que você tenha começado a participar de um projeto que já está em andamento e está hospedado no *GitHub*. Inicialmente, você precisará baixar a versão mais recente do projeto para sua máquina (`clone` do git). Com o tempo, você trabalhará neste projeto individualmente; você pegará o projeto em um estágio específico e começará a fazer suas alterações separadamente dos outros. Para fazer isso, você criará uma `branch` (braços ou ramos) a partir do projeto principal (o `trunk`, denominado `branch master`). Outros desenvolvedores também farão mudanças e as salvarão (`git commit`) em seus branches.

Quando terminar sua parte do projeto, você mesclará seu `branch` com o `branch master` e fará uma solicitação de `pull` para que todos os seus colegas de trabalho saibam que uma etapa do projeto está pronta. Quando outro colaborador enviar suas alterações para o *GitHub* (`git commit` e `git push`), o *Git* irá alertá-lo de que sua versão está desatualizada (ele ainda não baixou o que você enviou para o repositório) e pedirá ao colega para atualizar a nova versão em sua máquina (`git pull`). O *Git* enviará as informações recém-adicionadas ao seu colega e permitirá que você mescle as diferentes versões (`git merge`). Além disso, ele também mostrará onde as atualizações foram feitas, trechos de código adicionados ou removidos e casos de conflito onde as linhas podem ser substituídas e oferecerá opções para mesclar manualmente, escolhendo a melhor solução.

![Exemplo de funcionamento do Git e
GitHub.](https://github.com/mmfava/blog/blob/mmf/content/talk/2021-08-14-git-github-rstudio/figs/Slide23.JPG?raw=true)


## Termos importantes

Para usar o *Git*, os desenvolvedores usam comandos específicos para copiar, criar, alterar e combinar código. Esses comandos podem ser executados diretamente da linha de comando do *Git* ou usando um aplicativo como o [GitHub desktop](https://desktop.github.com/) ou [RStudio](https://www.rstudio.com/). Aqui estão os comandos mais comuns para usar o Git:

- `git init` inicializa um novo repositório *Git* e começa a rastrear um diretório existente. Ele adiciona uma subpasta oculta dentro do diretório existente com a finalidade de hospedar a estrutura de dados interna necessária para o controle de versão.

- `git ignore` especifica arquivos que não serão verificados, ou seja, arquivos que o *Git* deve ignorar.

- `git clone` cria uma cópia local (na sua máquina) de um projeto que já existe remotamente. O clone inclui todos os arquivos, histórico e branches do projeto. Ao clonar um repositório, as alterações que você realizar não entrarão no projeto principal se não for sequênciada de um `fork` ou estiver associada por um `branch`.

- `git status` mostra o status das alterações dos arquivos.

- `git branch` são branches de trabalho que permitem edições paralelas em nosso arquivo sem alterar o projeto principal (`branch master`). Em geral, um branch de desenvolvimento é uma bifurcação no estado do código que cria um novo caminho para sua evolução. Ramificações podem estar relacionadas a diferentes tipos de trabalho que compõem nosso projeto (por exemplo, introdução, métodos, resultados e discussão).

- `git merge` é a união de duas branches, geralmente realizada no `branch master`, quando queremos reunir as diferentes partes em um único arquivo (ex. introdução, métodos, resultados e discussão em TCC).

- `git pull`atualiza o pipeline de desenvolvimento local com atualizações de sua contraparte remota. Se um colega de equipe realizou mudanças no projeto/ramificação, você pode baixar essas mudanças no seu computador com esse comando.

- `git push` atualiza o repositório remoto com quaisquer `commits` feitos localmente para um branch.

Saiba mais em [um guia de referência completo para comandos
Git](https://git-scm.com/docs).

# O que é um repositório GitHub?

O **Git** é todo o acervo de arquivos e pastas associados a um projeto, somado ao histórico de versões de cada arquivo. Cada vez que salvamos uma alteração em um arquivo (ou *commitamos*), geramos um histórico de alterações para esse objeto. Todas as versões criadas são listadas pelo *Git* e podem ser organizadas em várias linhas de desenvolvimento chamadas *Branches*. Já o **Hub** é um aparelho
utilizado na área de informática que permite a conexão de computadores a
uma rede para compartilhar informação, sendo a nomenclatura em **GitHub**
associada a conexão entre profissionais de programação de qualquer lugar
do mundo.

Para utilizar o *GitHub* é necessário criar uma conta pessoal ou uma conta de equipe em <https://github.com/>. Para criar a sua conta, entre no [GitHub](https://github.com/) e preencha os dados solicitados — nome, e-mail e senha. Em alguns minutos, você vai receber um e-mail de confirmação para começar a utilizar a plataforma. Além das contas
individuais e gratuitas, também existem aquelas destinadas a trabalhos em equipe e que são pagas.

Após confirar o seu e-mail para o *GitHub*, você estará livre para explorar a ferramenta. Para isso você pode utilizar o guia [Hello World Guide](https://guides.github.com/activities/hello-world/) que o orientará como criar o seu primeiro *repositório*, fazer um `branch` ou abrir um `pull request`.

Mas porque usar o controle de versões?
--------------------------------------

([tradução livre dos comentários em “Why should I use version
control?”](https://stackoverflow.com/questions/1408450/why-should-i-use-version-control))

<img src="https://github.com/gecdfoz/GECD/blob/master/Nivelamento%20e%20Integra%C3%A7%C3%A3o/GitHub/figuras/varios_arquivos.png?raw=true" width="295" />

Você já:

- Teve que manter várias versões de um produto?

- Fez uma alteração no código, percebeu que era um erro e queria voltar?

- Perdeu o código ou tinha um backup antigo?

- Quis ver a diferença entre duas (ou mais) versões do seu código?

- Quis provar que uma determinada alteração quebrou ou consertou um trecho de código?

- Quis revisar o histórico do código?

- Desejou enviar uma alteração no código para outra pessoa?

- Desejou compartilhar seu código ou permitir que outras pessoas trabalhem nele?

- Quis ver quanto trabalho está sendo feito e onde, quando e por quem?

- Desejou experimentar um novo recurso sem interferir no trabalho do código?

Nestes casos, e sem dúvida em outros, um sistema de controle de versão deve tornar sua vida mais fácil.

![](https://media.tenor.com/images/5e43669b9573fea08ede20a5bbbbe2df/tenor.gif)

Mesmo se você trabalhar sozinho, pode se beneficiar do *Git* pelos seguintes motivos:

- Você não perde nada. Você pode deletar frações de seu código e recuperá-las depois de algum tempo verificando antigos `commits`.

- Você pode experimentar à vontade. Se não resolver o problema, inverta o que foi feito.

- Você pode consultar as versões anteriores do seu código para descobrir quando e onde os bugs foram introduzidos.

- Recursos mais "avançados", como ramificação e mesclagem, permitem que você tenha várias linhas paralelas de desenvolvimento. Você pode trabalhar em dois recursos simultaneamente sem interferência e alternar para frente e para trás sem muito trabalho.

- Você pode "ver o que mudou". Freqüentemente, iniciamos o fluxo de trabalho individual com uma pergunta: o que eu fiz ontem?

Vá em frente e experimente. Comece devagar com o básico e aprenda mais à medida que avança. 

Convencido? Bem-vindo ao clube!
