#!/bin/bash

# By Jayyum with Claude Sonnet

# 변수 설정
SCRATCH_ORG_ALIAS="custom-catalog-scratch"
DURATION=7

# Scratch org 생성
echo "Creating scratch org..."
sfdx force:org:create -f config/project-scratch-def.json -a $SCRATCH_ORG_ALIAS -d $DURATION

# 소스 푸시
echo "Pushing source..."
sfdx force:source:push -u $SCRATCH_ORG_ALIAS

# 샘플 데이터 임포트
echo "Importing sample data..."
sfdx force:data:tree:import -p ./data/CustomProduct__c.json -u $SCRATCH_ORG_ALIAS

echo "Opening org..."
sfdx force:org:open -u $SCRATCH_ORG_ALIAS