
 
 var firstList = new Array("TOP","BOTTOM","OUTER","SHOES & BAG","ACC","SET","HOME/EASY");
        
        // 중분류
        
        var secondList1 = new Array("BL","TEE","SHIRT","KNIT");
        var secondList2 = new Array("PANTS","SKIRT","DRESS");
        var secondList3 = new Array("JACKET","COAT","CARDIGAN","JP","PADDING");
        var secondList4 = new Array("SHOES","BAG");
        var secondList5 = new Array("JEWELRY","HAT","ETC");
        var secondList6 = new Array("SET");
        var secondList7 = new Array("HOME","EASY");
        
          
        // 페이지 로딩시 자동 실행  
        window.onload = function(){
            var v_sidoSelect = document.getElementById("sidoSelect"); // SELECT TAG
              
            for (i =0 ; i<firstList.length; i++){// 0 ~ 3 
                // 새로운 <option value=''>값</option> 태그 생성
                var optionEl = document.createElement("option");
          
                // option태그에 value 속성 값으로 저장
                optionEl.value = firstList[i];
              
                // text 문자열을 새로 생성한 <option> 태그의 값으로 추가
                optionEl.appendChild (document.createTextNode(firstList[i]));
              
                // 만들어진 option 태그를 <select>태그에 추가
                v_sidoSelect.appendChild(optionEl);
            }
          
            var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("lastSelect"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
           
          
        }
        
        // 대분류 선택시
        function changeSidoSelect(){
            var v_sidoSelect = document.getElementById("sidoSelect"); // SELECT TAG
            var idx = v_sidoSelect.options.selectedIndex;     // 선택값 0 ~ 8
             
        
            if (idx < 1 && idx > 8){
                return;
            }
          
         
            gugunSelectFill(idx);   // 중분류 생성
        }
        
        
        function gugunSelectFill(idx){
            var v_gugunSelect = document.getElementById("gugunSelect"); // SELECT TAG
            var v_gugunSelect = document.getElementById("gugunSelect");
            var v_gugunSelect = document.getElementById("gugunSelect");
            var v_gugunSelect = document.getElementById("gugunSelect");
            var v_gugunSelect = document.getElementById("gugunSelect");
            var v_gugunSelect = document.getElementById("gugunSelect");
            var v_secondSelect = document.getElementById("lastSelect");
         
            var data = null;
          
            if (idx == 0) {
                v_gugunSelect.style.display = "none";  // 중분류 태그 감추기
                v_secondSelect.style.display = "none";
                return;
            }
          
            if (idx == 1){
             data = secondList1
           
             }
            if (idx == 2){
             data = secondList2
             
             }
             if (idx == 3){
             data = secondList3
             
             }
             if (idx == 4){
             data = secondList4
             
             }
             if (idx == 5){
             data = secondList5
             
             }
             if (idx == 6){
             data = secondList6
             
             }
             if (idx == 7){
             data = secondList7
             
             }
          
        
            v_gugunSelect.innerHTML = "";  // 태그 출력
              
            for (i =0 ; i<data.length; i++){ 
                // 새로운 <option value=''>값</option> 태그 생성
                var optionEl = document.createElement("option");
          
                // value 속성 태그에 저장
                optionEl.value = data[i];
              
                // text 문자열을 새로 생성한 <option> 태그에 추가
                optionEl.appendChild (document.createTextNode(data[i]));
              
                // 만들어진 option 태그를 <select>태그에 추가
                v_gugunSelect.appendChild(optionEl);
            }
          
        v_gugunSelect.style.display = ""; // 중분류 태그 출력
          
        
}





