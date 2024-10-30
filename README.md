# contract

## 개요
이 리포지토리는 Batch Transfer, Simple Faucet 등 몇 가지 간단한 컨트랙트들을 담고 있습니다.

## 컨트랙트 목록
- Batch
- SimpleFaucet
### 아래 컨트랙트는 실제로 사용하지 않음
- MyToken
- NewToken

## 설치 및 실행
Foundry 설치 스크립트 다운로드 및 실행:
```bash
curl -L https://foundry.paradigm.xyz | bash
```
Foundry 최신 버전 설치:
```bash
foundryup
```
### 설치 확인
설치가 완료된 후, 다음 명령어로 제대로 설치되었는지 확인할 수 있습니다:
```bash
forge --version
cast --version
anvil --version
```
### 새 프로젝트 생성
설치 후 새로운 Foundry 프로젝트를 시작하려면:
```bash
mkdir your-project-name
cd your-project-name
forge init
```
이렇게 하면 기본적인 Foundry 개발 환경이 구성됩니다.