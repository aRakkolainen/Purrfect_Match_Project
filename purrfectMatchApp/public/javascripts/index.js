//JS file for handling the front-end

const southernFinlandProvinceBtn = document.getElementById(
  "SouthernFinlandProvinceBtn"
);
const provinceOfOuluBtn = document.getElementById("OuluProvinceBtn");
const easternFinlandProvinceBtn = document.getElementById("EasternFinlandProvinceBtn");

function toggleView(showAdmin) {
  const userView = document.getElementById("user-view");
  const adminView = document.getElementById("admin-view");

  if (showAdmin) {
    adminView.style.display = "block";
    userView.style.display = "none";
  } else {
    adminView.style.display = "none";
    userView.style.display = "block";
  }
}

// Lisätään kuuntelijat
document.addEventListener("DOMContentLoaded", () => {
  document
    .getElementById("openAdmin")
    .addEventListener("click", () => toggleView(true));
  document
    .getElementById("openUser")
    .addEventListener("click", () => toggleView(false));
});
