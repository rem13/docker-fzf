#
# A set of usefull functions to interact with docker containers
#
function docker-start() {
  container=$(docker container ls -a | awk 'NR>1' | grep -v 'Up' | fzf | awk '{print $NF}')
  test -n "$container" && docker run "$container"
}

function docker-restart() {
  container=$(docker ps | awk 'NR>1' | fzf | awk '{print $NF}')
  test -n "$container" && docker container restart "$container"
}

function docker-stop() {
  container=$(docker ps | awk 'NR>1' | fzf | awk '{print $NF}')
  test -n "$container" && docker container stop "$container"
}

function docker-rm() {
  container=$(docker container ls -a | awk 'NR>1' | grep -v 'Up' | fzf | awk '{print $NF}')
  test -n "$container" && docker container rm "$container"
}

function docker-shell() {
  container=$(docker ps | awk 'NR>1' | fzf | awk '{print $NF}')
  test -n "$container" && docker exec -it "$container" bash -i
}

function docker-logs() {
  container=$(docker container ls -a | awk 'NR>1' | fzf | awk '{print $NF}')
  test -n "$container" && docker logs "$container" | less
}

function docker-top() {
  container=$(docker ps | awk 'NR>1' | fzf | awk '{print $NF}')
  test -n "$container" && docker container top "$container"
}
