document.getElementById("rescueInfo").style.display = "none";
document.getElementById("donation").style.display = "none";
document.getElementById("donationsInfo").style.display = "none";

let selectedArea = "";

document.getElementById("etela-btn").addEventListener("click", () => {
  selectedArea = "Etelasuomen laani";
  checkAccount();
});

document.getElementById("oulu-btn").addEventListener("click", () => {
  selectedArea = "Oulun laani";
  checkAccount();
});

document.getElementById("ita-btn").addEventListener("click", () => {
  selectedArea = "Itasuomen laani";
  checkAccount();
});

document.getElementById("don-btn").addEventListener("click", () => {
  cusDonations();
});

//View user's donations
async function cusDonations() {
  const name = document.getElementById("cutomer_name").value;
  const email = document.getElementById("customer_email").value;

  try {
    const response = await fetch("http://localhost:5000/usersDonation", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ name, email, selectedArea }),
    });
    const donations = await response.json();
    document.getElementById("donationsInfo").style.display = "";

    const tbody = document
      .getElementById("donationsData")
      .querySelector("tbody");
    tbody.innerHTML = "";

    donations.forEach((donation) => {
      const row = document.createElement("tr");
      const centerCell = document.createElement("td");
      centerCell.textContent = donation.rescue_center_name;
      const amountCell = document.createElement("td");
      amountCell.textContent = donation.amount;
      row.appendChild(centerCell);
      row.appendChild(amountCell);
      tbody.appendChild(row);
    });
  } catch (err) {
    console.log(err);
  }
}

//Check if there is an account
async function checkAccount() {
  const name = document.getElementById("cutomer_name").value;
  const email = document.getElementById("customer_email").value;

  try {
    const response = await fetch("http://localhost:5000/accountCheck", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ name, email, selectedArea }),
    });
    const { customerID, listResult } = await response.json();
    document.getElementById("registerAccount").style.display = "none";
    document.getElementById("rescueInfo").style.display = "";
    document.getElementById("donation").style.display = "";

    displayData(
      listResult,
      "rescueData",
      ["rescue_center_name"],
      customerID,
      selectedArea
    );
  } catch (err) {
    console.log(err);
  }
}

//Displays account's area recue centers to choose
function displayData(data, tableId, columns, customerID, selectedArea) {
  try {
    const tbody = document.getElementById(tableId).querySelector("tbody");
    tbody.innerHTML = "";

    data.forEach((item) => {
      const row = document.createElement("tr");
      row.style.cursor = "pointer";
      row.addEventListener("click", () => {
        selectedRescueCenter(item, customerID, selectedArea);
      });
      columns.forEach((column) => {
        const cell = document.createElement("td");
        cell.textContent = item[column];
        row.appendChild(cell);
      });
      tbody.appendChild(row);
    });
  } catch (err) {
    console.log(err);
  }
}

//Select wanted rescue center and amount
function selectedRescueCenter(center, customerid, selectedArea) {
  const selectedCenter = document.getElementById("selectedRescueCenter");
  selectedCenter.textContent = `You selected: ${center.rescue_center_name}`;

  const rescueCenterID = center.rescue_center_id;
  const customerID = customerid;

  document.getElementById("donate-btn").addEventListener("click", () => {
    const donAmount = document.getElementById("donationAmount").value;
    donation(rescueCenterID, customerID, donAmount, selectedArea);
  });
}

//Make donation for the center
async function donation(rescueCenterID, customerID, donAmount, selectedArea) {
  try {
    const response = await fetch("http://localhost:5000/donation", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        customerID,
        rescueCenterID,
        donAmount,
        selectedArea,
      }),
    });
    if (response.ok) {
      console.log("Donation was successful!");
    } else {
      console.error("Failed to process donation.");
    }
  } catch (err) {
    console.log(err);
  }
}
