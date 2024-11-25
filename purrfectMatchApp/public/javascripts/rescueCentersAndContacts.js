let rescueCentersTableBody = document.getElementById("rescueCenters");
const showAllRescueCenters = document.getElementById("allProvincesOption");
const showOnlySouthernFinlandCenters = document.getElementById("southernFinlandProvinceOption");
const showOnlyEasternFinlandCenters = document.getElementById("easternFinlandProvinceOption");
const showOnlyProvinceOfOuluCenters = document.getElementById("provinceOfOuluOption");
const filterBtn = document.getElementById("filterCentersBtn");

window.onload = async () => {
    filterBtn.addEventListener("click", async () => {
        console.log("Filtering based on your choice..");
        clearTable(rescueCentersTableBody, "rescueCenterRow#");
        if(showAllRescueCenters.checked) {
            console.log("Showing all rescue centers and their contacts persons..");
            let url = 'http://localhost:3000/list/rescueCenters';
            let response = await fetchRescueCentersData(url);
            let rescueCentersList = response.rescueCenters;
            fillRescueCenterTable(rescueCentersList);
        }

        if(showOnlySouthernFinlandCenters.checked) {
            console.log("Showing rescue centers and their contacts persons in Southern Finland");
            let url = 'http://localhost:3000/list/rescueCenters/southernFinland';
            let response = await fetchRescueCentersData(url);
            let rescueCentersList = response.rescueCenters;
            fillRescueCenterTable(rescueCentersList);
        }

        if(showOnlyEasternFinlandCenters.checked) {
            console.log("Showing rescue centers and their contacts persons in Eastern Finland");
            let url = 'http://localhost:3000/list/rescueCenters/easternFinland';
            let response = await fetchRescueCentersData(url);
            let rescueCentersList = response.rescueCenters;
            fillRescueCenterTable(rescueCentersList);
        }

        if(showOnlyProvinceOfOuluCenters.checked) {
            console.log("Showing rescue centers and their contacts persons in Province of Oulu");
            let url = 'http://localhost:3000/list/rescueCenters/provinceOfOulu';
            let response = await fetchRescueCentersData(url);
            let rescueCentersList = response.rescueCenters;
            fillRescueCenterTable(rescueCentersList);
        }
    })

    
}




async function fetchRescueCentersData(url) {
    let result = await fetch(url);
    let rescueCentersList = await result.json();
    return rescueCentersList;
}


function fillRescueCenterTable(rescueCentersList) {
    console.log("Filling the table..");
    if(rescueCentersList && rescueCentersList.length > 0) {
        let id=0;
        rescueCentersList.forEach(center => {
            let row = createRescueCenterRow(center, id);
            rescueCentersTableBody.appendChild(row);
            id++;
        });
    }
}

function createRescueCenterRow(center,id) {
    let row = document.createElement("tr");
    let centerNameColumn = document.createElement("td");
    let centerNameText = addText(center.rescue_center_id, center.rescue_center_name);
    centerNameColumn.appendChild(centerNameText);
    let centerLocationColumn = document.createElement("td");
    let centerLocationText = addText("location#" + center.rescue_center_id, center.center_location);
    centerLocationColumn.appendChild(centerLocationText);
    let centerContactPersonColumn = document.createElement("td");
    let centerContactPersonRow = document.createElement("tr");
    let contact_person_id = center.contact_person_id;
    let contactPersonNameText = addText("name#"+contact_person_id, center.contact_person);
    let contactPersonEmailText = addText("email#"+contact_person_id, center.email);
    let contactPersonPhoneText = addText("phone#" + contact_person_id, center.phone);
    centerContactPersonRow.appendChild(contactPersonNameText);
    centerContactPersonRow.appendChild(contactPersonEmailText);
    centerContactPersonRow.appendChild(contactPersonPhoneText);
    centerContactPersonColumn.appendChild(centerContactPersonRow);
    row.appendChild(centerNameColumn);
    row.appendChild(centerLocationColumn);   
    row.appendChild(centerContactPersonColumn);        
    row.setAttribute("id", "rescueCenterRow#" + id);
    return row;
}


function clearTable(tableBody, baseID){
    let numberOfRows = tableBody.rows.length;
    for (let i=0; i < numberOfRows; i++) {
        let row = document.getElementById(baseID+i);
        tableBody.removeChild(row);
    }
}

function addText(id, text) {
    let textBox = document.createElement("p");
    textBox.setAttribute("id", id);
    textBox.innerText = text;
    return textBox;
}