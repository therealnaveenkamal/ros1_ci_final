pipeline {
    agent any

    stages {
        stage('Install Docker') {
            steps {
                script {
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y docker.io docker-compose'
                    sh 'sudo service docker start'
                    sh 'sudo usermod -aG docker $USER'
                    sh 'newgrp docker'
                    sh 'sudo service docker status'
                    sh 'sudo docker ps -a'
                    sh 'sudo service docker restart'
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
        stage('Into Image'){
            agent {
                docker {
                    image 'tortoisebot-cp24:ros1'
                    args '-v /tmp/.X11-unix:/tmp/.X11-unix'
                }
            }
            steps {
                script {
                    sh 'export DISPLAY=:2'
                    sh 'rostest tortoisebot_waypoints waypoints_test.test'
                }
            }
        }
    }


}