# Implementation Steps 
1. Pull Code 
2. Execute Command 
3. Once the execution complete, it will show website url and database connection string. Follow the url and update datbase settings and complete the instalaltion. 

![alt text](/Diagram.png)

# Requirements 
Terraform v0.12.26
provider.azurerm v1.44.0

# Sample Command 
./terraform init
./terraform apply -var="RGName=Test-ResourceGroup" \
-var="RGZone=East Asia" \
-var="AppName=testapp" \
-var="SAName=testapp" \
-var="DBSName=testapp" \
-var="InitDBName=testapp" \
-var="admin_user=testapp" \
-var="admin_login=Secret1123fu?"