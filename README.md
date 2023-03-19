## AWS Practicing Application (MySQL + express + reactjs + stack)

This project contains the IaC for deploying an application consisting of a MySQL database, an NodeJS express backend, a reactjs frontend. The MySQL database is created with an RDS instance, the backend is an EC2 instance and the frontend is stored in a S3 bucket. Also, the network infrastruture and scalability of the application are implemented with VPC (and its sub resources), Auto Scalling Groups and Elastic Load Balancer. All the resources are created with CloudFormation Stack. This project also comes with presentation slides on fundamental AWS concepts https://docs.google.com/presentation/d/1b_8XtY2W7aLzbPgTMp1xJft30SlO_B3DEJM6WtMyZ2I/edit?usp=sharing

## Requirements

- AWS Account
- Node (for front and backend running).

## Getting started

1. Clone the project to your machine : `git clone https://github.com/brunopecampos/AWS-practical`
2. Go to CloudFomration/
3. start the stack: ./create-stack.sh

## Built With

- [AWS](https://aws.amazon.com/pt/) - The world's most popular cloud.
- [React](https://reactjs.org) - A progressive JavaScript framework.
- [Express](https://expressjs.com/) - Fast, unopinionated, minimalist web framework for Node.js.
- [MySQL](https://www.mysql.com/) - The most comprehensive set of advanced features, management tools and technical support to achieve the highest levels of MySQL scalability, security, reliability, and uptime..
