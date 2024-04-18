<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>벚꽃 리포트</title>
<style type="text/css">
    #bloomStageResults ul {
        display: none; /* 모든 ul 요소를 숨김 */
    }
</style>
</head>
<body>
    <section class="report">
        <div>
            <header>
                <h2><b>벚꽃 리포트</b></h2>
            </header>
            <div>
                <ul>
                    <li>
                        <h3>개화 진행단계</h3>
                        <select id="bloomStageSelect">
                            <option value="Buds_Only_0%">Buds Only 0%</option>
                            <option value="Beginning_to_Bloom_15%">Beginning to Bloom 15%</option>
                            <option value="Partial_Bloom_30%">Partial Bloom 30%</option>
                            <option value="Half_Bloom_50%">Half Bloom 50%</option>
                            <option value="Almost_Full_Bloom_70%">Almost Full Bloom 70%</option>
                            <option selected value="Full_Bloom_100%">Full Bloom 100%</option>
                            <option value="Beginning_to_Fall">Beginning to Fall</option>
                            <option value="Blossoms_Gone">Blossoms Gone</option>
                        </select>
                    </li>
                </ul>
            </div>
            
            <div id="bloomStageResults">
                <ul data-area="Buds_Only_0%">
                    <li id="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
                </ul>
                <ul data-area="Beginning_to_Bloom_15%">
                    <li id="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
                </ul>
                <ul data-area="Partial_Bloom_30%">
                    <li id="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
                </ul>
                <ul data-area="Half_Bloom_50%">
                    <li id="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
                </ul>
                <ul data-area="Almost_Full_Bloom_70%">
                    <li id="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
                </ul>
                <ul data-area="Full_Bloom_100%">
                    <li>
                        <p class="image" style="background-image: url('./kyotomap/image/location1.jpg')"></p>
                        <h4 class="title">쿠라메데라 절</h4>
                        <p class="tag"><span><img alt="" src="../kyotomap/image/ico_sakura06.png" width="15px;"></span><span class="text">Full Bloom 100%</span></p>
                    </li>
                </ul>
                <ul data-area="Beginning_to_Fall">
                    <li id="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
                </ul>
                <ul data-area="Blossoms_Gone">
                    <li id="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
                </ul>
            </div>
        </div>
    </section>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const select = document.querySelector('#bloomStageSelect');
        const resultsDiv = document.querySelector('#bloomStageResults');

        if (select && resultsDiv) {
            // 초기 로드 시 선택된 옵션에 해당하는 결과를 표시합니다.
            const initialSelectedValue = select.value;
            showResults(initialSelectedValue);

            // select 요소의 change 이벤트 리스너를 추가합니다.
            select.addEventListener('change', function() {
                const selectedValue = select.value;
                showResults(selectedValue);
            });
        }

        // 선택된 값에 해당하는 결과를 보여주는 함수
        function showResults(selectedValue) {
            // 모든 결과 항목을 숨김
            const resultItems = resultsDiv.querySelectorAll('ul[data-area]');
            resultItems.forEach(function(item) {
                item.style.display = 'none';
            });

            // 선택된 값과 일치하는 결과를 표시
            const selectedResult = resultsDiv.querySelector(`ul[data-area="${selectedValue}"]`);
            if (selectedResult) {
                selectedResult.style.display = 'block';
            } else {
                // 일치하는 결과가 없을 때 메시지 표시
                const noItem = resultsDiv.querySelector('#noItem');
                if (noItem) {
                    noItem.style.display = 'block';
                }
            }
        }
    });
    </script>
</body>
</html>
