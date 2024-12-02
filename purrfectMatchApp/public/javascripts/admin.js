//const { get } = require("http");

//HArd coded pocket for database admin is handling
let handledDatabase = "";

console.log(handledDatabase);
//Open admin view
function toggleView(loginAdmin, user) {
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
        let welcome = document.getElementById('welcomeText');
        welcome.innerHTML = 'Welcome admin ' + user;
        let specification = document.getElementById('areaSpesfication');
        specification.innerHTML = `Show data from ${handledDatabase} database`;
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
    toggleView(true, name)
    /*if (!name || !password) {
        alert("Please fill in all fields.");
        return;
    }
    else if (password === "1234") {
        
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
    const removeItem = document.getElementById('removeItem');
    const removeBTN = document.getElementById('removeBTN');

    if (showForm === 'animal') {
        animalInfo.style.display = 'block';
    } else if (showForm === 'rescue') {
        rescueInfo.style.display = 'block';
    } else if (showForm === 'customer') {
        customerInfo.style.display = 'block';
    }

    removeItem.style.display = 'block';
    removeBTN.style.display = 'block';
}
document.getElementById('removeAnimal').addEventListener('click', () => toggleRemoveView('animal'));
document.getElementById('removeResCenter').addEventListener('click', () => toggleRemoveView('rescue'));
document.getElementById('removeCustomer').addEventListener('click', () => toggleRemoveView('customer'));

//Open modify forms for different database tables
function toggleModifyView(showForm) {
    const modifyAnimal = document.getElementById('modifyAnimalForm');
    const modifyRescue = document.getElementById('modifyRescueForm');   
    const modifyPerson = document.getElementById('modifyPersonForm');
    const modifyBTN = document.getElementById('modifyBTN');

    if (showForm === 'animals') {
        modifyAnimal.style.display = 'block';
    } else if (showForm === 'rescue') {
        modifyRescue.style.display = 'block';
    } else if (showForm === 'person') {
        modifyPerson.style.display = 'block';
    }

    modifyBTN.style.display = 'block';
}
document.getElementById('modifyAnimal').addEventListener('click', () => toggleModifyView('animals'));
document.getElementById('modifyResCenter').addEventListener('click', () => toggleModifyView('rescue'));
document.getElementById('modifyContact').addEventListener('click', () => toggleModifyView('person'));

//Open insert forms for different database tables
async function toggleInsertView(showForm) {
    const insertAnimal = document.getElementById('insertAnimalForm');
    const insertRescue = document.getElementById('insertRescueForm');
    const insertBTN = document.getElementById('insertBTN');

    if (showForm === 'animals') {
        insertAnimal.style.display = 'block';
        insertRescue.reset();
        insertRescue.style.display = 'none';
    } else if (showForm === 'rescue_centers') {
        insertRescue.style.display = 'block';
        insertAnimal.reset();
        insertAnimal.style.display = 'none';
    }

    insertBTN.style.display = 'block';

    const newInsertBTN = insertBTN.cloneNode(true);
    insertBTN.parentNode.replaceChild(newInsertBTN, insertBTN);


    newInsertBTN.addEventListener('click', async () => {

        let data = [];

        if (showForm === 'animals') {
            const animalName = document.getElementById('insertAnimalName').value;
            const species = document.getElementById('insertSpecies').value;
            const description = document.getElementById('insertDesc').value;
            const age = document.getElementById('insertAge').value;
            const requirements = document.getElementById('insertRequirement').value;
            const rescue= document.getElementById('insertRescue').value;

        if (!animalName || !species || !description || !age || !requirements || !rescue) {
            alert("Please fill in all fields.");
            return;
        }

        data = [species, animalName, description, age, requirements, rescue];
        }
        else if (showForm === 'rescue_centers'){
            const centerName = document.getElementById('insertRescueName').value;
            const address = document.getElementById('insertAddressResc').value;
    
            const contactName = document.getElementById('insertPersonName').value;
            const email = document.getElementById('insertPersonEmail').value;
            const phone = document.getElementById('insertPersonPhone').value;
    
            if (!centerName || !address || !contactName || !email || !phone) {
                alert("Please fill in all fields.");
                return;
            }
            data = [centerName, address, contactName, email, phone];
        }
        insertData(showForm, data);
    })

}
document.getElementById('insertAnimal').addEventListener('click', () => toggleInsertView('animals'));
document.getElementById('insertResCenter').addEventListener('click', () => toggleInsertView('rescue_centers'));

function insertData(tableName, data){
    console.log(data)
    fetch(`/insertData?databaseName=${handledDatabase}&table=${tableName}`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ data })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success === true){
            alert("data inserted successfully")
            document.getElementById('insertAnimalForm').reset();
            document.getElementById('insertRescueForm').reset();
            document.getElementById('insertAnimalForm').style.display = 'none';
            document.getElementById('insertRescueForm').style.display = 'none';
            document.getElementById('insertBTN').style.display = 'none';
        }
        else {
            
            alert("something went wrong")
        }

        
    }).catch(error => {
        console.error("Error:", error);
    });
}