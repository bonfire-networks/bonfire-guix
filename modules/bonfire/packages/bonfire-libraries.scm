;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024, 2025 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages bonfire-libraries)
  #:use-module (gnu packages elixir-databases)
  #:use-module (gnu packages elixir-markup)
  #:use-module (gnu packages elixir-web)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix build-system mix)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire packages elixir-databases))

(define-public bonfire-data-access-control.git
  (let ((version "0.4.0")
        (revision "0")
        (commit "3823ddfb857548ba4b938be25fb14b12993ee677"))
    (package
      (name "bonfire-data-access-control")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/bonfire_data_access_control.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1v3jnf3nr6xcla8f95rai17nn3i79xl0bycjq51rdwmrz234wn4z"))))
      (build-system mix-build-system)
      (arguments
       ;; There are no tests.
       (list #:tests? #f))
      (native-inputs (list elixir-mess.git))
      (propagated-inputs (list elixir-needle))
      (synopsis
       "Implements @code{Bonfire.Data.AccessControl}")
      (description
       "This package provides @code{bonfire-data-access-control}, a library implementing
@code{Bonfire.Data.AccessControl}, @code{Bonfire.Boundaries} and related.")
      (home-page "https://github.com/bonfire-networks/bonfire_data_access_control")
      (license license:mpl2.0))))

(define-public bonfire-data-identity.git
  (let ((version "0.4.0")
        (revision "1")
        (commit "f329680b520d33ff094742e7665c355aa094482d"))
    (package
      (name "bonfire-data-identity")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/bonfire_data_identity.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1glvb84y7zc01plv20ly5x7zszabyjf3iivmrh6nyvpkdwk1034k"))))
      (build-system mix-build-system)
      (arguments
       ;; There are no tests.
       (list #:tests? #f))
      (native-inputs (list elixir-mess.git))
      (propagated-inputs (list bonfire-data-edges.git
                               elixir-ecto-sparkles
                               elixir-needle
                               elixir-untangle))
      (synopsis
       "Schemas for accounts, users, etc")
      (description
       "This package provides @code{bonfire-data-identity}, a library implementing
@code{Bonfire.Data.Edges.Identity} and related.")
      (home-page "https://github.com/bonfire-networks/bonfire_data_identity")
      (license license:mpl2.0))))

(define-public bonfire-data-edges.git
  (let ((version "0.4.0")
        (revision "0")
        (commit "89a6f7b8bdacf726baf4ae53f6c73065e6fc5ff2"))
    (package
      (name "bonfire-data-edges")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/bonfire_data_edges.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0xmag8l5qvawlgq13zaaixw40y7z0bagq7s361573s0gqdcxgp6g"))))
      (build-system mix-build-system)
      (native-inputs (list elixir-mess.git))
      (propagated-inputs (list elixir-needle))
      (synopsis
       "Implements @code{Bonfire.Data.Edges.Edge}")
      (description
       "This package provides @code{bonfire-data-edges}, a library implementing
@code{Bonfire.Data.Edges.Edge} and related.")
      (home-page "https://github.com/bonfire-networks/bonfire_data_edges")
      (license license:mpl2.0))))

(define-public bonfire-paginator.git
  (let ((version "1.0.4")
        (revision "0")
        (commit "faa9909568c86b74838ef5d036fecb003ea77c1f"))
    (package
     (name "bonfire-paginator")
     (version (git-version version revision commit))
     (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/bonfire-networks/paginator.git")
              (commit commit)))
        (file-name (git-file-name name version))
        (sha256
         (base32 "0xgslf2jis0cnq6z0lq7hcldyiq4ln8ra0b6sf40mqwmf4d02fy0"))))
     (build-system mix-build-system)
     (arguments
      (list
       ;; Tests require a live Postgres process
       #:tests? #f
       #:phases
       #~(modify-phases %standard-phases
           (add-after 'unpack 'override-mix-env
             (lambda _
               (symlink (string-append (getcwd) "/config/dev.exs")
                        "config/prod.exs"))))))
     (native-inputs
      (list elixir-ex-machina elixir-inch-ex))
     (propagated-inputs
      (list elixir-ecto
            elixir-ecto-sql
            elixir-needle-uid.git
            elixir-plug-crypto
            elixir-untangle))
     (synopsis
      "Cursor-based pagination for Elixir Ecto")
     (description
      "This package implements cursor-based pagination for Elixir Ecto.")
     (home-page "https://github.com/bonfire-networks/paginator")
     (license license:expat))))

(define-public elixir-mess.git
  (let ((version "0.0.0")
        (revision "0")
        (commit "bfe6e3c56c5237017c7fd0fd8d8d804bec267ca6"))
    (package
     (name "elixir-mess")
     (version (git-version version revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bonfire-networks/mess.git")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ql3lz4y7wfd4cl2dpdr63qh5vrqc6bpf1154yjcgpf947w0784y"))))
     (build-system mix-build-system)
     (synopsis
      "Simple, file-based dependency management with git and local overrides")
     (description
      "@code{mess} implements simple, file-based dependency management with git
and local overrides.")
     (home-page "https://github.com/bonfire-networks/mess")
     (license license:mpl2.0))))

(define-public elixir-needle-uid.git
  (let ((version "0.0.1")
        (revision "0")
        (commit "3ec02ce42d96498db286a619a31a40eda2df7fa7"))
    (package
     (name "elixir-needle-uid")
     (version (git-version version revision commit))
     (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/bonfire-networks/needle_uid.git")
              (commit commit)))
        (file-name (git-file-name name version))
        (sha256
         (base32 "1k5i79cwjy73j47k5q5d4zisfm33w7a9j85431w1rqpvgcv8zzld"))))
     (build-system mix-build-system)
     (arguments
      ;; Tests appear to be broken on main
      ;; 9 doctests, 24 tests, 20 failures
      (list #:tests? #f))
     (propagated-inputs
      (list elixir-ecto
            elixir-needle-ulid.git
            elixir-pride.git
            elixir-untangle))
     (synopsis
      "Hybrid prefixed UUIDv7 and ULID data type for Ecto")
     (description
      "This package provides hybrid prefixed UUIDv7 and ULID data type for Ecto
(using @code{elixir-pride} and @code{elixir-needle-ulid})")
     (home-page "https://github.com/bonfire-networks/needle_uid")
     (license license:expat))))

(define-public elixir-pride.git
  (let ((version "0.0.1")
        (revision "0")
        (commit "0b7f989a9db61d5466ea573f181f08e18086ab72"))
    (package
     (name "elixir-pride")
     (version (git-version version revision commit))
     (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/bonfire-networks/pride.git")
              (commit commit)))
        (file-name (git-file-name name version))
        (sha256
         (base32 "1pys07c970nm4h7indn46valmp3bi9hvh0x9mdi8cjg6plxhl96c"))))
     (build-system mix-build-system)
     (propagated-inputs
      (list elixir-ecto
            elixir-ecto-sql
            elixir-untangle
            elixir-uuidv7))
     (synopsis
      "Prefixed UUIDv7 data type for Ecto")
     (description
      "This package provides a prefixed UUIDv7 data type for Ecto, and related
helpers.")
     (home-page "https://github.com/bonfire-networks/pride")
     (license license:expat))))
