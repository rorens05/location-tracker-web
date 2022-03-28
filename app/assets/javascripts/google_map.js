let map;
let barangays = [];
let tsunamis = [];
let evacuations = [];
let floods = [];
let storm_surges = [];

let barangays_visible = true;
let tsunamis_visible = true;
let evacuations_visible = true;
let floods_visible = true;
let storm_surges_visible = true;

function initMap() {
  resetMap()
}

function resetMap() {
  const mapContainer = document.getElementById("map");
  if (mapContainer) {
    map = new google.maps.Map(mapContainer, {
      center: { lat: 16.019097656537834, lng: 120.23156633657322 },
      zoom: 13,
    });
  }
  var url_string = window.location.href
  var url = new URL(url_string);
  var reference_number = url.searchParams.get("reference_number");
  console.log(reference_number);

  return fetch("/api/v2/locations?reference_number=" + encodeURIComponent(reference_number))
  .then((res) => {
    console.log({ res });
    return res.json();
  })
  .then((res) => {
    console.log({json: res})
    res.map(item => {
      console.log("displaying item")
      const icon = {
        url: item.tracker.image_path || "/images/icon/marker.png",
        scaledSize: new google.maps.Size(60, 60),
      };
      displayMarker(item.latlong, new Date(item.location_date).toLocaleString(), icon);
    })
  })
  .catch((err) => {
    console.log({ err });
  });

  
}

const displayMarker = (latlong, content, icon) => {
  const position = {
    lat: parseFloat(latlong.split(",")[0]),
    lng: parseFloat(latlong.split(",")[1]),
  };
  const marker = new google.maps.Marker({
    position,
    map,
    icon,
  });
  const infoWindow = new google.maps.InfoWindow();

  marker.addListener("click", () => {
    infoWindow.close();
    infoWindow.setContent(content);
    infoWindow.open(marker.getMap(), marker);
  });
};
