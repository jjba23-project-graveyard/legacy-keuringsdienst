;; keuringsdienst

;; Copyright © Josep Bigorra <jjbigorra@gmail.com>

;; keuringsdienst is free software: you can redistribute it and/or modify
;; it under the terms of the Lesser GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; keuringsdienst is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; Lesser GNU General Public License for more details.

;; You should have received a copy of the Lesser GNU General Public License
;; along with keuringsdienst.  If not, see <https://www.gnu.org/licenses/>.

(define-module (maak)
  #:declarative? #t
  #:use-module (maak maak))

;; ====== Maak constants ======

(define lang-var
  "LANG=C.UTF-8")

(define stack-cmd
  "stack --nix")

(define hot-reload-file-types
  '(hs))


;; ====== Maak tasks ======

(define (test)
  ($ (list lang-var stack-cmd "test")))

(define (build)
  ($ (list lang-var stack-cmd "build")))

(define (release)
  ($ (list lang-var stack-cmd "sdist .")))

(define (hot-reload)
  "Hot-reloading developer's setup."
  (manifest-shell (list "watchexec 'maak test'"
                        "--clear"
                        (~ "--exts ~a"
                           (string-join (map symbol->string
                                             hot-reload-file-types) ","))
                        "--on-busy-update=restart"
                        "--shell bash"
                        "--watch .")))

(define (hr)
  (hot-reload))

(define (dev)
  (hot-reload))

;; WIP
;; (define (fmt)
;;   fmt:
;; 	find . -name '*.hs' -type f -exec ormolu --mode inplace {} \;
;; 	find . -name '*.nix' -exec nixfmt {} \;
;; 	-nix develop -c -- statix check
;; 	-nix develop -c -- deadnix -f)
