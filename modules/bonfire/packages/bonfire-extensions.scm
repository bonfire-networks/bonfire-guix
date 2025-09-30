;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024, 2025 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages bonfire-extensions)
  #:use-module (gnu packages elixir-databases)
  #:use-module (gnu packages elixir-i18n)
  #:use-module (gnu packages elixir-markup)
  #:use-module (gnu packages elixir-web)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix build-system mix)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire packages bonfire-libraries)
  #:use-module (bonfire packages elixir-databases)
  #:use-module (bonfire packages elixir-web))

(define-public bonfire-common.git
  (let ((version "0.4.0")
        (revision "1")
        (commit "2b158075cd60bcad084c5cca735956f0bd65ede7"))
    (package
      (name "bonfire-common")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/bonfire_common.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1zpb1k2vnsm8qjh6m9gmlzdhc2j3xf7hpzcqs6kcb8fwr8ymsnc8"))))
      (build-system mix-build-system)
    (arguments
     (list
      ;; Tests need a live Postgres instance.
      #:tests? #f))
      (native-inputs (list elixir-assert-value
                           elixir-faker
                           elixir-mess.git))
      (propagated-inputs
       (list bonfire-data-identity.git
             bonfire-paginator.git
             elixir-arrows
             elixir-beam-file
             elixir-decorator
             elixir-ecto-shorts
             elixir-ecto-sparkles
             elixir-ecto-sql
             elixir-emote
             elixir-ex-cldr
             elixir-ex-cldr-dates-times
             elixir-ex-cldr-locale-display
             elixir-ex-cldr-numbers
             elixir-ex-cldr-plugs
             elixir-ex-cldr-units
             elixir-exkismet
             elixir-floki
             elixir-gettext
             elixir-git-diff
             elixir-html-sanitize-ex
             elixir-igniter
             elixir-json-serde
             elixir-nebulex
             elixir-needle-uid.git
             elixir-needle-ulid.git
             elixir-opentelemetry-api
             elixir-pathex
             elixir-process-tree
             elixir-recase
             elixir-sizeable
             elixir-timex
             elixir-untangle
             elixir-zest))
      (synopsis
       "Common Bonfire extension utils")
      (description
       "A library of common utils and helpers used across Bonfire extensions.

An extension for Bonfire that contains:

@itemize
@item Many common functions in {Bonfire.Common.Utils}
@item Path and URL generators in @code{Bonfire.Common.URIs}
@item Date and time helpers in @code{Bonfire.Common.DatesTimes}
@end itemize")
      (home-page "https://github.com/bonfire-networks/bonfire_common")
      (license license:agpl3+))))

(define-public bonfire-fail.git
  (let ((version "0.1.0")
        (revision "0")
        (commit "aa5dfa98b25452f1148b8eb2134b6cc290d8eefb"))
    (package
      (name "bonfire-fail")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/bonfire_fail.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1sgvnx2bninhic25xv6w0mnnlim9wya87ss31hxfcphr3cw3hr3k"))))
      (build-system mix-build-system)
    (arguments
     (list
      ;; There are no tests
      #:tests? #f))
      (native-inputs (list bonfire-paginator.git elixir-phoenix-live-reload))
      (propagated-inputs
       (list bonfire-common.git))
      (synopsis
       "Mapping of error atoms to HTTP codes and friendly messages")
      (description
       "An library for Bonfire that contains:

@itemize
@item Handling, standardizing, and formatting errors and error messages
@item Mapping of error atoms, exceptions, and Changesets to HTTP codes and
friendly messages (see
@uref{https://hexdocs.pm/plug/Plug.Conn.Status.html#code/1-known-status-codes,
@code{Plug.Conn.Status}} and @code{Bonfire.Fail.RuntimeConfig} for built-in
lists of errors, which you can extend)
@item @code{Bonfire.Fail} error struct (e.g. @code{%Bonfire.Fail@{code:
:gateway_timeout, message: \"Gateway Timeout\", status: 504@}})
@item @code{Bonfire.Fail} and @code{Bonfire.Fail.Auth} exceptions (e.g.
@code{raise Bonfire.Fail, :unauthorized} or @code{raise Bonfire.Fail.Auth,
:needs_login})

@end itemize")
      (home-page "https://github.com/bonfire-networks/bonfire_fail")
      (license license:agpl3+))))
