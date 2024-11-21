let rescueCentersTableBody = document.getElementById("rescueCenters");

window.onload = async () => {
    let rescueCentersList = await fetchAllRescueCentersData();
    console.log(rescueCentersList);
    fillRescueCenterTable(rescueCentersList);
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
            row.appendChild(centerNameColumn);
            
            row.setAttribute("id", center.rescue_center_id);
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