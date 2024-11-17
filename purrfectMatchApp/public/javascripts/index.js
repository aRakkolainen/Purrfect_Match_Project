//JS file for handling the front-end

//Buttons for each province

const southernFinlandProvinceBtn = document.getElementById("SouthernFinlandProvinceBtn");
const provinceOfOuluBtn = document.getElementById("OuluProvinceBtn");
const easternFinlandProvinceBtn = document.getElementById("EasternFinlandProvinceBtn");

/*function showAdminView () {
    document.getElementById('openAdmin').addEventListener('click', () => {
    const userView = document.getElementById('user-view');
    const adminView = document.getElementById('admin-view');

    adminView.style.display = 'block';
    userView.style.display = 'none';

    });
}

showAdminView();

function showUserView () {
    document.getElementById('openUser').addEventListener('click', () => {
    const userView = document.getElementById('user-view');
    const adminView = document.getElementById('admin-view');

    adminView.style.display = 'none';
    userView.style.display = 'block';

    });
}

showUserView();*/

function toggleView(showAdmin) {
    const userView = document.getElementById('user-view');
    const adminView = document.getElementById('admin-view');

    if (showAdmin) {
        adminView.style.display = 'block';
        userView.style.display = 'none';
    } else {
        adminView.style.display = 'none';
        userView.style.display = 'block';
    }
}

// Lisätään kuuntelijat
document.getElementById('openAdmin').addEventListener('click', () => toggleView(true));
document.getElementById('openUser').addEventListener('click', () => toggleView(false));



