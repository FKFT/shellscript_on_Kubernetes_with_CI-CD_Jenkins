pipeline {
    agent {
        label 'kubernetes'
    }

    environment {
        GITHUB_REPO = 'https://<enter personal token here>@github.com/RomeoFrancoBarro/shift_schedule.git' 
        GITEA_REPO = 'http://git.kodekloud.com:3000/max/playground-project.git' 
        GITEA_USER = 'max' 
        GITEA_PASS = 'Max_pass123'
        DOCKER_USER = '<enter docker user>'
        DOCKER_PASS = '<enter docker pass>'
    }

    stages {
        stage('Clone GitHub Repository') {
            steps {
                script {
                    if (!fileExists('./shift_schedule_repo')) {
                        sh 'git clone ${GITHUB_REPO} ./shift_schedule_repo'
                    } else {
                        echo "GitHub repository already cloned."
                    }
                }
            }
        }

        stage('Push to Gitea Repository') {
            steps {
                script {
                    dir('shift_schedule_repo') {
                        def isPushed = sh(script: 'git remote -v | grep gitea_repo', returnStatus: true)
                        if (isPushed != 0) {
                            sh 'git remote add gitea_repo http://${GITEA_USER}:${GITEA_PASS}@git.kodekloud.com:3000/max/playground-project.git'
                            sh 'git branch -M main'
                            sh 'git push gitea_repo main --force'
                        } else {
                            echo "Repository already pushed to Gitea."
                        }
                    }
                }
            }
        }

        stage('Clone Repository') {
            steps {
                git url: "${env.GITEA_REPO}", branch: 'main' 
            }
        }

        stage('Prepare and Build Docker Image') {
            steps {
                script {
                    sh '''
                        echo "${DOCKER_USER}"
                        echo "${DOCKER_PASS}" | docker login -u "${DOCKER_USER}" --password-stdin
                        docker pull alpine:latest
                        docker build -t ernestoherbas/shift_schedule_image:latest .
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                        kubectl apply -f kubernetes.yaml
                    '''
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    sh '''
                        kubectl get deployments
                        kubectl get pods
                    '''
                }
            }
        }
    }
}

