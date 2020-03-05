### Sets environment variables for aws usage
###
### Expects a ~/.aws/credentials file with
# aws_access_key_id = <ACCESS_KEY_ID>
# aws_secret_access_key = <SECRET_ACCESS_KEY>
#
### And will grep and set the variables for you.

export AWS_ACCESS_KEY_ID=$(grep aws_access_key_id ~/.aws/credentials | cut -d' ' -f3)
export AWS_ACCESS_KEY=$AWS_ACCESS_KEY_ID
export AWS_SECRET_KEY=$(grep aws_secret_access_key ~/.aws/credentials | cut -d' ' -f3)
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY
