# Deploy Bonfire over the Guix System

This channel provides Guix packages and services related to Bonfire. As Bonfire's dependency graph is quite big, there is no single Guix package available yet for it. The current supported way is to deploy Bonfire as an [OCI backed Shepherd service](https://guix.gnu.org/manual/devel/en/guix.html#index-OCI_002dbacked_002c-Shepherd-services).

There is an ongoing effort to package all Bonfire extensions, current efforts are available in the `(bonfire packages ...)` modules.

## Configure

To configure Guix for using this channel you need to create a `.config/guix/channels.scm` file with the following content:

``` scheme
(cons* (channel
        (name 'bonfire)
        (url "https://github.com/bonfire-networks/bonfire-guix")
        (branch "main")
        ;; Enable signature verification:
        (introduction
         (make-channel-introduction
          "2cc6f76adafb6333f0ec3e5fe4835fa0f0d9a0ff"
          (openpgp-fingerprint
           "8D10 60B9 6BB8 292E 829B  7249 AED4 1CC1 93B7 01E2"))))
       %default-channels)
```

Otherwise, if you already have a `.config/guix/channels.scm` you can simply prepend this channel to the preexisting ones:

``` scheme
(cons* (channel
        (name 'bonfire)
        (url "https://github.com/bonfire-networks/bonfire-guix")
        (branch "main")
        ;; Enable signature verification:
        (introduction
         (make-channel-introduction
          "2cc6f76adafb6333f0ec3e5fe4835fa0f0d9a0ff"
          (openpgp-fingerprint
           "8D10 60B9 6BB8 292E 829B  7249 AED4 1CC1 93B7 01E2"))))
       (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        ;; Enable signature verification:
        (introduction
         (make-channel-introduction
          "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
          (openpgp-fingerprint
           "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
       %default-channels)
```

### What is a Guix channel?

A [channel](https://guix.gnu.org/manual/devel/en/guix.html#Channels) is roughly the Guix equivalent of the AUR or container registries. It's a software repository providing Guix package and service definitions.

## Contributing

All contributions are welcome. If you have commit access please remember to setup the authentication hook with

```bash
guix git authenticate --cache-key=channels/bonfire-guix 2cc6f76adafb6333f0ec3e5fe4835fa0f0d9a0ff '8D10 60B9 6BB8 292E 829B  7249 AED4 1CC1 93B7 01E2'
```

## Copyright and License

Copyright (c) 2025 Bonfire Contributors

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public
License along with this program.  If not, see <https://www.gnu.org/licenses/>.
