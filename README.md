# texlive-codespaces

master build stats: [![Build Container](https://github.com/pycabbage/texlive-codespaces/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/pycabbage/texlive-codespaces/actions/workflows/build.yml)  
develop build stats: [![Build Container](https://github.com/pycabbage/texlive-codespaces/actions/workflows/build.yml/badge.svg?branch=develop)](https://github.com/pycabbage/texlive-codespaces/actions/workflows/build.yml)

texlive codespaces pre-built on CI

## contained tools

- texlive
- latexindent
- pandoc
- pandoc-crossref

## Example codespaces config

`.devcontainer/devcontainer.json`
```json
{
	"name": "Ubuntu",
	"build": {
		"dockerfile": "Dockerfile",
		"args": { "TAG": "latest" }
	},
	"extensions": [
		"James-Yu.latex-workshop",
		"DavidAnson.vscode-markdownlint",
		"VisualStudioExptTeam.vscodeintellicode"
	],
	"remoteUser": "vscode"
}
```
`.devcontainer/Dockerfile`
```Dockerfile
ARG TAG
FROM ghcr.io/pycabbage/texlive-codespaces/codespaces:${TAG}

# Install texlive package
# RUN tlmgr install <package>
```
