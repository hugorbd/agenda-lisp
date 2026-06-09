# Agenda em Lisp

Trabalho de Programação Funcional - PUC Campinas 2026

Implementação de uma agenda de contatos em Common Lisp.

## Funções
- `INCLUIR` - adiciona um contato ou telefone na agenda
- `EXCLUIR` - remove um telefone ou contato da agenda
- `TELEFONES` - busca os telefones de um contato pelo nome

## Como rodar
1. Instale o SBCL: http://www.sbcl.org/
2. No terminal, navegue até a pasta do projeto
3. Execute:
sbcl --load agenda.lisp

## Exemplo de uso
(setq AGENDA 'nil)
(setq AGENDA (INCLUIR AGENDA '(Bel 32338778)))
(setq AGENDA (INCLUIR AGENDA '(Rose 32666556)))
(TELEFONES AGENDA 'Rose)

## Dupla
- Hugo Rodrigues
- Murilo Brito