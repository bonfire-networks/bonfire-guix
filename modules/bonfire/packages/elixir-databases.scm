;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024, 2025 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages elixir-databases)
  #:use-module (gnu packages elixir-databases)
  #:use-module (gnu packages elixir-markup)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix build-system mix)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages))

(define-public elixir-ecto-sparkles
  (package
    (name "elixir-ecto-sparkles")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ecto_sparkles" version))
       (sha256
        (base32 "1ry89mk103jpv73971lwx3vmn9n6zd3ycya1ac1pr3r53f4hmkb0"))))
    (build-system mix-build-system)
    (propagated-inputs
     (list elixir-ecto
           elixir-ecto-dev-logger
           elixir-ecto-sql
           elixir-html-sanitize-ex
           elixir-recase
           elixir-untangle))
    (synopsis
     "Helper library to better join + preload Ecto associations")
    (description
     "This package provides andhelper library to better join + preload Ecto
associations, and other goodies.")
    (home-page "https://hexdocs.pm/ecto_sparkles/")
    (license license:asl2.0)))

(define-public elixir-needle-ulid.git
  (let ((version (package-version elixir-needle-ulid))
        (revision "0")
        (commit "10f9ad7c9916f9ff3d5e4f34a1a270c45056fe8d"))
    (package
      (inherit elixir-needle-ulid)
      (name "elixir-needle-ulid.git")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/needle_ulid.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1iknjj3jhj5z2wyjym8bvz6syrwjx6wvmbc246a9rm25yd0szn44")))))))
