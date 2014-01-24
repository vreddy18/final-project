map = L.map("map").setView([41.8236, -71.4222], 13)
L.tileLayer("http://{s}.tile.cloudmade.com/04adbf8bbff34eb69d1658aef8974b03/997/256/{z}/{x}/{y}.png",
            attribution: "Map data &copy; <a href=\"http://openstreetmap.org\">OpenStreetMap</a> 
            contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, 
            Imagery © <a href=\"http://cloudmade.com\">CloudMade</a>"
            maxZoom: 18).addTo map
