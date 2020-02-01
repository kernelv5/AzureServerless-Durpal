<iframe width="700" height="400" style="border:none;"src="https://arcentry.com/app/embed.html?id=af41a860-64f5-4c9d-8960-e77a0e2daecc"></iframe>

This Terraform code designed to deploy a Drupal Server less deployment under Azure Cloud using 

        1. Azure WebApp Service

        Packages Details 
        SKU : PremiumV2 - P1V2
        210 total ACU
        3.5 GB memory
        Dv2-Series compute equivalent
        81.76 USD/Month (Estimated)

        # Note : Packages information can be change from ./variables.tf file SKU_Tier,SKU_Size.

        2. Azure MySQL Database
        General Purpose 
        Gen5 Core 2 
        Storage 100 GB

        # Note : Packages information can be change from ./variables.tf file DBSKU_name,DBSKU_Capacity,DBSKU_Tier,      DBSKU_Family,sp_storage.

## Prerequisites
        1. Create one Resource Group. ( Because of Safety purpose i recommand this way )
        2. User must have Contributor access for that particular resources group. 
        3. Execute using Azure CloudShell or use az clie and login.
        4. Tested under Terraform v0.12.9. 
        5. Open ./variables file and setup the information.
        6. Create one Storage account and Create a folder under blob.
        7. Select Storage account go > Shared access signature > Generate SAS > Copy SAS token

## Execution 

        terraform init
        terraform plan
        terraform apply

## Once Complte you will see some output.

        Apply complete! Resources: 2 added, 0 changed, 1 destroyed.

        Outputs:

        Database_Server_Connection_Details = {
          "Connection_HostName" = "**********.mysql.database.azure.com"
          "DatabaseName" = "********"
          "Database_Password" = "********"