elseR
========
개인적으로 사용하려고 만든 잡다하고 유용한 함수 모음


# 1. 패키지 설치 방법
```
devtools::install_github('lawine90/elseR')
```


# 2. 함수 목록 및 설명
  - hexBlender: 두 개의 hex code 색깔을 섞어 그 중간 색깔의 hex code를 만드는 코드.
  - keywordVec: 키워드의 벡터를 카운트하여 하나의 string으로 만드는 코드.
  - keywordComb: 키워드 벡터의 조합(combination)을 카운트하는 코드.
  - ageCut: 숫자로 표현된 나이 변수를 카테고리 변수로 변환하는 코드.


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


> keywordVec(x, reverse = F, limit = NULL)
> 
> 문자열의 벡터를 카운트하여 하나의 string으로 변환해주는 함수입니다. 특정 키워드를 카운트해서 csv 파일로 출력할 때 주로 사용하였습니다.
> - x: (필수, character). 문자열의 키워드를 포함한 벡터.
> - reverse: (필수, logical). 하나의 문자열로 표현된 키워드 카운트를 벡터로 변환하는 함수.
> - limit: (옵션, integer). 카운트 결과, 상위 몇 개의 카운트만 표시할 것인지의 옵션

``` 
# example
> count <- keywordVec(as.character(c(1,1,2,2,1,2,1,2,1,5,5,5,3,6,5,3,5)))
> count
[1] "1(5); 5(5); 2(4); 3(2); 6(1)"
> 
> reverse <- keywordVec(count, reverse = T)
> reverse
[1] "1" "1" "1" "1" "1" "5" "5" "5" "5" "5" "2" "2" "2" "2" "3" "3" "6"
```


> keywordComb(x, m = 2, remove_dup = F, self_conn = F)
> 
> 문자열 벡터의 조합을 계산하여 data.frame 형식의 결과를 도출하는 함수입니다. 주로 visNetwork library의 edge 계산에 사용하였습니다.
> - x: (필수, character). 문자열의 키워드를 포함한 벡터.
> - m: (필수, integer). 조합의 수. 기본값은 2.
> - remove_dup: (필수, logical). input vector x에서 중복값을 제거할 것인지 결정하는 옵션.
> - self_conn: (필수, logical). output data.frame에서 self-connected인 row들의 제거 여부.

``` 
# example
> comb2 <- keywordComb(as.character(c(1,1,2,2,1,2,1,2,1,5,5,5,3,6,5,3,5)), 
                                    m = 2, remove_dup = F, self_conn = F)
> comb2
# A tibble: 14 x 3
   word1 word2 value
   <chr> <chr> <dbl>
 1 1     2        11
 2 1     3        10
 3 1     5        25
 4 1     6         5
 5 2     1         9
 6 2     3         8
 7 2     5        20
 8 2     6         4
 9 3     5         3
10 3     6         1
11 5     3         7
12 5     6         3
13 6     3         1
14 6     5         2
> 
> comb3 <- keywordComb(as.character(c(1,1,2,2,1,2,1,2,1,5,5,5,3,6,5,3,5)), 
                       m = 3, remove_dup = F, self_conn = T)
> comb3
# A tibble: 52 x 4
   word1 word2 word3 value
   <chr> <chr> <chr> <dbl>
 1 1     1     1        10
 2 1     1     2        11
 3 1     1     3        20
 4 1     1     5        50
 5 1     1     6        10
 6 1     2     1        22
 7 1     2     2        13
 8 1     2     3        22
 9 1     2     5        55
10 1     2     6        11
# ... with 42 more rows
```


# 4. 건의 및 문의사항
건의 및 문의사항은 환영입니다 :) lawine90(power1sky@gmail.com)에게 많은 연락 부탁드리겠습니다.
