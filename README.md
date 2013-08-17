# docker-jenkins

Sets up a container with jenkins installed listening on port 8080.

## Usage

To run the container, do the following:

```
docker run -d aespinosa/jenkins
docker ps
ID                  IMAGE                     COMMAND                CREATED
STATUS              PORTS
f08460ebd8cc        aespinosa/jenkins:1.522   java -jar /root/jenk   20 minutes
ago      Up 20 minutes       49153->8080
```

Your jenkins instance is now available by going to http://localhost:49153 .

## Building

To build the image, simply invoke

```
docker build github.com/aespinosa/docker-jenkins
```

A prebuilt container is also available in the docker index

```
docker pull aespinosa/jenkins
```



## Author

  * Allan Espinosa (<allan.espinosa@outlook.com>)
  * Gwenn Etourneau

## LICENSE

Copyright 2013 Allan Espinosa

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
