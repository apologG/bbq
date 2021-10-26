// Yandex map 
ymaps.ready(init);
var myMap;

function init(){
  address = document.getElementById('map').getAttribute('data-address');

  myMap = new ymaps.Map("map", {
    center: [59.911552, 31.103953],
    zoom: 3
  });

  myGeocoder = ymaps.geocode(address);

  myGeocoder.then(
    function (res) {
      coordinates = res.geoObjects.get(0).geometry.getCoordinates();

      myMap.geoObjects.add(
        new ymaps.Placemark(
          coordinates,
          {iconContent: address},
          {preset: 'islands#blueStretchyIcon'}
        )
      );

      myMap.setCenter(coordinates);
      myMap.setZoom(15);
    }, function (err) {
      alert('Ошибка при определении местоположения');
    }
  );
}