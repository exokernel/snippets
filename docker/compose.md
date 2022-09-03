# Docker compose

## Example compose file

gitlab ee

```docker
root@hagbard:~# cat docker-compose.yml
version: '3.1'

volumes:
  gitlab-config:
    external: true
  gitlab-logs:
    external: true
  gitlab-data:
    external: true

services:

  web:
    image: 'gitlab/gitlab-ee:14.10.5-ee.0'
    restart: always
    hostname: 'some.host.com'
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'https://some.host.com'
        # Add any other gitlab.rb configuration here, each on its own line
        gitlab_rails['gitlab_shell_ssh_port'] = 8822
    ports:
      - '80:80'
      - '443:443'
      - '8822:22'
      - '9090:9090'
    volumes:
      - gitlab-config:/etc/gitlab
      - gitlab-logs:/var/log/gitlab
      - gitlab-data:/var/opt/gitlab
```
