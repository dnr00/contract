# contract

## 개요
이 리포지토리는 Batch Transfer, Simple Faucet 등 몇 가지 간단한 컨트랙트들을 담고 있습니다.

## 프로젝트 구조

### multisend/
한 번에 여러 계정으로 상호작용하는 기능을 제공하는 모듈들이 포함되어 있습니다.
- **batch/** - 기본 배치 전송 스크립트 (bArtio Testnet의 tHPOT 관련)
- **batch2/** - batch 복제본
- **jnky/** - 기본 스크립트 구조는 동일, JNKY 관련

주요 기능:
- 니모닉 및 개인키 생성
- Faucet 상호작용
- 일괄 승인(approve) 처리
- 다중 수신자 전송
- 자동화 스크립트


### Oogabooga/
토큰 정보 조회 및 가격 모니터링 도구 - OogaBooga API에 의해 구동됨
- 토큰 리스트 조회
- 토큰 가격 조회
- 가격 체커 봇

### public/
공개 인터페이스 및 메인 실행 스크립트
- LP 토큰 스테이킹
- Web3 기본 인터페이스
- API 미사용 Web3 인터페이스

### tg_bot/
텔레그램 봇 스크립트 모음
- Vault 상태 모니터링
- Web3 Faucet 봇
- 비활성화된 봇들(disable/)
  - 에어드롭 제출
  - 토큰 스왑
  - 잔액 확인
  - 기타 유틸리티

### utilities/
다양한 유틸리티 도구
- 에어드롭 일괄 전송
- VM 프로세스 제어
- CSV to JSON 변환
- LP 토큰 스테이킹
- 니모닉 생성기
- Faucet 상호작용 계정 Native token 리필
- 토큰 허용량 확인
- Vault Reward 확인

## 설치 및 실행
Foundry 설치 스크립트 다운로드 및 실행:
```bash
curl -L https://foundry.paradigm.xyz | bash
```
Foundry 최신 버전 설치:
```bash
foundryup
```
## 설치 확인
설치가 완료된 후, 다음 명령어로 제대로 설치되었는지 확인할 수 있습니다:
```bash
forge --version
cast --version
anvil --version
```
## 새 프로젝트 생성
설치 후 새로운 Foundry 프로젝트를 시작하려면:
```bash
mkdir your-project-name
cd your-project-name
forge init
```
이렇게 하면 기본적인 Foundry 개발 환경이 구성됩니다.