(require                                                                               'package)           ; Habilita o gerenciador de pacotes.
(require                                                                           'use-package)
(require                                                                                   'org)
(require                                                                           'org-bullets)
(require                                                                                 'color)


(setq inhibit-startup-message                                                                 t)           ; Desabilita o buffer inicial do emacs.
(setq initial-buffer-choice                                      'my-setup-initial-window-setup)           ; Define o buffer inicial.
(setq initial-major-mode                                                             'text-mode)           ; Define o tipo de buffer inicial.
(setq backup-directory-alist                                        '(("." . "~/.backupEmacs")))           ; Define pasta de backups do emacs.
(setq scroll-step                                                                             1)           ; Rola uma linha com o teclado.
(setq mouse-wheel-scroll-amount                                              '(1 ((shift) . 1)))           ; Rola uma linha com o mouse.
(setq scroll-margin                                                                           0)           ; Quão próximo o cursor chega do topo ou do fundo.                           
(setq scroll-conservatively 10000
      auto-window-vscroll nil                                                                  )           ; Evita saltar para o meio da tela ao rolar o mouse.                               
(setq org-startup-with-inline-images                                                          t)           ; Exibe as imagens in line. 
(setq org-download-image-dir                                                  "~/Imagens/Emacs")           ; Define onde as imagens serão armazenadas.
(setq display-time-day-and-date                                                               t)           ; Exibe da e hora na barra inferior.
(setq display-time-format                                                                   nil)           ; Permite exibir a data e hora na barra.
(setq display-time-24hr-format                                                                t)           ; Altera o formato da hora para 24hr.


(display-time-mode                                                                            1)           ; Ativa a exibição da data e hora na barra.
(add-to-list 'initial-frame-alist '(fullscreen . maximized)                                    )           ; Inicia o frame maximizado. 
(global-hl-line-mode                                                                          1)           ; Exibe/inibe destaque de linha.
(column-number-mode                                                                           1)           ; Exibe/inibe coluna atual na modeline.
(delete-selection-mode                                                                        1)           ; Substitui a selecao pelo digitado.
(global-linum-mode                                                                           -1)           ; Exibe/inibe numeracao de linhas.
(scroll-bar-mode                                                                             -1)           ; Exibe/inibe a barra de rolagem.
(tool-bar-mode                                                                               -1)           ; Exibe/inibe a barra de ferramentas.
(menu-bar-mode                                                                               -1)           ; Exibe/inibe a barra de menu.
(set-background-color                                                                   "black")           ; Define a cor de fundo do emacs.
(set-foreground-color                                                                "DarkGrey")           ; Define a cor da fonte no emacs.
(set-cursor-color                                                                       "black")           ; Define a cor do cursor no emacs.



(add-to-list 'package-archives                    '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives                    '("melpa" . "https://melpa.org/packages/"   ))
(package-initialize                                                                            )



(use-package org
  :config
  (setq org-ellipsis                                                                       " ▾")           ; Altera o caracter de blocos.
  (setq org-hide-emphasis-markers                                                             t)           ; Esconde o ** e // do negrito e itálico.
  (setq org-agenda-files                  (list"~/Documentos/FilesOrgMode/FileTestOrgMode.org"))           ; Lista de arq. de resumo orgMode.
  (setq org-todo-keywords
       (quote ((sequence "TODO(t)" "|" "DOING(s!)" "|" "DONE(d@/!)")
               (sequence "HOLD(h@/!)" "|" "CANCELLED(c@/!)")))                                 )           ; Altera os estados possíveis para os TODOs. @ insere data e ! pede comentário.
  (setq org-todo-keyword-faces                                                                             
      (quote (("TODO"      :foreground "light green" :weight bold)
              ("DOING"     :foreground "green"       :weight bold)
              ("DONE"      :foreground "blue"        :weight bold)
              ("HOLD"      :foreground "yellow"      :weight bold)
              ("CANCELLED" :foreground "gray"        :weight bold)))                           )           ; Altera as cores dos estados dos TODOs.
  (setq-default org-enforce-todo-dependencies                                                 t)           ; Obriga a finalização dos tópicos filhos antes
  (setq-default fill-column                                                                 100)
  (auto-fill-mode                                                                             t)           ; As linhas são quebradas automaticamente.
  (visual-line-mode                                                                           t)           ; As linhas são quebradas automaticamente.
  (org-indent-mode                                                                            t)           ; Mostra apenas a última estrela dos tópicos, simulando identação.
  (font-lock-add-keywords 'org-mode                                                                       
               	          '(("^ *\\([-]\\) "
       (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))))                 )           ; Troca o marcador "-" pelo marcador "•" nas listas.
  (set-face-attribute 'org-level-1 nil        :height 1.50 :foreground "#BEA4DB"               )
  (set-face-attribute 'org-level-2 nil        :height 1.00 :foreground "#A382FF" :slant 'italic)
  (set-face-attribute 'org-level-3 nil        :height 1.00 :foreground "#5E65CC" :slant 'italic)
  (set-face-attribute 'org-level-4 nil        :height 1.00 :foreground "#ABABFF"               )
  (set-face-attribute 'org-level-5 nil        :height 1.00 :foreground "#2843FB"               )
  (set-face-attribute 'org-date nil           :height 0.8  :foreground "#ECBE7B"               )
  (set-face-attribute 'org-document-title nil :height 1.50 :foreground "DarkOrange3"           )
  (set-face-attribute 'org-ellipsis nil                    :foreground "#4f747a" :underline nil)

  (set-face-attribute 'org-block nil :background                                                           ; Início da costomização dos blocos de código.
                    (color-darken-name
                    (face-attribute 'default :background) 3)                                   )

  (setq org-src-block-faces '(("lisp" (:background "#EEE2FF"))
                              ("c++"  (:background "Black" :foreground "White" :height 0.85))) )    ; Fim da customização dos blocos de código.
)







(use-package org-bullets
  :after
  org
  :hook
  (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))                                     )



(defun my-setup-initial-window-setup ()
  (interactive)
  (switch-to-buffer (find-file "~/.emacs.d/init.el"))
  (split-window-vertically)
  (other-window 1)
  (switch-to-buffer (find-file "~/Documentos/FilesOrgMode/LicoesAprendidas.org"))
  (split-window-horizontally)
  (switch-to-buffer (get-buffer-create "tree"))
)



(defun novoBuffer()                                                                                        ; Função para criar um novo buffer.
  (interactive)
  (let ((thiago/buf (generate-new-buffer "novoBuffer")))
    (switch-to-buffer thiago/buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)
    thiago/buf)
  )



(defcustom org-hidden-links-additional-re "<<[<]?[[:alnum:]]+>>[>]?"                                       ; Início do conjunto de funções para esconder os marcadores << >> das âncoras.
  "Regular expression that matches strings where the invisible-property is set to org-link."
  :type '(choice (const :tag "Off" nil) regexp)
  :group 'org-link)
(make-variable-buffer-local 'org-hidden-links-additional-re)

(defun org-activate-hidden-links-additional (limit)
  "Put invisible-property org-link on strings matching `org-hide-links-additional-re'."
  (if org-hidden-links-additional-re
      (re-search-forward org-hidden-links-additional-re limit t)
    (goto-char limit)
    nil))

(add-hook 'org-font-lock-set-keywords-hook (lambda ()
                         (add-to-list 'org-font-lock-extra-keywords
                              '(org-activate-hidden-links-additional
                                (0 '(face org-target invisible org-link))))))                              ; Fim do conjunto de funções para esconder os marcadores << >> das ancoras.
