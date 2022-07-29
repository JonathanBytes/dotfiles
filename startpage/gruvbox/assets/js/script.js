function search(event) {
  var x = event.key;
  if (x == "Enter") {
    event.preventDefault()
    let text = document.getElementById("searchbar").value;
    url = 'https://google.com/search?q=' + text
    window.open(url, '_self');
  }
}

function startTime() {
  const currentDate = new Date();

  var hours = checkTime(currentDate.getHours());
  var minutes = checkTime(currentDate.getMinutes());
  var ampm = hours >= 12 ? 'PM' : 'AM';
  hours = hours % 12;
  hours = hours ? hours : 12; // the hour '0' should be '12'
  minutes = minutes < 10 ? minutes : minutes;
  document.getElementById("header-time").innerHTML = hours + ":" + minutes + ampm;

  // document.getElementById("header-time").innerHTML = checkTime(currentDate.getHours()) + ":" + checkTime(currentDate.getMinutes());

  const dateOptions = {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric"
  };

  document.getElementById("header-date").innerHTML = currentDate.toLocaleDateString("en-GB", dateOptions);

  setTimeout(startTime, (60 - currentDate.getSeconds()) * 1000);
}

function checkTime(time) {
  if (time < 10) { time = "0" + time };
  return time;
}
document.getElementById("container").addEventListener('DOMContentLoaded', startTime());
