;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2025 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire services bonfire)
  #:use-module (oci services bonfire)
  #:re-export (bonfire-configuration
               bonfire-configuration?
               bonfire-configuration-fields
               bonfire-configuration-flavour
               bonfire-configuration-image
               bonfire-configuration-port
               bonfire-configuration-public-port
               bonfire-configuration-create-database?
               bonfire-configuration-postgres-host
               bonfire-configuration-postgres-user
               bonfire-configuration-postgres-db
               bonfire-configuration-mail-from
               bonfire-configuration-mail-domain
               bonfire-configuration-mail-server
               bonfire-configuration-mail-user
               bonfire-configuration-mail-port
               bonfire-configuration-mail-ssl?

               oci-bonfire-configuration
               oci-bonfire-configuration?
               oci-bonfire-configuration-fields
               oci-bonfire-configuration-image
               oci-bonfire-configuration-upload-data-directory
               oci-bonfire-configuration-configuration
               oci-bonfire-configuration-requirement
               oci-bonfire-configuration-auto-start?
               oci-bonfire-configuration-secret-key-base
               oci-bonfire-configuration-signing-salt
               oci-bonfire-configuration-encryption-salt
               oci-bonfire-configuration-mail-key
               oci-bonfire-configuration-mail-private-key
               oci-bonfire-configuration-mail-password
               oci-bonfire-configuration-postgres-password
               oci-bonfire-configuration-log-file
               oci-bonfire-configuration-network
               oci-bonfire-configuration-extra-variables

               oci-bonfire-upload-data-directory
               oci-bonfire-log-file

               bonfire-configuration->oci-container-environment
               oci-bonfire-configuration->oci-container-configuration

               oci-bonfire-service-type))
