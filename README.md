# docker-js-yaml-format

The goal of this project is to provide a simple dockerized JS script which uses [js-yaml](https://github.com/nodeca/js-yaml) 
library to serialise and dump the provided YAML file to apply consistent YAML file formatting, e.g. indentation, line length, etc. 
This was noticed while using Swagger Editor `Convert to YAML` feature, which internally uses `js-yaml` 
[`safeDump`](https://github.com/nodeca/js-yaml#safedump-object---options-) function (by default uses `DEFAULT_SAFE_SCHEMA` 
which will fail on unsafe types - functions, regex and undefined).

## Demo
Simply run `make build`, then `make run` and compare `openapi.yaml` & `formatted-openapi.yaml` diff.

### Diff
**Before**
```yaml
openapi: 3.0.0
info:
  description: Mauris dignissim sapien eget lectus luctus volutpat. Sed eu sodales lectus, vel molestie ante. Sed id aliquam elit. In et cursus erat. Praesent vitae nibh eget eros ornare dictum. Aenean justo orci, feugiat sit amet lorem et, cursus efficitur tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec euismod malesuada mi, sit amet faucibus metus feugiat nec. Curabitur nec erat sem. Cras fermentum lobortis urna sit amet tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis, ante nec condimentum gravida, ligula quam tempus leo, et rhoncus justo ipsum ac ante. Cras lacinia nisi sed est dapibus, vel vulputate leo tincidunt. Aenean fringilla a nisi in vehicula.
  version: 0.0.1
  title: Lorem Ipsum API
paths:
  /lorem-ipsum:
    get:
      summary: Lorem Ipsum
      description: Ut facilisis tincidunt auctor. Aliquam eget est ut nisl malesuada pretium eget sit amet nunc. Pellentesque ultricies, risus pharetra porta aliquet, purus turpis hendrerit ligula, et mollis arcu massa a neque. Donec mollis magna turpis, ac pellentesque erat molestie a. Donec in neque at erat bibendum sodales. Praesent id nisl enim. Donec interdum tempor ex at pharetra. Proin eget odio nec eros molestie eleifend. Maecenas consectetur augue nec erat facilisis accumsan.
      responses:
        '200':
          description: Perfect
```

**After**
```yaml
failed openapi: 3.0.0
info:
  description: >-
    Mauris dignissim sapien eget lectus luctus volutpat. Sed eu sodales lectus,
    vel molestie ante. Sed id aliquam elit. In et cursus erat. Praesent vitae
    nibh eget eros ornare dictum. Aenean justo orci, feugiat sit amet lorem et,
    cursus efficitur tellus. Pellentesque habitant morbi tristique senectus et
    netus et malesuada fames ac turpis egestas. Donec euismod malesuada mi, sit
    amet faucibus metus feugiat nec. Curabitur nec erat sem. Cras fermentum
    lobortis urna sit amet tempor. Lorem ipsum dolor sit amet, consectetur
    adipiscing elit. Ut lobortis, ante nec condimentum gravida, ligula quam
    tempus leo, et rhoncus justo ipsum ac ante. Cras lacinia nisi sed est
    dapibus, vel vulputate leo tincidunt. Aenean fringilla a nisi in vehicula.
  version: 0.0.1
  title: Lorem Ipsum API
paths:
  /lorem-ipsum:
    get:
      summary: Lorem Ipsum
      description: >-
        Ut facilisis tincidunt auctor. Aliquam eget est ut nisl malesuada
        pretium eget sit amet nunc. Pellentesque ultricies, risus pharetra porta
        aliquet, purus turpis hendrerit ligula, et mollis arcu massa a neque.
        Donec mollis magna turpis, ac pellentesque erat molestie a. Donec in
        neque at erat bibendum sodales. Praesent id nisl enim. Donec interdum
        tempor ex at pharetra. Proin eget odio nec eros molestie eleifend.
        Maecenas consectetur augue nec erat facilisis accumsan.
      responses:
        '200':
          description: Perfect
```

## Run using Docker
```bash
docker run --rm -v "$$PWD":/src -w /src martinsirbe/docker-js-yaml-format:latest my.yaml > formatted.yaml
```

