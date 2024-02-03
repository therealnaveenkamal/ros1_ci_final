pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'tortoisebot-cp24:ros1'
        DISPLAY_VAR = ':2'
        TEST_COMMAND = 'rostest tortoisebot_waypoints waypoints_test.test'
        X11_UNIX_MOUNT = '/tmp/.X11-unix'
    }

    stages {
        stage('Install Docker') {
            steps {
                script {
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y docker.io docker-compose'
                    sh 'sudo service docker start'
                    sh 'sudo usermod -aG docker $USER'
                    sh 'newgrp docker'
                    sh 'sudo service jenkins restart'
                    sh 'docker ps -a'
                }
            }
        }
        stage('Build Dockerfile') {
            steps {
                script {
                    dir('/home/user/catkin_ws/src/ros1_ci') {
                        sh 'sudo docker build -t tortoisebot-cp24:ros1 .'
                    }
                }
            }
        }
        stage('Docker Run') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).pull()
                    def container = docker.container(DOCKER_IMAGE)
                        .withRun('--env DISPLAY=$DISPLAY_VAR --volume $X11_UNIX_MOUNT:$X11_UNIX_MOUNT')
                        .inside {
                            sh "bash -c 'export DISPLAY=$DISPLAY_VAR && $TEST_COMMAND'"
                        }
                }
            }
        }
    }
}