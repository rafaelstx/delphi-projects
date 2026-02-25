# 📚 Projetos em Delphi

Este repositório foi criado para armazenar meus projetos desenvolvidos em **Delphi**, como parte do meu processo de aprendizado da linguagem e do ambiente RAD Studio.

Aqui registro exercícios, testes, pequenos sistemas e estudos, acompanhando minha evolução ao longo do tempo.

---

## 🎯 Objetivo

- Aprender a linguagem **Delphi**
- Praticar lógica de programação
- Criar aplicações desktop
- Manter um histórico da minha evolução como desenvolvedor

---

## 🛠️ Tecnologias Utilizadas

- **Delphi / Object Pascal**
- **RAD Studio**
- Git & GitHub para controle de versão

---

# Principais assuntos estudados até o momento:

## 🧠 Fundamentos da Linguagem
* **Estrutura de Units:** Divisão clara entre `interface` (declarações) e `implementation` (lógica).
* **Tipagem Forte:** Entendimento de como o Delphi protege a integridade dos dados, exigindo conversões explícitas.
* **Gerenciamento de Memória:** Diferença entre tipos de valor (**Records**) e tipos de referência (**Classes**), além do uso de `Create` e `Free`.

## 🛠 Estruturas de Controle e Lógica
* **Tomada de Decisão:** Uso avançado de `if..then..else` e a eficiência do `case` para tipos ordinais.
* **Comando `with`:** Atalho para manipulação de propriedades de objetos (e seus riscos de ambiguidade).
* **Loops (Laços de Repetição):**
    * `for` e `for..in`: Iteração segura em coleções e intervalos.
    * `while..do`: Teste no início.
    * `repeat..until`: Teste no fim (executa ao menos uma vez).

## 📦 Tipos de Dados e Coleções
* **Tipos Primitivos:** Conhecimento de *ranges* e consumo de memória (Byte, Integer, Double, Currency).
* **Tipos Customizados:** Criação de tipos **Enumerados** e subintervalos para código mais legível.
* **Arrays:** Diferença técnica e prática entre Arrays **Estáticos** e **Dinâmicos** (`SetLength`).
* **Generics:** Uso de `TList<T>` para coleções tipadas e seguras.

## ⚡ Conceitos Avançados
* **Ponteiros (`^` e `@`):** Manipulação direta de endereços de memória para performance extrema (Scanline) e integração com Windows API.
* **Variants:** Uso de tipos flexíveis e os perigos da perda de tipagem forte.
* **Anonymous Methods:** Implementação de funções anônimas e *closures* para código mais dinâmico.
* **Referências Circulares:** Como identificar e resolver o erro `F2047` através da separação de camadas.

## 🖼 Desenvolvimento de Interface (VCL)
* **Hierarquia da VCL:** Entendimento da árvore desde `TObject` até `TWinControl`.
* **Componentes Standard:** Domínio de Labels, Edits, CheckBox e RadioButtons, entre outros.
* **Gerenciamento de Ações:** Uso de `TActionList` para separar a lógica da interface, centralizando o comportamento de menus e botões.
* **Feedback ao Usuário:** Implementação de diversos componentes visuais (presentes nos projetos do repositório).


