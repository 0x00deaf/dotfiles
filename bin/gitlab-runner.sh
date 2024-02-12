docker stop gitlab-runner;
docker container rm gitlab-runner; 
docker run -d --name gitlab-runner --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v gitlab-runner-config:/etc/gitlab-runner \
    --privileged \
    gitlab/gitlab-runner:latest
