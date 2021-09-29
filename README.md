# Description

This simple Perl script allows generating plain text file equivalents
of an existing SQL-based e-mail definition. Its purpose is primarily
to make mail servers insensitive to database outages.

Currently, it supports the Postfix system (specifically, setting up
`virtual_alias_maps`, `virtual_mailbox_domains` and `virtual_mailbox_maps`).
Other systems can be easily supported by adding additional templates and
adjusting the YAML-based config file.

Different mail system definitions can be supported by adjusting the `query`
parameters, allowing integration of multiple e-mail backends into separate files.


# Runtime dependencies

## Ubuntu 18.04 LTS

To get maildb2file working on Ubuntu 18.04 LTS, the following dependencies are required.

```bash
sudo apt install libmodern-perl-perl
sudo apt install libdbi-perl
sudo apt install libdbd-mysql-perl
sudo apt install libyaml-libyaml-perl
sudo apt install libtemplate-perl
```

## OpenBSD

A similar set of packages is required for use on OpenBSD.

```sh
doas pkg_add p5-Modern-Perl
doas pkg_add p5-DBI
doas pkg_add p5-DBD-MariaDB
doas pkg_add p5-DBD-mysql
doas pkg_add p5-YAML-XS
doas pkg_add p5-Template
```