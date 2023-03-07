# instagram_ios_kkukku

## 03/04

1. 기획서 제출 - 100%
2. Template 따라서 프로젝트 구성 - 100%
3. 스플래시 화면 - 100%
4. 로그인 화면 - 80%

개발도중 이슈: 텍스트필드 선택하면 place holder 올라가는 UI -> 누르면 올라가게는 구현 했는데 텍스트필드 떠날시   없어지는 기능 구현에서 막힘  
이슈 발생 이유: extension에선 stored property를 사용하지 못해서  
이슈해결 여부: X -> O 3/5  
해결 방법: customTextfield 클래스를 만들어서 textfield begin 이나 end 시 UILabel isHidden값 바꿈  



내일 할 것
1. 오늘 못한 텍스트필드 이슈 해결  
2. 회원가입 UI 구현 (validation 꼼꼼하게 확인하기)  
3. 로그인 API가 나오면 바로 연동할 수 있게 구성해두기  

## 03/05 

1. 로그인화면 - 90% (API 연결을 위한 구조 구성과 연결 남음)
2. 회원가입 - 70& (생년월일 선택 화면과 프로필사진 선택 화면 남음)

개발도중 이슈: textField가 전부 비슷하게 생격서 cutomTextfield 클래스를 만들어서 사용했는데 개발 하다보니 서로 조금씩 기능이 달라서 기능 구현에서 막혔음  
이슈해결 여부: O  
해결 방법: 비슷한 기능을 하는 textFiled끼리 같은 tag 값으로 묶어서 customTextField 클래스에서 태그에 맞게 기능 구현함  

내일 할 것
1. 회원가입 화면 완성
2. 로그인, 회원가입 API 연결을 위한 구조 미리 짜두기
3. API 개발 완료시 API 연걸 or 홈화면

## 03/06

1. 회원가입 화면 - 90% (API 연결 남음)
2. 회원가입을 위한 유저 객체 구조 - 100%
3. 홈 화면 - 20%

개발도중 이슈: 개발도중 xcode가 튕기더니 스토리보드의 이름이 빨간색으로 바뀌고 클릭 자체가 안됨  
이슈해경 여부: O  
발생 이유: xcode 오류인듯함  
해결 방법: finder를 확인해보니 스토리보드의 xcode상 위치와 finder 위치가 달라 스토리보드의 위치를 xcode에 나타나는 위치와 동일하게 해줬더니 해결됐음  

내일 할 것
1. 로그인, 회원가입 API 연결 
2. 홈 화면 완성 (우선 더미데이터로)
3. 홈 화면 완성시 마이페이지 개발

## 03/07

1. 로그인 API 연결 - 90% (바디 구조 수정필요)
2. 회원가입 API 연결 - 90% (바디 구조 수정필요)

개발도중 이슈: API 연결이 신경써야할 것이 생각보다 많았다  
발생 이유: 백엔드 개발자와 협업이 처음이다 보니 서툴렀음  
해결 방법: 커뮤니케이션을 잘 하자  

내일 할 것
1. 자동로그인 구현
2. 홈 화면
