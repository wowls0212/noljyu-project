<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>나랑 같이 놀쥬 :: 주변 동물병원 찾기</title>

<!-- Kakao Map API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb5666d215922badc1c86c7e82df8521&libraries=services"></script>

<!-- 스타일 -->
<style>

@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body {
    margin: 0;
    font-family: 'CookieRun-Regular';
}
.container {
    max-width: 1400px;
    margin: 40px auto;
    padding: 20px;
}

/* 섹션 헤더 */
.section-header {
    text-align: center;
    margin-bottom: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
}
.section-header .paw {
    width: 44px;
    height: 44px;
}
.section-header h2 {
    font-size: 2em;
    font-weight: bold;
    margin: 0;
}

/* 지도 */
#map {
    width: 100%;
    height: 600px;
    border-radius: 15px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    margin-bottom: 50px;
}

/* 검색 카드 */
#search_wrap {
    background: #fff;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}
#search_wrap hr {
    margin: 20px 0;
    border: none;
    border-top: 2px solid #FECB2F;
}

/* 검색창 */
#search_wrap .option {
    text-align: center;
    margin-bottom: 20px;
}
#search_wrap .option form {
    display: flex;
    justify-content: center;
    gap: 8px;
}
#search_wrap input[type="text"] {
    width: 300px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 1em;
}
#search_wrap button {
    padding: 10px 20px;
    background: #FECB2F;
    border: none;
    border-radius: 8px;
    font-weight: bold;
    cursor: pointer;
    font-size: 1em;
    transition: 0.3s;
}
#search_wrap button:hover {
    background: #f5b800;
}

/* 리스트 */
#placesList {
    list-style: none;
    padding: 0;
    margin-top: 20px;
}
#placesList li {
    background: #fff;
    margin-bottom: 15px;
    padding: 15px;
    border: 1px solid #eee;
    border-radius: 10px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.05);
    cursor: pointer;
    transition: 0.3s;
}
#placesList li:hover {
    background: #fff7e1;
}
#placesList .item {
    position: relative;
}
#placesList .item span {
    display: block;
    margin-top: 4px;
}
#placesList .item .info {
    padding-left: 50px;
}
#placesList .item h5 {
    margin: 0;
    font-size: 18px;
    color: #333;
}
#placesList .info .gray {
    color: #888;
}
#placesList .info .tel {
    color: #009900;
}
#placesList .info .jibun {
    padding-left: 26px;
    background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png') no-repeat left center;
}

/* 마커 */
#placesList .item .markerbg {
    float: left;
    position: absolute;
    width: 36px;
    height: 37px;
    margin: 10px 0 0 10px;
    background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png') no-repeat;
}
#placesList .item .marker_1 { background-position: 0 -10px; }
#placesList .item .marker_2 { background-position: 0 -56px; }
#placesList .item .marker_3 { background-position: 0 -102px; }
#placesList .item .marker_4 { background-position: 0 -148px; }
#placesList .item .marker_5 { background-position: 0 -194px; }
#placesList .item .marker_6 { background-position: 0 -240px; }
#placesList .item .marker_7 { background-position: 0 -286px; }
#placesList .item .marker_8 { background-position: 0 -332px; }
#placesList .item .marker_9 { background-position: 0 -378px; }
#placesList .item .marker_10 { background-position: 0 -423px; }
#placesList .item .marker_11 { background-position: 0 -470px; }
#placesList .item .marker_12 { background-position: 0 -516px; }
#placesList .item .marker_13 { background-position: 0 -562px; }
#placesList .item .marker_14 { background-position: 0 -608px; }
#placesList .item .marker_15 { background-position: 0 -654px; }

/* 페이지네이션 */
#pagination {
    margin-top: 20px;
    text-align: center;
}
#pagination a {
    display: inline-block;
    margin: 0 5px;
    font-weight: bold;
    color: #666;
    text-decoration: none;
    font-size: 14px;
}
#pagination a:hover {
    color: #000;
}
#pagination .on {
    color: #e91e63;
    pointer-events: none;
}
      .main-banner {
	position: relative;
	height: 400px;
	display:inline;
	align-items: center;
	overflow: inherit;
	margin-bottom: 150px;
}
</style>
</head>

<body>

  <!-- 섹션 헤더 -->
    <section class="main-banner">
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="배너이미지" src="./image/hospital.jpg" width="1900px" height="300px">
                </div>
            </div>
    </section>

<div class="container">


  <!-- 지도 -->
  <div id="map"></div>

  <!-- 검색창 + 결과 리스트 -->
  <div id="search_wrap" class="bg_white">
    <div class="option">
      <form onsubmit="searchPlaces(); return false;">
        키워드 : <input type="text" value="주변동물병원" id="keyword" size="18"> 
        <button type="submit">검색하기</button> 
      </form>
    </div>
    <hr>
    <ul id="placesList"></ul>
    <div id="pagination"></div>
  </div>

</div>

<!-- 지도 스크립트 -->
<script>
var markers = [];
var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 3
    };  

var map = new kakao.maps.Map(mapContainer, mapOption);
var ps = new kakao.maps.services.Places();
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

searchPlaces();

function searchPlaces() {
    var keyword = document.getElementById('keyword').value;
    if (!keyword.trim()) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    ps.keywordSearch(keyword, placesSearchCB); 
}

function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        displayPlaces(data);
        displayPagination(pagination);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        alert('검색 결과가 존재하지 않습니다.');
    } else if (status === kakao.maps.services.Status.ERROR) {
        alert('검색 결과 중 오류가 발생했습니다.');
    }
}

function displayPlaces(places) {
    var listEl = document.getElementById('placesList'), 
        fragment = document.createDocumentFragment(),
        bounds = new kakao.maps.LatLngBounds();
    
    removeAllChildNods(listEl);
    removeMarker();
    
    for (var i = 0; i < places.length; i++) {
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i),
            itemEl = getListItem(i, places[i]);

        bounds.extend(placePosition);

        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            itemEl.onmouseover = function() {
                displayInfowindow(marker, title);
            };
            itemEl.onmouseout = function() {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    listEl.appendChild(fragment);
    map.setBounds(bounds);
}

function getListItem(index, place) {
    var el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                  '<div class="info">' +
                  '<h5>' + place.place_name + '</h5>';

    if (place.road_address_name) {
        itemStr += '<span>' + place.road_address_name + '</span>' +
                   '<span class="jibun gray">' + place.address_name + '</span>';
    } else {
        itemStr += '<span>' + place.address_name + '</span>';
    }

    itemStr += '<span class="tel">' + (place.phone || '전화번호 없음') + '</span>' +
               '</div>';

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

function addMarker(position, idx) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
        imageSize = new kakao.maps.Size(36, 37),
        imgOptions = {
            spriteSize : new kakao.maps.Size(36, 691),
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10),
            offset: new kakao.maps.Point(13, 37)
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new kakao.maps.Marker({
            position: position,
            image: markerImage
        });

    marker.setMap(map);
    markers.push(marker);
    return marker;
}

function removeMarker() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
}

function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment();

    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild(paginationEl.lastChild);
    }

    for (var i = 1; i <= pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i === pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    infowindow.setContent(content);
    infowindow.open(map, marker);
}

function removeAllChildNods(el) {
    while (el.hasChildNodes()) {
        el.removeChild(el.lastChild);
    }
}
</script>

</body>
</html>
