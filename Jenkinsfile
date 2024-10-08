pipeline{
    tools {
        terraform 'Terraform'
    }
    parameters{
        booleanParam(name:'autoapprove' , defaultValue:false , description:'Automatically run apply after plan?')
    }
    environment{
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY_ID')
        ENV = 'Prod_Environment'
        FILE = 'prod.tfvars'
    }
    agent any
    stages{
        stage('checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/Devops-13999/Terraform-_jenkins_integration-project_modules.git'
            }
            post{
                success{
                    echo "Checkout Stage succesful"
                }
                failure{
                    echo "Checkout Failed"
                }
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'pwd; cd ${ENV}; terraform init'
            }
        }
        stage('Terraform Plan'){
            steps{
                sh 'pwd; cd ${ENV}; terraform plan -var-file="${FILE}" -out=tfplan'
                sh 'pwd; cd ${ENV}; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Terraform Approval'){
            when{
                not{
                    equals expected: true, actual: params.autoapprove
                }
            }
            steps{
                script{
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan"
                    parameters: [text(name:'Plan' , defaultValue:plan , description: 'please review the plan')]
                }
            }
        }
        stage('Apply'){
            steps{
                sh 'pwd; cd ${ENV}; terraform apply -input=false tfplan'
            }
        }
        stage('Terraform destroy approval'){
            when{
                not{
                    equals expected: true, actual: params.autoapprove
                }
            }
            steps{
                script{
                    input message: "Do you want to destroy infra"
                }
            }
        }
        stage('Terraform Destroy') {
            steps {
                script {
                    // Run Terraform destroy with confirmation
                    sh 'pwd; cd ${ENV}; terraform destroy -var-file="${FILE}" -auto-approve'
                }
            }
        }
    }
 }
