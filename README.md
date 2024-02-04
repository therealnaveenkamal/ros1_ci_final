# Jenkins - ROS1 Integration

Within this software repository, you will find the necessary code to seamlessly integrate the ROS1 Testing Framework and Jenkins into a streamlined Continuous Integration and Continuous Deployment (CI/CD) system. The key functionality lies in Jenkins, which actively monitors the repository for any new commits. In response to detected changes, Jenkins initiates a Docker Pipeline at regular one-minute intervals.

The Jenkins Pipeline, a crucial component of this CI/CD setup, assumes the responsibility of orchestrating a series of actions. Firstly, it oversees the construction of a Docker image, leveraging the latest codebase. Subsequently, it orchestrates the entire process by executing `docker-compose up`, ensuring a comprehensive and automated deployment process. This integration ensures efficiency and reliability in the development and deployment lifecycle.

## Prerequisites

Before running the code, ensure you have the following installed:

- ROS1 (Robot Operating System)
- Jenkins
- Docker

Ensure that The Construct platform is active and the DISPLAY:2 (gzclient) is active.

## Usage

1\. Before moving towards the workspace, let us start our Jenkins Server.

```
wget https://raw.githubusercontent.com/TheConstructAi/jenkins_demo/master/run_jenkins.sh && bash run_jenkins.sh
jenkins_address
```

2\. Using the jenkins_address, login using the credentials:

```
admin: admin
```
This is your Jenkins Dashboard.
![Jenkins Dashboard](https://github.com/therealnaveenkamal/ros1_ci_final/assets/80611084/002741a9-fdf1-498c-ad96-82fc4f7f6f2e)

3\. Now let's trigger the build through a pull request:

```
1. Add a new file to this repository and ask to merge.
2. Once the request to merge is accepted, monitor the CP24-ROS1 pipeline and the platform's display.
```
The SCM polling runs every minute and when a new commit is captured, a new build (here #2) is triggered.
![CP24-ROS1 Pipeline Running](https://github.com/therealnaveenkamal/ros1_ci_final/assets/80611084/3829191c-e2c0-4653-923a-38ae68d240a2)

## Output

To view the terminal outputs, you have to navigate to the Console Output in the navigation bar
![Console Output](https://github.com/therealnaveenkamal/ros1_ci_final/assets/80611084/1324beec-c35e-414e-9d7d-657fce9bfb60)

After the execution is complete, you will be able to see the below outputs:

![Gazebo Output](https://github.com/therealnaveenkamal/ros1_ci_final/assets/80611084/25b93475-ca15-47f9-9a1c-6f8ccbd9c066)

![Waypoint Node Test](https://github.com/therealnaveenkamal/ros1_ci_final/assets/80611084/9e8ac9e2-e1fc-49ee-b11a-bab6cc28eb8a)

## Credits

This code is provided with the support of [TheConstruct](https://www.theconstructsim.com/)'s team. Feel free to use and modify it for your own projects.

## Author

- Naveenraj Kamalakannan

- Contact: therealnaveenkamal@gmail.com
