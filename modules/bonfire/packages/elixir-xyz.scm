;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024, 2025 Giacomo Leidi <therewasa@fishinthecalculator.me>

(define-module (bonfire packages elixir-xyz)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix build-system mix)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages))

(define-public elixir-mneme
  (package
    (name "elixir-mneme")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "mneme" version))
       (sha256
        (base32 "1rvdimi80cr34vr7i7vmihf40l7r3pyznhr66ncmrch7bphj1xj0"))))
    (build-system mix-build-system)
    (arguments
     ;; Tests depend on elixir-ecto, they are turned off to avoid circular Guile
     ;; modules dependencies.
     (list #:tests? #f))
    (propagated-inputs
     (list elixir-nimble-options
           elixir-owl
           elixir-rewrite
           elixir-sourceror))
    (synopsis "snapshot testing tool")
    (description "This package implements a snapshot testing tool using familiar
assertions.")
    (home-page "https://hexdocs.pm/mneme/")
    (license license:expat)))
