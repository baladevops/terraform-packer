#!/usr/bin/env groovy
import groovy.json.JsonSlurper

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
	    sh ""
	}
	
    stage('Terraform'){
            
     }

    stage('Inspec Testing') {
		try {
			def inputFile = new File("terraform/terraform.json")
     		def InputJSON = new JsonSlurper().parseText(inputFile.text)
     		def IPAddress = InputJSON.public_ip_address.value
     		echo "IP Address: "+IPAddress
     		sh "inspec exec cis_tests.rb --reporter cli junit:junit.xml -t ssh://adminis@"+IPAddress+" -i ~/.ssh/id_rsa"					
		} catch(err) {
			echo "Some Tests Failed!"
		} finally {
			junit 'junit.xml'
		}
		
    }	
 }