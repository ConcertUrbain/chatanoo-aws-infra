echo "Deploy $TRAVIS_TAG version to S3"
aws s3 cp infra/network.cfn.yml s3://chatanoo-deployment/infra/network/$TRAVIS_TAG.cfn.yml
aws s3 cp build/main.cfn.yml s3://chatanoo-deployment/main/$TRAVIS_TAG.cfn.yml

echo "Upload latest"
aws s3api put-object \
  --bucket chatanoo-deployment \
  --key infra/network/latest.cform \
  --website-redirect-location /infra/network/$TRAVIS_TAG.cfn.yml
aws s3api put-object \
  --bucket chatanoo-deployment \
  --key main/latest.zip \
  --website-redirect-location /main/$TRAVIS_TAG.cfn.yml
