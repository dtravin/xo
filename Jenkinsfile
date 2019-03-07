pipeline {
    agent {
	label 'gce-slaves'
    }

    environment {
	REGISTRY="gcr.io/scale-devops-public"
	BUILD_DIR = "${WORKSPACE}/src/github.com/LiflandGaming/xo"
    }

    stages {
	stage("Init") {
	    steps {
		script {
		    sh "mkdir -p ${env.BUILD_DIR}"
		    dir("${env.BUILD_DIR}") {
			checkout scm
		    }
		}
	    }
	}

	stage("Deploy") {
	    steps {
		script {
		    dir("${env.BUILD_DIR}") {
			withDockerRegistry(url: 'https://gcr.io', credentialsId: 'gcr:scale-devops') {
			    sh "make push"
			}
		    }
		}
	    }
	}
    }
}
