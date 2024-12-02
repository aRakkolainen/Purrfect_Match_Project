//HArd coded pocket for database admin is handling
let handledDatabase = "";

console.log(handledDatabase);
//Open admin view
function toggleView(loginAdmin) {
    const adminView = document.getElementById('admin-view');
    const loginView = document.getElementById('loginAsAdmin');

    const animalInfo = document.getElementById('animalInfo');
    const rescueInfo = document.getElementById('rescueInfo');
    const customerInfo = document.getElementById('customerInfo');
    const personInfo = document.getElementById('personInfo');
    const donationInfo = document.getElementById('donationInfo');
    const removeItem = document.getElementById('removeItem');
    const database = document.getElementById('removableDatabase');

    if (loginAdmin) {
        adminView.style.display = 'block';
        loginView.style.display = 'none';
    } else {
        adminView.style.display = 'none';
        animalInfo.style.display = 'none';
        rescueInfo.style.display = 'none';
        customerInfo.style.display = 'none';
        personInfo.style.display = 'none';
        donationInfo.style.display = 'none';
        removeItem.style.display = 'none';
        database.style.display = 'none';
    }
}

function login() {
    const name = document.getElementById('adminName').value;
    const password = document.getElementById('adminPassword').value;
    const database = document.querySelector('input[name="database"]:checked').value
    handledDatabase = database;
    toggleView(true)
    /*if (!name || !password) {
        alert("Please fill in all fields.");
        return;
    }
    else if (password === "1234" & name === "admin") {
        
       toggleView(true)
    }
    else {
        alert("Incorrect password or username")
    }*/
}
document.getElementById('adminLoginBTN').addEventListener('click', () => login());

//Admin prints tables from area database
function printTables(table) {
    console.log(handledDatabase)
    fetch(`/getTable?databaseName=${handledDatabase}&table=${table}`, {
        method: "GET"
    })
    .then(response => response.json())
    .then(data => {
        console.log(data)
        clearTable();
        createTable(data, table);
        
    }).catch(error => {
        console.error("Error:", error);
    });
}
document.getElementById('allAnimals').addEventListener('click', () => printTables('animals'));
document.getElementById('allResCent').addEventListener('click', () => printTables('rescue_centers'));
document.getElementById('allCustomer').addEventListener('click', () => printTables('customers'));
document.getElementById('allPerson').addEventListener('click', () => printTables('contact_persons'));
document.getElementById('allDonations').addEventListener('click', () => printTables('donations'));

function clearTable(){
    const tableContainer = document.getElementById("tableContainer");
    tableContainer.innerHTML=""
}

function createTable(data, dataTable) {
    //const tableHeader = document.createElement("h3");
    //tableHeader.textContent = header;
    //tableContainer.appendChild(tableHeader);
    //tableContainer.innerHTML=""
    //const objectLength = Object.keys(data[1]).length;

    const table= document.createElement("table");
    const headerRow = document.createElement("tr");
    let headers = [];

    if(dataTable === 'animals'){
        headers = ["animal ID", "Species", "name", "description", "age", "description of needs", "Rescuecenter ID"];
    }
    else if(dataTable === 'rescue_centers'){
        headers = ["Customer ID", "name", "location"];
    }
    else if(dataTable === 'customers'){
        headers = ["Rescue center ID", "name", "email", "phone"];
    }
    else if(dataTable === 'contact_persons'){
        headers = ["Contact person ID", "name", "email", "phone", "rescue center ID"];
    }
    else if(dataTable === 'donations'){
        headers = ["Donation ID", "Customer ID", "Rescue center ID", "amount (e)"];
    }

    //Creating header row
    headers.forEach(headerText => {
        const header = document.createElement("th");
        header.textContent = headerText;
        headerRow.appendChild(header);
    });
    table.appendChild(headerRow);
    
    //creating rest of table
    data.forEach(item => {
        const row = document.createElement("tr");

        Object.values(item).forEach(info => {
            const cell = document.createElement("td");
            cell.textContent = info;
            row.appendChild(cell);
        });

        table.appendChild(row);
    });

    tableContainer.appendChild(table);
}



//Open deletion forms for different database tables
function toggleRemoveView(showForm) {
    const animalInfo = document.getElementById('animalInfo');
    const rescueInfo = document.getElementById('rescueInfo');
    const customerInfo = document.getElementById('customerInfo');
    //const personInfo = document.getElementById('personInfo');
    const removeItem = document.getElementById('removeItem');
    const removeBTN = document.getElementById('removeBTN');

    animalInfo.style.display = 'none';
    rescueInfo.style.display = 'none';
    customerInfo.style.display = 'none';
    //personInfo.style.display = 'none';

    if (showForm === 'animal') {
        animalInfo.style.display = 'block';
    } else if (showForm === 'rescue') {
        rescueInfo.style.display = 'block';
    } else if (showForm === 'customer') {
        customerInfo.style.display = 'block';
    } /*else if (showForm === 'person') {
        personInfo.style.display = 'block';
    }*/

    removeItem.style.display = 'block';
    removeBTN.style.display = 'block';
}
document.getElementById('removeAnimal').addEventListener('click', () => toggleRemoveView('animal'));
document.getElementById('removeResCenter').addEventListener('click', () => toggleRemoveView('rescue'));
document.getElementById('removeCustomer').addEventListener('click', () => toggleRemoveView('customer'));
//document.getElementById('removeContact').addEventListener('click', () => toggleRemoveView('person'));

//Open modify forms for different database tables
function toggleModifyView(showForm) {
    const modifyAnimal = document.getElementById('modifyAnimalForm');
    const modifyRescue = document.getElementById('modifyRescueForm');   
    const modifyPerson = document.getElementById('modifyPersonForm');
    //const databaseRadio = document.getElementById('databaseRadio');
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

    //databaseRadio.style.display = 'block';
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

