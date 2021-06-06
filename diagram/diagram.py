# diagram.py
from diagrams import Cluster, Diagram, Edge
from diagrams.aws.management import Cloudwatch
from diagrams.aws.devtools import Codebuild,Codecommit
from diagrams.aws.management import ParameterStore
from diagrams.aws.storage import S3
from diagrams.aws.security import IAMRole

graph_attr = {
    "fontsize": "28",
    "fontname": "Helvetica",
    "style": "rounded",
    "bgcolor": "transparent"
}

major_cluster ={
    "fontsize": "24",
    "fontname": "Helvetica",
    "style": "rounded",
    "bgcolor": "transparent"
}

cluster ={
    "fontsize": "16",
    "fontname": "Helvetica",
    "style": "rounded",
    "bgcolor": "transparent"
}

with Diagram("Codebuild",graph_attr=graph_attr,direction="LR"):

     with Cluster("Code change",graph_attr=major_cluster):

          with Cluster("Trigger",graph_attr=cluster ):
               Trigger=Cloudwatch("Event Trigger")
               IAMRole("Trigger Role") >> Trigger
               Cloudwatch=Codecommit("Code Change") >> Edge(color="firebrick") >> Cloudwatch("Event Rule") >> Trigger

          with Cluster("Build",graph_attr=cluster):
               Build=Codebuild("Codebuild")
               IAMRole("Codebuild Role") >> Build
               Build << Edge(color="black") >> ParameterStore("Build No")
               Build << Edge(color="black") >> ParameterStore("Latest")
               Build >> Edge(color="darkgreen") >> S3("Artefact Store")

     Trigger >> Edge(color="firebrick") >> Build
