# Dreck HTML Minifier Plugin [![License](https://img.shields.io/github/license/sunruse/dreck-html-minifier-plugin.svg)](https://github.com/sunruse/dreck-html-minifier-plugin/blob/master/license) [![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)

Minifies all `*.html` source and intermediate files to equivalent `*.html` dist files (e.g. `./src/a/b.html` and `./ephemeral/intermediate/a/b.html` minify to `./dist/a/b.html`).

## Dependencies

- NodeJS 10.19.0 or later.
- NPM 6.14.4 or later.
- NPX 6.14.4 or later.

All must be available on the PATH (e.g. `node --version`, `npm --version` and `npx --version` all print version strings when executed in a Bash terminal).

### Installing on Debian-based Linux distributions

These are available from most Debian-based Linux distributions' package managers; for example, they can be installed when running Ubuntu 20.04 LTS using the following command:

```bash
sudo apt-get install nodejs npm --yes
```

### Installing within GitHub Actions

Add an appropriate [actions/setup-node](https://github.com/actions/setup-node) action step **before** the `make` action step:

```yml
name: Continuous Integration
on: [push, pull_request]
jobs:
  main:
    runs-on: ubuntu-20.04
    steps:
    - uses: actions/checkout@v3
      with:
        submodules: true

    # Insert this block:
    ###############################
    - uses: actions/setup-node@v3
      with:
        node-version: 12
    ###############################

    - run: make --file ./submodules/dreck/makefile
      shell: bash
    - if: github.event_name == 'release' && github.event.action == 'created'
      uses: softprops/action-gh-release@v1
      with:
        files: dist/**
```

## Installation

Run the following in a Bash shell at the root of your project:

```bash
git submodule add https://github.com/sunruse/dreck-html-minifier-plugin submodules/plugins/html-minifier
```
