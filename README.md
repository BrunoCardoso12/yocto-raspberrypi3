# Yocto Raspberry Pi 3

Projeto de construção de uma imagem Linux personalizada para a **Raspberry Pi 3**, utilizando o [Yocto Project](https://www.yoctoproject.org/) e o OpenEmbedded.

O objetivo é aprender e documentar o processo de criação de uma distribuição Linux embarcada, desde a preparação do ambiente de desenvolvimento até a geração de uma imagem inicializável para a placa.

## Objetivos

- Aprender a estrutura e o funcionamento do Yocto Project.
- Construir imagens Linux personalizadas para sistemas embarcados.
- Utilizar o BitBake para gerenciamento e compilação de receitas.
- Desenvolver uma camada própria para futuras personalizações.
- Organizar um ambiente de compilação reproduzível utilizando Docker.

## Hardware de destino

- **Placa:** Raspberry Pi 3
- **Arquitetura:** ARM 64 bits
- **MACHINE:** `raspberrypi3-64`

## Tecnologias utilizadas

- Yocto Project 6.0.4 (Wrynose)
- OpenEmbedded Core
- BitBake 2.18
- Meta-RaspberryPi
- Meta-Bruno (camada personalizada)
- Docker
- Ubuntu 24.04 (ambiente de compilação)

## Organização dos repositórios

O projeto utiliza repositórios separados para manter o ambiente de compilação, as camadas e a configuração da plataforma organizados.

| Repositório | Finalidade |
|---|---|
| [yocto-builder](https://github.com/BrunoCardoso12/yocto-builder) | Ambiente de compilação baseado em Docker |
| [meta-bruno](https://github.com/BrunoCardoso12/meta-bruno) | Camada personalizada do projeto |
| yocto-raspberrypi3 | Configurações e integração para Raspberry Pi 3 |

## Estrutura do projeto

```text
yocto-raspberrypi3/
├── conf/
│   ├── bblayers.conf
│   └── local.conf
├── scripts/
│   └── prepare.sh
├── .gitignore
└── README.md
```

## Preparação do ambiente

O ambiente de compilação utiliza o projeto `yocto-builder`, responsável por fornecer as dependências necessárias por meio de um container Docker.

Primeiro, prepare os repositórios de dependências:

```bash
./scripts/prepare.sh
```

O script organiza as fontes utilizadas pelo projeto dentro do diretório de trabalho do `yocto-builder`.

## Configuração

O projeto utiliza os seguintes parâmetros principais:

```bitbake
MACHINE = "raspberrypi3-64"
DISTRO = "poky"
```

As camadas utilizadas são:

- `openembedded-core/meta`
- `meta-yocto/meta-poky`
- `meta-yocto/meta-yocto-bsp`
- `meta-raspberrypi`
- `meta-bruno`

## Compilação

Após preparar o ambiente Docker e inicializar o ambiente do Yocto, copie os arquivos de configuração do projeto para o diretório de compilação.

```bash
cp /repo/conf/local.conf conf/local.conf
cp /repo/conf/bblayers.conf conf/bblayers.conf
```

Confira as camadas reconhecidas:

```bash
bitbake-layers show-layers
```

Para gerar a imagem inicial:

```bash
bitbake core-image-minimal
```

Os arquivos gerados ficam no diretório:

```text
tmp/deploy/images/raspberrypi3-64/
```

## Desenvolvimento

Este repositório será atualizado gradualmente conforme o avanço dos estudos e experimentos com o Yocto Project.

As receitas, funcionalidades e personalizações serão adicionadas ao longo do desenvolvimento.

## Licença

Este projeto é destinado a estudos e experimentação com tecnologias de sistemas embarcados.
