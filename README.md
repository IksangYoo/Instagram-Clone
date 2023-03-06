# instagram_ios_kkukku

03/04

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

03/05

1. 로그인화면 - 90% (API 연결을 위한 구조 구성과 연결 남음)
2. 회원가입 - 70& (생년월일 선택 화면과 프로필사진 선택 화면 남음)

개발도중 이슈: textField가 전부 비슷하게 생격서 cutomTextfield 클래스를 만들어서 사용했는데 개발 하다보니 서로 조금씩 기능이 달라서 기능 구현에서 막혔음
이슈해결 여부: O
해결 방법: 비슷한 기능을 하는 textFiled끼리 같은 tag 값으로 묶어서 customTextField 클래스에서 태그에 맞게 기능 구현함

내일 할 것
1. 회원가입 화면 완성
2. 로그인, 회원가입 API 연결을 위한 구조 미리 짜두기
3. API 개발 완료시 API 연걸 or 홈화면
