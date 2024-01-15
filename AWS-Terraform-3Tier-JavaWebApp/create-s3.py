# pip install awscli boto3
import boto3

s3_bucket_name = 'javaweb-98'     # Make sure to give it a unique name otherwise it won't work
region = 'us-east-1'              # You can also change your region if you want

def create_s3_bucket():
    s3_client = boto3.client('s3', region_name=region)

    s3_client.create_bucket(Bucket=s3_bucket_name)
    print(f"S3 bucket {s3_bucket_name} created")

create_s3_bucket()