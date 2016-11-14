echo "Deploy $TRAVIS_TAG version to S3"
aws s3 cp infra/network.cfn.yml s3://chatanoo-deployments-eu-west-1/infra/network/$TRAVIS_TAG.cfn.yml
aws s3 cp infra/main.cfn.yml s3://chatanoo-deployments-eu-west-1/infra/main/$TRAVIS_TAG.cfn.yml

echo "Upload latest"
aws s3api put-object \
  --bucket chatanoo-deployments-eu-west-1 \
  --key infra/network/latest.cform \
  --website-redirect-location /infra/network/$TRAVIS_TAG.cfn.yml
aws s3api put-object \
  --bucket chatanoo-deployments-eu-west-1 \
  --key infra/main/latest.cfn.yml \
  --website-redirect-location /infra/main/$TRAVIS_TAG.cfn.yml
