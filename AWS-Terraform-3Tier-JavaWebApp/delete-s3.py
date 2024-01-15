import boto3

s3_bucket_name = 'javaweb-98'
region = 'us-east-1'

def delete_s3_bucket():
    s3_client = boto3.client('s3', region_name=region)

    # Empty all objects in the bucket before deleting the bucket
    response = s3_client.list_objects(Bucket=s3_bucket_name)
    if 'Contents' in response:
        for obj in response['Contents']:
            s3_client.delete_object(Bucket=s3_bucket_name, Key=obj['Key'])

    # Delete the bucket
    s3_client.delete_bucket(Bucket=s3_bucket_name)
    print(f"S3 bucket {s3_bucket_name} deleted.")

delete_s3_bucket()