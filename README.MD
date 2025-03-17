
# Jenkins with docker + nodejs + npm

Jenkins image based on official Jenkins image, adding support for Docker, NodeJS and npm.

It all started when I wanted to build my own projects in my own server. Didn't want to install a Jenkins in the server itself so I decided to use a Docker image.

One of the projects is a Docker image also, so I needed Docker support within the Jenkins image.


## Deployment

To deploy this project run

```bash
  docker run -d -p 8080:8080 -p 50000:50000 -v <local_path>:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) --name jenkins ldeazevedo/jenkins:latest
```


## Authors

- [@ldeazevedo](https://www.github.com/ldeazevedo)


## Contributing

Contributions are always welcome!

Please create a pull request to start contributing.


## License

[GPL 3.0](https://choosealicense.com/licenses/gpl-3.0/)

