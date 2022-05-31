# report-in-codespaces

[![Build Container](https://github.com/pycabbage/report-in-codespaces/actions/workflows/build.yml/badge.svg)](https://github.com/pycabbage/report-in-codespaces/actions/workflows/build.yml)

texlive codespaces pre-built on CI

## `.devcontainer/Dockerfile` Example

```Dockerfile
FROM ghcr.io/pycabbage/report-in-codespaces/codespaces:latest

# Install package if necessary
#tlmgr install sourcesanspro
```

## Self-Build Image
[Fork this repository](https://github.com/pycabbage/report-in-codespaces/fork)


## contained tools

- texlive
- latexindent
- pandoc
- pandoc-crossref
