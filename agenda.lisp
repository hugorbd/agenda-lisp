(defvar AGENDA NIL)

; Busca um contato pelo nome na agenda
(defun BUSCAR (AGENDA NOME)
  (cond
    ((eq AGENDA NIL) NIL)
    ((eq (car (car AGENDA)) NOME) (car AGENDA))
    (t (BUSCAR (cdr AGENDA) NOME))
  )
)

; Adiciona um telefone no final de um contato
(defun ADICIONAR-TELEFONE (CONTATO TELEFONE)
  (cond
    ((eq CONTATO NIL) (cons TELEFONE NIL))
    (t (cons (car CONTATO) (ADICIONAR-TELEFONE (cdr CONTATO) TELEFONE)))
  )
)

; Atualiza o contato dentro da agenda
(defun ATUALIZAR-CONTATO (AGENDA NOME TELEFONE)
  (cond
    ((eq AGENDA NIL) NIL)
    ((eq (car (car AGENDA)) NOME)
     (cons (ADICIONAR-TELEFONE (car AGENDA) TELEFONE) (cdr AGENDA)))
    (t (cons (car AGENDA) (ATUALIZAR-CONTATO (cdr AGENDA) NOME TELEFONE)))
  )
)

; Função inclui nome+telefone na agenda
(defun INCLUIR (AGENDA CONTATO)
  (cond
    ((eq (BUSCAR AGENDA (car CONTATO)) NIL)
     (cons CONTATO AGENDA))
    (t (ATUALIZAR-CONTATO AGENDA (car CONTATO) (car (cdr CONTATO))))
  )
)

; Retorna os telefones de um contato dado o nome
(defun TELEFONES (AGENDA NOME)
  (cond
    ((eq (BUSCAR AGENDA NOME) NIL) 'INEXISTENTE)
    (t (cdr (BUSCAR AGENDA NOME)))
  )
)

; Remove um telefone especifico da lista de um contato
(defun REMOVER-TELEFONE (CONTATO TELEFONE)
  (cond
    ((eq CONTATO NIL) NIL)
    ((eq (car CONTATO) TELEFONE) (cdr CONTATO))
    (t (cons (car CONTATO) (REMOVER-TELEFONE (cdr CONTATO) TELEFONE)))
  )
)

; Remove o contato inteiro da agenda pelo nome
(defun REMOVER-CONTATO (AGENDA NOME)
  (cond
    ((eq AGENDA NIL) NIL)
    ((eq (car (car AGENDA)) NOME) (cdr AGENDA))
    (t (cons (car AGENDA) (REMOVER-CONTATO (cdr AGENDA) NOME)))
  )
)

; Substitui o contato na agenda pelo contato atualizado
(defun SUBSTITUIR-CONTATO (AGENDA NOME NOVO-CONTATO)
  (cond
    ((eq AGENDA NIL) NIL)
    ((eq (car (car AGENDA)) NOME) (cons NOVO-CONTATO (cdr AGENDA)))
    (t (cons (car AGENDA) (SUBSTITUIR-CONTATO (cdr AGENDA) NOME NOVO-CONTATO)))
  )
)

; Aplica a exclusao do telefone no contato ja encontrado
(defun EXCLUIR-AUXILIAR (AGENDA NOME CONTATO TELEFONE)
  (cond
    ((eq CONTATO NIL) AGENDA)
    ((eq (cdr (REMOVER-TELEFONE CONTATO TELEFONE)) NIL)
     (REMOVER-CONTATO AGENDA NOME))
    (t (SUBSTITUIR-CONTATO AGENDA NOME (REMOVER-TELEFONE CONTATO TELEFONE)))
  )
)

; Remove um telefone da agenda dado o nome e o telefone
(defun EXCLUIR (AGENDA ENTRADA)
  (EXCLUIR-AUXILIAR AGENDA
               (car ENTRADA)
               (BUSCAR AGENDA (car ENTRADA))
               (car (cdr ENTRADA)))
)

