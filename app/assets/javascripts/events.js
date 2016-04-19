function initMap() {

    centerLat = 0;
    centerLng = 0;
    count = 0;
    <% @events.each do |event| %>
        tmpLat = <%= event.latitude %>;
        tmpLng = <%= event.longitude %>;
        tmpPosition = {lat: tmpLat, lng: tmpLng};
        centerLat = centerLat + tmpLat;
        centerLng = centerLng + tmpLng;
        count += 1;
    <% end %>
    centerLat = centerLat / count;
    centerLng = centerLng / count;
    center = { lat: centerLat, lng: centerLng };

    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: center,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    <% @events.each do |event| %>
        tmpLat = <%= event.latitude %>;
        tmpLng = <%= event.longitude %>;
        tmpPosition = {lat: tmpLat, lng: tmpLng};

        marker = new google.maps.Marker(
            {
                position: tmpPosition,
                map: map,
                title: '<h4><b><%= event.title %></b></h4><p>Come to our event!</p>'
            }
        );
    <% end %>

    heatmap = new google.maps.visualization.HeatmapLayer({
        data: getPoints(),
        map: map
    });
    heatmap.set('radius', 50);
}

function toggleHeatmap() {
    heatmap.setMap(heatmap.getMap() ? null : map);
}

function changeGradient() {
    var gradient = [
        'rgba(0, 255, 255, 0)',
        'rgba(0, 255, 255, 1)',
        'rgba(0, 191, 255, 1)',
        'rgba(0, 127, 255, 1)',
        'rgba(0, 63, 255, 1)',
        'rgba(0, 0, 255, 1)',
        'rgba(0, 0, 223, 1)',
        'rgba(0, 0, 191, 1)',
        'rgba(0, 0, 159, 1)',
        'rgba(0, 0, 127, 1)',
        'rgba(63, 0, 91, 1)',
        'rgba(127, 0, 63, 1)',
        'rgba(191, 0, 31, 1)',
        'rgba(255, 0, 0, 1)'
    ]
    heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
}

function changeRadius() {
    heatmap.set('radius', heatmap.get('radius') ? null : 50);
}

function changeOpacity() {
    heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
}

// Heatmap data: 500 Points
function getPoints() {
    return [
        <% @events.each do |event| %>
            {location: new google.maps.LatLng(<%= event.latitude %>, <%= event.longitude %>), weight: <%= event.confirmed_attendees %>},
        <% end %>
    ];
}
