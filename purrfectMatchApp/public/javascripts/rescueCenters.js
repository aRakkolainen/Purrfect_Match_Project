let rescueCentersTableBody = document.getElementById("rescueCenters");
const showAllRescueCenters = document.getElementById("allProvincesOption");
const showOnlySouthernFinlandCenters = document.getElementById("southernFinlandProvinceOption");
const showOnlyEasternFinlandCenters = document.getElementById("easternFinlandProvinceOption");
const showOnlyProvinceOfOuluCenters = document.getElementById("provinceOfOuluOption");

window.onload = async () => {
    let response = await fetchAllRescueCentersData();
    let rescueCentersList = response.rescueCenters;
    fillRescueCenterTable(rescueCentersList);
    showAllRescueCenters.addEventListener("click", () => {
        
    })

    if(showAllRescueCenters.checked) {
        console.log("Showing all rescue centers..");
    } else if(showOnlySouthernFinlandCenters.checked) {
        console.log("Showing only rescue centers in Southern Finland Area");
    }
}




async function fetchAllRescueCentersData() {
    let url = 'http://localhost:3000/list/rescueCenters';
    let result = await fetch(url);
    let rescueCentersList = await result.json();
    return rescueCentersList;
}


function fillRescueCenterTable(rescueCentersList) {
    console.log("Filling the table..");
    if(rescueCentersList && rescueCentersList.length > 0) {
        rescueCentersList.forEach(center => {
            let row = createRescueCenterRow(center);
            rescueCentersTableBody.appendChild(row);
        });
    }
}

function createRescueCenterRow(center) {
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
    row.setAttribute("id", center.rescue_center_id);
    return row;
}


function clearTable(tableBody, baseID){
    let numberOfRows = tableBody.rows.length;
    for (let i=0; i < numberOfRows; i++) {
        let id = baseID + i; 
        let row = document.getElementById(id);
        tableBody.removeChild(row);
    }
}

function addText(id, text) {
    let textBox = document.createElement("p");
    textBox.setAttribute("id", id);
    textBox.innerText = text;
    return textBox;
}