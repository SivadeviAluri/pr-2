pipeline {

 agent any

 stages {

 stage('Clone Code') {
 steps {
 git 'https://github.com/yourusername/devops-java-project.git'
 }
 }

 stage('Create Infrastructure') {
 steps {
 sh 'cd terraform && terraform init'
 sh 'cd terraform && terraform apply -auto-approve'
 }
 }

 stage('Build Artifact') {
 steps {
 sh 'mvn clean package'
 }
 }

 stage('Sonar Scan') {
 steps {
 sh 'mvn sonar:sonar'
 }
 }

 stage('Docker Build') {
 steps {
 sh 'docker build -t java-app .'
 }
 }

 }

}
