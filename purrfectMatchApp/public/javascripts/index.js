//JS file for handling the front-end

//Buttons for each province

const southernFinlandProvinceBtn = document.getElementById("SouthernFinlandProvinceBtn");
const provinceOfOuluBtn = document.getElementById("OuluProvinceBtn");
const easternFinlandProvinceBtn = document.getElementById("EasternFinlandProvinceBtn");

//Open admin view
function toggleView(showAdmin) {
    const userView = document.getElementById('user-view');
    const adminView = document.getElementById('admin-view');

    const animalInfo = document.getElementById('animalInfo');
    const rescueInfo = document.getElementById('rescueInfo');
    const customerInfo = document.getElementById('customerInfo');
    const personInfo = document.getElementById('personInfo');
    const donationInfo = document.getElementById('donationInfo');
    const removeItem = document.getElementById('removeItem');
    const database = document.getElementById('removableDatabase');

    if (showAdmin) {
        adminView.style.display = 'block';
        userView.style.display = 'none';
    } else {
        adminView.style.display = 'none';
        userView.style.display = 'block';
        animalInfo.style.display = 'none';
        rescueInfo.style.display = 'none';
        customerInfo.style.display = 'none';
        personInfo.style.display = 'none';
        donationInfo.style.display = 'none';
        removeItem.style.display = 'none';
        database.style.display = 'none';
    }
}

// Lisätään kuuntelijat
document.getElementById('openAdmin').addEventListener('click', () => toggleView(true));
document.getElementById('openUser').addEventListener('click', () => toggleView(false));


//Open deletion forms for different database tables
function toggleRemoveView(showForm) {
    const animalInfo = document.getElementById('animalInfo');
    const rescueInfo = document.getElementById('rescueInfo');
    const customerInfo = document.getElementById('customerInfo');
    const personInfo = document.getElementById('personInfo');
    const removeItem = document.getElementById('removeItem');
    const database = document.getElementById('removableDatabase');

    animalInfo.style.display = 'none';
    rescueInfo.style.display = 'none';
    customerInfo.style.display = 'none';
    personInfo.style.display = 'none';

    if (showForm === 'animal') {
        animalInfo.style.display = 'block';
    } else if (showForm === 'rescue') {
        rescueInfo.style.display = 'block';
    } else if (showForm === 'customer') {
        customerInfo.style.display = 'block';
    } else if (showForm === 'person') {
        personInfo.style.display = 'block';
    }

    removeItem.style.display = 'block';
    database.style.display = 'block';
}
document.getElementById('removeAnimal').addEventListener('click', () => toggleRemoveView('animal'));
document.getElementById('removeResCenter').addEventListener('click', () => toggleRemoveView('rescue'));
document.getElementById('removeCustomer').addEventListener('click', () => toggleRemoveView('customer'));
document.getElementById('removeContact').addEventListener('click', () => toggleRemoveView('person'));

//Open modify forms for different database tables
function toggleModifyView(showForm) {
    const modifyAnimal = document.getElementById('modifyAnimalForm');
    const modifyRescue = document.getElementById('modifyRescueForm');   
    const modifyPerson = document.getElementById('modifyPersonForm');
    const databaseRadio = document.getElementById('databaseRadio');
    const modifyBTN = document.getElementById('modifyBTN');

    modifyAnimal.style.display = 'none';
    modifyRescue.style.display = 'none';
    modifyPerson.style.display = 'none';

    if (showForm === 'animal') {
        modifyAnimal.style.display = 'block';
    } else if (showForm === 'rescue') {
        modifyRescue.style.display = 'block';
    } else if (showForm === 'person') {
        modifyPerson.style.display = 'block';
    }

    databaseRadio.style.display = 'block';
    modifyBTN.style.display = 'block';
}
document.getElementById('modifyAnimal').addEventListener('click', () => toggleModifyView('animal'));
document.getElementById('modifyResCenter').addEventListener('click', () => toggleModifyView('rescue'));
document.getElementById('modifyContact').addEventListener('click', () => toggleModifyView('person'));

//Open insert forms for different database tables
function toggleInsertView(showForm) {
    const insertAnimal = document.getElementById('insertAnimalForm');
    const insertRescue = document.getElementById('insertRescueForm');
    const databaseRadio = document.getElementById('databaseRadioInsert');
    const insertBTN = document.getElementById('insertBTN');

    insertAnimal.style.display = 'none';
    insertRescue.style.display = 'none';

    if (showForm === 'animal') {
        insertAnimal.style.display = 'block';
    } else if (showForm === 'rescue') {
        insertRescue.style.display = 'block';
    }

    databaseRadio.style.display = 'block';
    insertBTN.style.display = 'block';
}
document.getElementById('insertAnimal').addEventListener('click', () => toggleInsertView('animal'));
document.getElementById('insertResCenter').addEventListener('click', () => toggleInsertView('rescue'));

