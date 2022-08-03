# iti-final-prject #

## bulid Infrastructure architecture ##

#### build my infrastructure using terraform (IAC)

1) setting GCP as my provider

![z](https://user-images.githubusercontent.com/86315031/182568854-3eb71a8c-1a83-4506-bec3-5550731bd7fa.png)

2) network ( vpc , subnets )

![z](https://user-images.githubusercontent.com/86315031/182569030-fad2d0da-a3da-47dd-8587-bcbda4dc9a04.png)

3) natgatway and router to connect bastion and gke to internet

![z](https://user-images.githubusercontent.com/86315031/182569948-feb08274-fca9-4eee-90df-8663e8d39976.png)

4) firewall 

![z](https://user-images.githubusercontent.com/86315031/182569378-4573816f-f486-424b-bea9-f3e42e29c500.png)

5) bastion server for mange GKE cluster

![z](https://user-images.githubusercontent.com/86315031/182571975-7f07304f-fafc-4533-b9e9-4bdf6b4a59f5.png)

6) gke and node pool

![z](https://user-images.githubusercontent.com/86315031/182572485-9d390b7e-da46-4aac-9b1f-3f32b6f63f0e.png)
![z](https://user-images.githubusercontent.com/86315031/182572688-88dc3dc0-8e2b-410d-afdf-9f1dd5c25461.png)

node pool

![z](https://user-images.githubusercontent.com/86315031/182572892-a00fb9f5-7ede-4136-a6d9-a326c16a5c3b.png)

7 )service account to connect bastion with gke and node pool with gke

![z](https://user-images.githubusercontent.com/86315031/182573557-adfaebb8-6d99-4275-9040-18d20cf54cfc.png)

#### create the infrastructure 

1) terraform init

![z](https://user-images.githubusercontent.com/86315031/182574270-4c6d87fd-0c39-4788-844e-5b695f1d17c7.png)

2) terraform apply

![z](https://user-images.githubusercontent.com/86315031/182574691-ead47b51-b828-485f-9b9d-acb5cc239f5e.png)










