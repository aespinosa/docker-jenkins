#!/usr/bin/env bats

@test "can import jobs from a data container" {
  # Arrange
  # prepare configuration
  jenkins_dir=$BATS_TMPDIR/$BATS_TEST_NAME
  job_dir=$jenkins_dir/jobs/test-job
  mkdir -p $job_dir
  cat > $job_dir/config.xml << EOF
<project>
  <description>Test jenkins job</description>
</project>
EOF
  data_container=${BATS_TEST_NAME}_data
  jenkins_container=${BATS_TEST_NAME}_jenkins


  # prepare data container
  docker run -v /jenkins --name $data_container busybox true
  # import config to data container
  (
  cd $jenkins_dir
  tar -c jobs/*/config.xml | docker run -a stdin -i \
    --volumes-from $data_container --rm=true busybox tar -xC /jenkins
  )
  # launch the container
  docker run --volumes-from $data_container -d --name $jenkins_container aespinosa/jenkins

  ip=`docker inspect -f '{{ .NetworkSettings.IPAddress }}' $jenkins_container`
  url=http://$ip:8080/job/test-job/config.xml
  sleep 30
  # grab configuration from the container
  # Act
  run curl -s $url

  # cleanup
  docker rm -f $data_container $jenkins_container

  # Assert
  [ "$output" = "`cat $job_dir/config.xml`" ]
}
