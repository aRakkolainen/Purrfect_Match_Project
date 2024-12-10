//const { get } = require("http");

//HArd coded pocket for database admin is handling
let handledDatabase = "";

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
    if (!name || !password) {
        alert("Please fill in all fields.");
        return;
    }
    else if (password === "1234") { 
       toggleView(true, name)
    }
    else {
        alert("Incorrect password or username")
    }
}
document.getElementById('adminLoginBTN').addEventListener('click', () => login());

//Admin prints tables from area database
function printTables(table) {
    fetch(`/getTable?databaseName=${handledDatabase}&table=${table}`, {
        method: "GET"
    })
    .then(response => response.json())
    .then(data => {
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
    const removeItem = document.getElementById('removeItemForm');
    const removeBTN = document.getElementById('removeBTN');

    if (showForm === 'animals') {
        animalInfo.style.display = 'block';
        rescueInfo.style.display = 'none';
        customerInfo.style.display = 'none';
    } else if (showForm === 'rescue_centers') {
        rescueInfo.style.display = 'block';
        animalInfo.style.display = 'none';
        customerInfo.style.display = 'none';
    } else if (showForm === 'customers') {
        customerInfo.style.display = 'block';
        rescueInfo.style.display = 'none';
        animalInfo.style.display = 'none';
    }

    removeItem.style.display = 'block';
    removeBTN.style.display = 'block';

    const newRemoveBTN = removeBTN.cloneNode(true);
    removeBTN.parentNode.replaceChild(newRemoveBTN, removeBTN);


    newRemoveBTN.addEventListener('click',async () => {
        const itemID = document.getElementById('itemID').value;
        const itemName = document.getElementById('itemName').value;
        if (!itemID || !itemName) {
            alert("Please Give an ID and name");
            return;
        }
        let itemData = [itemID, itemName]
        await removeData(showForm, itemData)
    })
}
document.getElementById('removeAnimal').addEventListener('click', () => toggleRemoveView('animals'));
document.getElementById('removeResCenter').addEventListener('click', () => toggleRemoveView('rescue_centers'));
document.getElementById('removeCustomer').addEventListener('click', () => toggleRemoveView('customers'));


function removeData(tableName, itemData) {

    fetch(`/removeData?databaseName=${handledDatabase}&table=${tableName}`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ itemData })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success === true){
            alert("data removed successfully");
            const removeItem = document.getElementById('removeItemForm');
            removeItem.reset();
            removeItem.style.display = 'none';
            document.getElementById('animalInfo').style.display = 'none';
            document.getElementById('rescueInfo').style.display = 'none';
            document.getElementById('customerInfo').style.display = 'none';
            document.getElementById('removeBTN').style.display = 'none';
        }
        else {
            alert("something went wrong")
        }
        
    }).catch(error => {
        console.error("Error:", error);
    });

}



//Open modify forms for different database tables
function toggleModifyView(showForm) {
    const modifyAnimal = document.getElementById('modifyAnimalForm');
    const modifyRescue = document.getElementById('modifyRescueForm');   
    const modifyPerson = document.getElementById('modifyPersonForm');
    const modifyBTN = document.getElementById('modifyBTN');

    if (showForm === 'animals') {
        modifyAnimal.style.display = 'block';
        modifyRescue.reset();
        modifyRescue.style.display = 'none';
        modifyPerson.reset();
        modifyPerson.style.display = 'none';
    } else if (showForm === 'rescue_centers') {
        modifyRescue.style.display = 'block';
        modifyAnimal.reset();
        modifyAnimal.style.display = 'none';
        modifyPerson.reset();
        modifyPerson.style.display = 'none';
    } else if (showForm === 'contact_persons') {
        modifyPerson.style.display = 'block';
        modifyAnimal.reset();
        modifyAnimal.style.display = 'none';
        modifyRescue.reset();
        modifyRescue.style.display = 'none';
    }

    modifyBTN.style.display = 'block';

    const newModifyBTN = modifyBTN.cloneNode(true);
    modifyBTN.parentNode.replaceChild(newModifyBTN, modifyBTN);


    newModifyBTN.addEventListener('click', async () => {

        let oldData = [];
        let data = [];

        if (showForm === 'animals') {
            const animelID = document.getElementById('animalIDExist').value;
            const animalName = document.getElementById('animalNameExist').value;

            const newName = document.getElementById('newAnimalName').value;
            const newSpecies = document.getElementById('modifySpecies').value;
            const newDescription = document.getElementById('newDesc').value;
            const newAge = document.getElementById('newAge').value;
            const newRequirements = document.getElementById('newRequirement').value;
            const newRescue= document.getElementById('newRescue').value;

            if (!animalName || !animelID) {
            alert("Please fill in all fields.");
            return;
        }

        if (!animalName & !newSpecies & !newDescription & !newAge & !newRequirements & !newRescue) {
            alert("Please fill atleas one field.");
            return;
        }
        oldData = [animalName, animelID]
        data = [newSpecies, newName, newDescription, newAge, newRequirements, newRescue];
        }
        else if (showForm === 'rescue_centers'){
            const centerID = document.getElementById('rescueIDExist').value;
            const CenterName = document.getElementById('rescueNameExist').value;

            const newNameCenter = document.getElementById('newRescueName').value;
            const newAddress = document.getElementById('newAddressResc').value;
       
            if (!CenterName || !centerID) {
                alert("Please fill in all fields.");
                return;
            }

            if (!newNameCenter  & !newAddress) {
                alert("Please fill atleast one of fields.");
                return;
            }
            oldData = [CenterName, centerID]
            data = [newNameCenter, newAddress];
        }

        else if (showForm === 'contact_persons'){
            const personID = document.getElementById('personIDExit').value;
            const personName = document.getElementById('personNameExit').value;

            const newPersonName = document.getElementById('newPersonName').value;
            const newEmail = document.getElementById('newPersonEmail').value;
            const newPhone = document.getElementById('newPersonPhone').value;
            const newRescueCent = document.getElementById('ContactResc').value;

            if (!personName || !personID) {
                alert("Please fill in all fields.");
                return;
            }

            if (!newPersonName & !newEmail  & !newPhone  & !newRescueCent) {
                alert("Please fill atleast one of fields.");
                return;
            }
            oldData = [personName, personID]
            data = [newPersonName, newEmail, newPhone, newRescueCent];
        }
        modifyData(showForm, oldData, data);
    })

}
document.getElementById('modifyAnimal').addEventListener('click', () => toggleModifyView('animals'));
document.getElementById('modifyResCenter').addEventListener('click', () => toggleModifyView('rescue_centers'));
document.getElementById('modifyContact').addEventListener('click', () => toggleModifyView('contact_persons'));

function modifyData (tableName, oldData, newData){
    fetch(`/modifyData?databaseName=${handledDatabase}&table=${tableName}`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ oldData, newData })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success === true){
            alert("data modified successfully")
            document.getElementById('modifyAnimalForm').reset();
            document.getElementById('modifyRescueForm').reset();
            document.getElementById('modifyPersonForm').reset();
            document.getElementById('modifyAnimalForm').style.display = 'none';
            document.getElementById('modifyRescueForm').style.display = 'none';
            document.getElementById('modifyPersonForm').style.display = 'none';
            document.getElementById('modifyBTN').style.display = 'none';
        }
        else {
            
            alert("something went wrong")
        }

        
    }).catch(error => {
        console.error("Error:", error);
    });
}











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