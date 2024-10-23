#!/bin/bash

# By Jayyum with Claude Sonnet

# 변수 설정
SCRATCH_ORG_ALIAS="your-org-alias"

echo "Deploying to production org..."

# 메타데이터 배포
echo "Deploying metadata..."
sfdx force:source:deploy -p force-app/main/default

# 샘플 데이터 임포트 (선택적)
echo "Would you like to import sample data? (y/n)"
read IMPORT_DATA
if [ "$IMPORT_DATA" = "y" ]; then
    echo "Importing sample data..."
    sfdx force:data:tree:import -p ./data/CustomProduct__c.json
fi

echo "Deployment completed!"