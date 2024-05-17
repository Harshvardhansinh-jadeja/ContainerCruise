from diagrams import Diagram,Cluster,Edge
from diagrams.aws.compute import EC2,EC2ContainerRegistry
from diagrams.aws.general import Users
from diagrams.aws.compute import ECS,Fargate
from diagrams.aws.database import RDSInstance
from diagrams.aws.network import  VPC, ALB,PublicSubnet,PrivateSubnet,InternetGateway,NATGateway,RouteTable
from diagrams.aws.management import CloudwatchAlarm
from diagrams.aws.integration import SimpleNotificationServiceSnsEmailNotification


graph_attr = {
    "fontsize": "30",
    "bgcolor": "transparent"
}

edge_attr = {
    "minlen": "2.0",
    "penwidth":"3.0",
    "concentrate": "true"
}

with Diagram("Containerized Application",outformat="jpg",show=False,graph_attr=graph_attr,edge_attr=edge_attr):
   users=Users("End User") 
   alb=ALB("Application Load Balancer")
   igw=InternetGateway("IGW")
   ecr= EC2ContainerRegistry("ECR")
   cloudwatch= CloudwatchAlarm("5XX Error")
   cloudwatch>>SimpleNotificationServiceSnsEmailNotification("Email")

   with Cluster("VPC"):
      with Cluster("Public Subnet"):
        nat = NATGateway("NAT")
        bastion = EC2("Bastion Host")
      with Cluster("Private Subnet"):
        rds = RDSInstance("Database")
        ecs= ECS("ECS")    

        users>>alb>>igw>>nat>>ecs
        ecs-rds
        ecs<<ecr
        ecs>>cloudwatch
        bastion>>Edge(label="Private Connection")>>rds


