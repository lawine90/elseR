elseR
========
개인적으로 사용하려고 만든 잡다하고 유용한 함수 모음


# 1. 패키지 설치 방법
```
devtools::install_github('lawine90/elseR')
```


# 2. 현재 다운로드 가능한 데이터 목록
  - hexBlender: 두 개의 hex code 색깔을 섞어 그 중간 색깔의 hex code를 만드는 코드.
  - keywordVec: 키워드의 벡터를 카운트하여 하나의 string으로 만드는 코드.
  - keywordComb: 키워드 벡터의 조합(combination)을 카운트하는 코드.


# 3. 각 함수 예제
> hexBlender(color1, color2, alpha = 0.5)
> 
> hex code로 표현된 물감을 섞는 함수입니다. 개인적으로는 ggplot이나 plotly, visNetwork 등 시각화에 주로 많이 사용하였습니다. [링크](https://meyerweb.com/eric/tools/color-blend/#:::hex)를 참고하여 만들었습니다.
> - color1: (필수, character). hex code로 표현된 색깔.
> - color2: (필수, character). hex code로 표현된 색깔.
> - alpha: (필수, float). color2가 사용될 비율. 기본값은 0.5

``` 
# example
> blend1 <- hexBlender('#FF3366', '#0000FF')
> blend1
[1] "#7F19B2"
> 
> blend2 <- hexBlender('#FF3366', '#0000FF', 0.3)
> blend2
[1] "#B22393"
```
> 예제 blend1의 색깔: ![#FF3366](https://placehold.it/15/FF3366/000000?text=+)#FF3366 + ![#0000FF](https://placehold.it/15/0000FF/000000?text=+)#0000FF = ![#7F19B2](https://placehold.it/15/7F19B2/000000?text=+)#7F19B2
> 예제 blend2의 색깔: ![#FF3366](https://placehold.it/15/FF3366/000000?text=+)#FF3366 + ![#0000FF](https://placehold.it/15/0000FF/000000?text=+)#0000FF = ![#B22393](https://placehold.it/15/B22393/000000?text=+)#B22393


# 4. 건의 및 문의사항
건의 및 문의사항은 환영입니다 :) lawine90(power1sky@gmail.com)에게 많은 연락 부탁드리겠습니다.
