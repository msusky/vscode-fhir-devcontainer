# VS Code FHIR development containers

[![Docker Images](https://github.com/cybernop/vscode-fhir-devcontainer/actions/workflows/docker.yaml/badge.svg)](https://github.com/cybernop/vscode-fhir-devcontainer/actions/workflows/docker.yaml)

Prebuilt VS Code development containers providing tools to build FHIR profiles using FSH sushi and IGs.

A development container can be used is VS Code by creating a file `.devcontainer/devcontainer.json`. For more information see [https://containers.dev/implementors/json_reference/](https://containers.dev/implementors/json_reference/).

There are images only containing FSH sushi for building FHIR profiles and images containing FSH sushi and the IG publisher to build a FHIR implementation guide to host on a website.

The images containing only sushi are named

```
ghcr.io/cybernop/vscode-fhir-devcontainer/fsh-sushi:<sushi version>-<os base>
```

images containing sushi and the IG publisher

```
ghcr.io/cybernop/vscode-fhir-devcontainer/ig-publisher:<sushi version>-<os base>
```

`<os base>` can be `alpine` or `ubuntu`. `<sushi version>` follow the releases FSH sushi versions. Currently the following versions are supported: `2.10.2`, `3.0.0`, `3.1.0`, `3.2.0`, `3.3.0`.
