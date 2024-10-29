# Custom Catalog Display Component
By Jayyum with Claude Sonnet

## Overview
이 컴포넌트는 Salesforce Lightning Aura 기반의 유연한 카탈로그 디스플레이 시스템입니다. 동적 필터링 기능과 함께 상품을 3x2 그리드 형식으로 표시합니다. 개발 지식이 1도 없는 사람이 Sonnet 통해서 만들었습니다. 일해라 AI

## Features
- 동적 상품 표시 (3x2 그리드)
- 상품 타입별 필터링
- 이미지, 설명, 상세보기 버튼 포함
- 정적/동적 콘텐츠 혼합 지원
- SLDS(Salesforce Lightning Design System) 디자인 준수

## Prerequisites
- Salesforce Org (Enterprise Edition 이상 권장)
- Salesforce CLI
- Git

## Installation 
*현재는 package 파일 구성 오류로, 추후 github 통한 설치 또는 Package화 예정입니다.
CLI를 통해 매뉴얼 배포 시, 다음과 같은 순서로 구성됩니다.
1. Custom Object 생성
   1) CustomProduct__C
   2) 필수 필드
      * ImageUrl__c  (type : url)
      * ShortDesc__c (type : text)
      * Type__c      (type: picklist)

2. APEX Classes 설치
      * CustomCatalogContainerController.cls   : CustomObject에서 record 불러와서 콤포넌트에 배치
      * CustomCatalogProdTypePicklist.cls      : Lightning app builder내에, CustoObject의 'Type__c' picklist 값 선택 가능하도록 구성

3. Aura Component 배포
   1) customCatalogItem   : CustomObject에 저장된 개별 record를 card형태로 display
   2) customCatalogContainer : customCatalogItem을 3x2 형태로 배포 (현재 최대 6개만 보여주도록 설정)

<!--- 
### Option 1: SFDX CLI를 사용한 설치
```bash
# 프로젝트 클론
git clone [your-repository-url]
cd custom-catalog-display

# 조직에 배포
sfdx force:source:deploy -p force-app/main/default
```


### Option 2: Scratch Org를 사용한 개발 및 테스트
```bash
# Scratch Org 생성 및 설정
./scripts/create-scratch-org.sh
``` --> 

## Custom Object 구조
이 컴포넌트는 `CustomProduct__c` 커스텀 오브젝트를 사용합니다:

### 필수 필드
- `Name` (Text)
- `imageUrl__c` (URL)
- `shortdesc__c` (Text Area)
- `producttype__c` (Picklist)

## 샘플 데이터
- 샘플 데이터는 `data/CustomProduct__c.json` 파일에 포함되어 있습니다
- 샘플 이미지는 Static Resource(`catalogSampleImages`)로 포함되어 있습니다

### 샘플 데이터 임포트
```bash
sfdx force:data:tree:import -p ./data/CustomProduct__c.json
```

## 컴포넌트 구조
- `customCatalogItem`: 개별 상품 표시용 자식 컴포넌트
- `customCatalogContainer`: 메인 컨테이너 컴포넌트

## Usage
1. App Builder에서 Lightning 페이지 편집
2. 컴포넌트 목록에서 "Custom Catalog Container" 찾기
3. 원하는 위치로 드래그 앤 드롭
4. 속성 설정:
   - Card Title
   - Card Icon
   - Product Type Filter
   - Static Items (선택사항)

## Configuration
App Builder에서 다음 속성들을 설정할 수 있습니다:
- `cardTitle`: 카드 제목
- `cardIcon`: 카드 아이콘
- `selectedProductType`: 상품 타입 필터
- `item[1-6]Name`: 정적 아이템 이름
- `item[1-6]Desc`: 정적 아이템 설명
- `item[1-6]Image`: 정적 아이템 이미지 URL
- `item[1-6]Url`: 정적 아이템 레코드 URL

## Development
추가 개발을 위해서는:
```bash
# Scratch org 생성
./scripts/create-scratch-org.sh

# 소스 수정 후 배포
sfdx force:source:push
```

## Security
- OWD(Organization-Wide Defaults)는 `ReadWrite`로 설정되어 있습니다
- 필요한 경우 필드 레벨 보안 및 공유 규칙을 설정하세요

## Support
문제나 제안사항이 있으시면 직접 수정해주셔도 좋습니다.
