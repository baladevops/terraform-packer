#!/usr/bin/env groovy

node {
    stage('Pull') {
	tool name: 'jdk8', type: 'jdk'
	tool name: 'maven', type: 'maven'
	def mvnHome = tool 'maven'
	env.PATH = "${mvnHome}/bin:${env.PATH}"    
        checkout scm
    }

    stage('Build') {        
        sh "mvn -f complete/pom.xml clean install -DskipTests=true"
    }

    stage('Packer') {
	    
	}
	
    stage('Terraform'){
            
     }

    stage('Inspec Testing') {
		try {
			//sh "inspec exec cis_tests.rb --reporter cli junit:junit.xml"			
		} catch(err) {
			//echo "Some Tests Failed!"
		} finally {
			//junit 'junit.xml'
		}
		
    }	
 }