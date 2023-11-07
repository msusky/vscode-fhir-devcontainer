# VS Code FHIR development containers

[![Docker Images](https://github.com/cybernop/vscode-fhir-devcontainer/actions/workflows/docker.yaml/badge.svg)](https://github.com/cybernop/vscode-fhir-devcontainer/actions/workflows/docker.yaml)

Prebuilt VS Code development containers providing tools to build FHIR profiles using FSH sushi and IGs.

## Images and tags

Available images:

* only FSH sushi: `ghcr.io/cybernop/vscode-fhir-devcontainer/fsh-sushi`
* FSH sushi and IG publisher: `ghcr.io/cybernop/vscode-fhir-devcontainer/ig-publisher`

Available tags (`<sushi version>-<os base>`):

* `3.5.0-alpine`
* `3.5.0-ubuntu`
* `3.4.0-alpine`
* `3.4.0-ubuntu`
* `3.3.3-alpine`
* `3.3.3-ubuntu`
* `3.3.0-alpine`
* `3.3.0-ubuntu`
* `3.2.0-alpine`
* `3.2.0-ubuntu`
* `3.1.0-alpine`
* `3.1.0-ubuntu`
* `3.0.0-alpine`
* `3.0.0-ubuntu`
* `2.10.2-alpine`
* `2.10.2-ubuntu`

## Usage

### Simple usage

The easiest way using one of the development containers is by creating `.devcontainer/devcontainer.json` in your project root and set

```json
{
    "image": "<image>:<tag>"
}
```

### Advanced usage

To modify the base image, e.g. for installing other dependencies, one can create your own `Dockerfile` in `.devcontainer` like:

```Dockerfile
FROM <image>:<tag>

# Do stuff
```

and instead of setting the `image` property in `devcontainer.json` set

```json
{
    "build": {
        "dockerfile": "Dockerfile"
    }
}
```

For more information about dev containers, see [https://containers.dev/implementors/json_reference/](https://containers.dev/implementors/json_reference/).
