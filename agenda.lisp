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
