import boto3

def lambda_handler(event, context):
    # Initialize EC2 client
    ec2 = boto3.client('ec2')

    # Get all the EC2 snapshots owned by the Lambda function
    response = ec2.describe_snapshots(OwnerIds=['self'])

    # Get all active Instance IDs
    instance_status = ec2.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
    active_instance_ids = set()

    # Extract active Instance IDs from the response
    for reservation in instance_status['Reservations']:
        for instance in reservation['Instances']:
            active_instance_ids.add(instance['InstanceId'])

    # Iterate to delete EBS snapshots not associated with volumes or associated with stopped instances
    for snapshot in response['Snapshots']:
        snapshot_id = snapshot['SnapshotId']
        volume_id = snapshot.get('VolumeId')

        if not volume_id:
            # Delete snapshots not associated with volumes
            print('Volume not found!')
            ec2.delete_snapshot(SnapshotId=snapshot_id)
            print(f'Deleted EBS Snapshot {snapshot_id} as it is not attached to any volumes')
        else:
            try:
                # Check if the volume is attached to any instances
                volume_response = ec2.describe_volumes(VolumeIds=[volume_id])

                if not volume_response['Volumes'][0]['Attachments']:
                    # Delete snapshots associated with volumes but not attached to instances
                    ec2.delete_snapshot(SnapshotId=snapshot_id)
                    print(f'Deleted EBS Snapshot {snapshot_id} as it is attached to the volume {volume_id}, but the associated EC2 instance is not running')

            except ec2.exceptions.ClientError as e:
                if e.response['Error']['Code'] == 'InvalidVolume.NotFound':
                    # Delete snapshots whose associated volume is not found
                    ec2.delete_snapshot(SnapshotId=snapshot_id)
                    print(f'Deleted EBS Snapshot {snapshot_id} as its associated volume was not found')


                   