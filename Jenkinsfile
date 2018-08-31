#!/usr/bin/env groovy
import groovy.json.JsonSlurperClassic

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
	    sh "cd ${pwd()}/packer;packer build -var-file=/opt/terrform-packer-var-files/templates-variable.json templates.json"
	}
	
    stage('Terraform'){
         sh "cd ${pwd()}/terraform;terraform apply --auto-approve -var-file=/opt/terrform-packer-var-files/terraform.tfvars;terraform output --json > terraform.json"
     }

    stage('Inspec Testing') {
		try {		    
			def inputFile = new File(pwd()+"/terraform/terraform.json")
     		def InputJSON = new JsonSlurperClassic().parseText(inputFile.text)
     		def IPAddress = InputJSON.public_ip_address.value
     		echo "IP Address: "+IPAddress
     		sh "inspec exec cis_tests.rb --reporter cli junit:junit.xml -t ssh://adminis@${IPAddress} -i ~/.ssh/id_rsa"					
		} catch(err) {
			echo "Some Tests Failed! "+err
		} finally {
			junit 'junit.xml'
		}
		
    }	
 }
