# - - - - - -
# - DOCKER  -
# - - - - - -

function docker-selector-containers() {
  docker ps -a --format="{{.ID}}\t\t{{.Names}}" | \
    fzf -0 -1 --delimiter="\t" --with-nth="-1" | \
    cut -f1
}

function docker-selector-running-containers() {
  docker ps --format="{{.ID}}\t\t{{.Names}}" | \
    fzf -0 -1 --delimiter="\t" --with-nth="-1" | \
    cut -f1
}

function docker-selector-images() {
  docker images --format="{{.ID}}\t\t{{.Repository}}" | \
    fzf -0 -1 --delimiter="\t" --with-nth="-1" | \
    cut -f1
}

function din() {
  docker exec -it $(docker-selector-containers) bash
}

function dlogs() {
  docker logs -f $(docker-selector-running-containers)
}

function dip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' $(docker-selector-containers)
}

function dre() {
  docker restart $(docker-selector-containers)
}

function drm() {
  docker rm $(docker-selector-containers)
}

function drma() {
  docker rm $(docker ps -a | grep Exit | cut -d ' ' -f 1)
}

function drmi() {
  docker rmi -f $(docker-selector-images)
}

function dsp() {
  docker stop $(docker-selector-running-containers)
}

function dspa() {
  docker stop $(docker ps -a | grep Up | cut -d ' ' -f 1)
}

# - - - - - - - -
# - PYTHON ENV  -
# - - - - - - - -

function activate() {
  export VIRTUAL_ENV_DISABLE_PROMPT='1'
  source ./$1/bin/activate
}

# - - - -
# - Git -
# - - - -

function grmb() {
  git branch --merged | \
      egrep -v "(^\*|master|staging)" | \
      xargs git branch -d
}

# - - - -
# - Fzf -
# - - - -

function pv() {
    fzf --preview 'bat {-1} --color=always'
}

# - - - - -
# - MISC  -
# - - - - -

function randomstr() {
  LC_CTYPE=C tr -dc A-Za-z0-9 < /dev/urandom | fold -w ${1:-32} | head -n 1
}

function kill_metals() {
    kill -9 $(ps -xa | grep java | rg '(\d+) .*' -r '$1' | head -n 1)
}

# - - - -
# - ZSH -
# - - - -

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
