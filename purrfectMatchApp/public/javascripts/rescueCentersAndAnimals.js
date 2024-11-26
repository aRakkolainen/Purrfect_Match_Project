/*
Sources:
1) Source for implementing dynamic pagination: https://stackoverflow.com/questions/76086100/how-to-create-pagination-function-for-dynamically-created-table


*/


const showAllRescueCenters = document.getElementById("allProvincesOption");
const showOnlySouthernFinlandCenters = document.getElementById("southernFinlandProvinceOption");
const showOnlyEasternFinlandCenters = document.getElementById("easternFinlandProvinceOption");
const showOnlyProvinceOfOuluCenters = document.getElementById("provinceOfOuluOption");
const filterBtn = document.getElementById("filterCentersBtn");
const backToTopBtn = document.getElementById("backToTopBtn");
const paginationLabel = document.getElementById("paginationLabel");
const animalCardsList = document.getElementById("rescueCenterAnimals");
const cardsPerPage = 10;

window.onload = async () => {
    filterBtn.addEventListener("click", async () => {
        console.log("Filtering based on your choice..");
        clearAnimalsCards();
        if(showAllRescueCenters.checked) {
            console.log("Showing all rescue centers and their animals..");
            let url = 'http://localhost:3000/list/rescueCenters/animals/all';
            await fetchAndFillRescueAnimalsList(url);
        }

        if(showOnlySouthernFinlandCenters.checked) {
            console.log("Showing rescue centers and their animals in Southern Finland");
            let url = 'http://localhost:3000/list/rescueCenters/animals/southernFinlandProvince';
            await fetchAndFillRescueAnimalsList(url);
        }

        if(showOnlyEasternFinlandCenters.checked) {
            console.log("Showing rescue centers and their animals in Eastern Finland");
            let url = 'http://localhost:3000/list/rescueCenters/animals/easternFinlandProvince';
            await fetchAndFillRescueAnimalsList(url);
        }

        if(showOnlyProvinceOfOuluCenters.checked) {
            console.log("Showing rescue centers and their animals in Province of Oulu");
            let url = 'http://localhost:3000/list/rescueCenters/animals/provinceOfOulu';
            await fetchAndFillRescueAnimalsList(url);
        }
    })
}
async function fetchAndFillRescueAnimalsList(url) {
    let response = await fetchRescueCentersData(url);
    let rescueCenterAnimalsList = response.rescueCenterAnimals;
    //Source 1 was used for this pagination part
    const pageCount = calculatePageCount(rescueCenterAnimalsList.length, cardsPerPage);
    const remainder = calculateRemainder(rescueCenterAnimalsList.length, cardsPerPage);
    if(cardsPerPage > rescueCenterAnimalsList.length) {
        clearAnimalsCards();
        fillRescueCenterAnimalCards(rescueCenterAnimalsList, 0, rescueCenterAnimalsList.length);
    } else {
        clearAnimalsCards();
        fillRescueCenterAnimalCards(rescueCenterAnimalsList, 0, cardsPerPage);
    }

    if(pageCount > 1) {
        let pagination = document.getElementById("pagination");
        pagination.setAttribute("class", "pagination");
        for (let j = 0; j < pageCount - 1; j++) {
            let button = document.createElement("button");
            button.setAttribute("class", "waves-light btn");
            button.innerText = parseInt(j+1);
            button.addEventListener("click", () => {
                clearAnimalsCards();
                fillRescueCenterAnimalCards(rescueCenterAnimalsList, j*cardsPerPage, j*cardsPerPage+cardsPerPage);
            })
            pagination.appendChild(button);
          }
          // Add the last page button which might have less cards
          if (remainder !== 0) {

            let button = document.createElement("button");
            
            button.innerText = pageCount;
            button.setAttribute("class", "waves-light btn");
            button.addEventListener("click", () => {
                clearAnimalsCards();
                fillRescueCenterAnimalCards(rescueCenterAnimalsList, pageCount-1*cardsPerPage, (pageCount-1)*cardsPerPage+remainder);
            })
            pagination.appendChild(button);
          } else {
            let button = document.createElement("button");
            button.setAttribute("class", "waves-light btn");
            button.innerText = pageCount;
            button.addEventListener("click", () => {
                clearAnimalsCards();
                fillRescueCenterAnimalCards(rescueCenterAnimalsList, pageCount-1*cardsPerPage, (pageCount-1)*cardsPerPage+cardsPerPage);
            });
          }

          backToTopBtn.setAttribute("class", "visible");
          paginationLabel.setAttribute("class", "visible");
          backToTopBtn.addEventListener("click", () => {
                document.documentElement.scrollTop = 0;
          })
          
    }



}
async function fetchRescueCentersData(url) {
    let result = await fetch(url);
    let rescueCenterAnimalsList = await result.json();
    return rescueCenterAnimalsList;
}
//1)
function calculatePageCount(totalAnimalCards, cardsPerPage) {
    return Math.ceil(totalAnimalCards/cardsPerPage);
}
//1)
function calculateRemainder(totalAnimalCards, cardsPerPage) {
    return totalAnimalCards - Math.floor(totalAnimalCards/ cardsPerPage) * cardsPerPage;
}




function fillRescueCenterAnimalCards(rescueCenterAnimalsList, startIndex, endIndex) {
    //if(rescueCenterAnimalsList && rescueCenterAnimalsList.length > 0) {
        let id=0;
        for (let i=startIndex; i < endIndex; i++) {
            let animal = rescueCenterAnimalsList[i];
            let item = createRescueCenterListItem(animal, id);
            animalCardsList.appendChild(item);
            id++;
        }
        /* rescueCenterAnimalsList.forEach(animal => {
            while(id > pageCount) {
                let item = createRescueCenterListItem(animal, id);
                animalCardsList.appendChild(item);
                id++;
            }
        }); */
}
//Source: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
function getRandomIndex(max) {
    return Math.floor(Math.random() * max);
  }
  


function createRescueCenterListItem(animal, id) {
        let listItem = document.createElement("li");
        listItem.setAttribute("id", "card#"+id);

        let rescueCenterHeader = addHeader("header#"+animal.rescue_center_id, animal.rescue_center_name, "h3");
        rescueCenterHeader.setAttribute("id", "rescueCenterHeader");
        listItem.appendChild(rescueCenterHeader);

        let divRow = document.createElement("div");
        divRow.setAttribute("class", "row");
        let divColumn = document.createElement("div");
        divColumn.setAttribute("class", "col s12 m7");
        let cardDiv = document.createElement("div");
        cardDiv.setAttribute("class", "card");
        let cardImgDiv = document.createElement("div");
        cardImgDiv.setAttribute("class", "animalCardImgDiv");
        let cardImg = document.createElement("img");
        cardImg.setAttribute("class", "animalImg");
        let species = animal.species.toLowerCase();
        switch(species){
            case ("cat"):
                let catImages = ['./images/cat_sample1.jpg', './images/cat_sample2.jpg', './images/cat_sample3.jpg'];
                cardImg.setAttribute("src", catImages[getRandomIndex(catImages.length)]);
                break;
            case ("dog"):
                let dogImages = ['./images/dog_sample1.jpg', './images/dog_sample2.jpg', './images/dog_sample3.jpg'];
                cardImg.setAttribute("src", dogImages[getRandomIndex(dogImages.length)]);
                break;
            case("bunny"):
                let bunnyImages = ['./images/bunny_sample1.jpg', './images/bunny_sample2.jpg', './images/bunny_sample3.jpg'];
                cardImg.setAttribute("src", bunnyImages[getRandomIndex(bunnyImages.length)]);
                break;
            case("guinea pig"):
                let guineaPigImages = ['./images/guinea_pig_sample1.jpg', './images/guinea_pig_sample2.jpg']
                cardImg.setAttribute("src", guineaPigImages[getRandomIndex(guineaPigImages.length)]);
                break;
            case("hamster"):
                let hamsterImages = ['./images/hamster_sample1.jpg', './images/hamster_sample2.jpg']
                cardImg.setAttribute("src", hamsterImages[getRandomIndex(hamsterImages.length)]);
                break;
            default:
                break;
        }
        
        cardImgDiv.appendChild(cardImg);

        let cardContentDiv = document.createElement("div");
        let basicInfo = animal.animal_name + ", " + animal.age;  
        let basicDetailsHeader = addHeader("basic#"+id, basicInfo, "h4");
        let descriptionHeader = addHeader("desc", "Description: ", "h5");
        let descriptionTextBox = addText("desc#"+id, animal.animal_description);
        descriptionTextBox.setAttribute("class", "textBox");
        let requirementHeader = addHeader("req", "Requirements for home:", "h5");
        let requirementDescriptionTextBox = addText("req#"+id, animal.requirement_description);
        requirementDescriptionTextBox.setAttribute("class", "textBox");
        let cardActionDiv = document.createElement("div");
        cardContentDiv.appendChild(basicDetailsHeader);
        cardContentDiv.appendChild(descriptionHeader);
        cardContentDiv.appendChild(descriptionTextBox);
        cardContentDiv.appendChild(requirementHeader);
        cardContentDiv.appendChild(requirementDescriptionTextBox);

        divRow.appendChild(divColumn);
        divColumn.appendChild(cardDiv);
        cardDiv.appendChild(cardImgDiv);
        cardDiv.appendChild(cardContentDiv);
        cardDiv.appendChild(cardActionDiv);
        
        listItem.appendChild(divRow);
        
        return listItem;

}

function addHeader(id, text, headerSize) {
    let header = document.createElement(headerSize);
    header.setAttribute("id", id);
    header.innerText = text;
    return header;
}

function addText(id, text) {
    let textBox = document.createElement("p");
    textBox.setAttribute("id", id);
    textBox.innerText = text;
    return textBox;
}
//Based on this tutorial: https://www.tutorialspoint.com/how-to-remove-an-added-list-items-using-javascript
function clearAnimalsCards() {
    while(animalCardsList.firstChild) {
        animalCardsList.removeChild(animalCardsList.firstChild);
    }
}