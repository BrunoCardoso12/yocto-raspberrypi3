#!/bin/bash

set -e

WORKSPACE_DIR="${HOME}/yocto-builder/workspace"
SOURCES_DIR="${WORKSPACE_DIR}/sources"

mkdir -p "${SOURCES_DIR}"

clone_if_missing() {
    local name="$1"
    local url="$2"
    local branch="$3"

    if [ -d "${SOURCES_DIR}/${name}/.git" ]; then
        echo "[OK] ${name} já existe."
    else
        echo "[CLONE] Baixando ${name}..."
        git clone --branch "${branch}" --single-branch \
            "${url}" "${SOURCES_DIR}/${name}"
    fi
}

clone_if_missing "openembedded-core" \
    "https://git.openembedded.org/openembedded-core" \
    "wrynose"

clone_if_missing "meta-yocto" \
    "https://git.yoctoproject.org/meta-yocto" \
    "wrynose"

clone_if_missing "bitbake" \
    "https://git.openembedded.org/bitbake" \
    "2.18"

clone_if_missing "meta-raspberrypi" \
    "https://git.yoctoproject.org/meta-raspberrypi" \
    "wrynose"

clone_if_missing "meta-bruno" \
    "https://github.com/BrunoCardoso12/meta-bruno.git" \
    "main"

echo
echo "Preparação das dependências concluída!"
