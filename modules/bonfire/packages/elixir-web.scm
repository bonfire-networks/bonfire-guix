;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024, 2025 Giacomo Leidi <therewasa@fishinthecalculator.me>

(define-module (bonfire packages elixir-web)
  #:use-module (gnu packages elixir-web)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix build-system mix)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire utils))

(define-public elixir-exkismet
  (let ((version "0.0.2")
        (revision "0")
        (commit "fb1c9dec828bd68bf62bb1e22c85a682349a6b07"))
   (package
     (name "elixir-exkismet")
     (version (git-version version revision commit))
     (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/cameronp/exkismet.git")
              (commit commit)))
        (file-name (git-file-name name version))
        (sha256
         (base32 "1dx7h4hq2x94c1g6g4pbwvs9jjvf4ivdc3yycnkm381lsmg5si9y"))
        (patches
         ;; Without this PR exkismet is not buildable,
         ;; see https://github.com/cameronp/exkismet/pull/6
         (bonfire-search-patches
          "elixir-exkismet-tcitworld-Update-project.patch"
          "elixir-exkismet-tcitworld-build-deps-Update-dependencies.patch"))))
     (build-system mix-build-system)
     (arguments
      (list #:tests? #f))
     (propagated-inputs (list elixir-httpoison elixir-poison))
     (synopsis
      "Client for the Akismet.com")
     (description
      "This package provides a client (completely unofficial) for the Akismet.com
comment-spam detection API.")
     (home-page "https://hexdocs.pm/exkismet/")
     (license license:expat))))

(define-public elixir-opentelemetry-semantic-conventions
  (package
    (name "elixir-opentelemetry-semantic-conventions")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "opentelemetry_semantic_conventions" version))
       (sha256
        (base32 "15b8gp0897ck75gppns2bb2yy0q5ds0fc9xmfj6nds4ycgss27yn"))))
    (build-system mix-build-system)
    (arguments
     ;;Tests depend on covertool, which is not packaged yet.
     (list #:tests? #f))
    (synopsis "OpenTelemetry Semantic Conventions")
    (description "@code{OpenTelemetry} Semantic Conventions.")
    (home-page "https://hexdocs.pm/opentelemetry_semantic_conventions/")
    (license license:asl2.0)))

(define-public elixir-opentelemetry-api
  (package
    (name "elixir-opentelemetry-api")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "opentelemetry_api" version))
       (sha256
        (base32 "1h852mhnkwan1javf26wl58bpnxgngvfbas8prhsrqvihv1mr2ly"))))
    (build-system mix-build-system)
    (arguments
     ;;Tests depend on covertool, which is not packaged yet.
     (list #:tests? #f))
    (propagated-inputs (list elixir-opentelemetry-semantic-conventions))
    (synopsis "OpenTelemetry API")
    (description "@code{OpenTelemetry} API.")
    (home-page "https://hexdocs.pm/opentelemetry_api/")
    (license license:asl2.0)))
