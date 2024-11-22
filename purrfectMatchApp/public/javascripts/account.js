let selectedArea = "";

//Old area
document.getElementById("etela-btn").addEventListener("click", () => {
  selectedArea = "Etelasuomen laani";
});

document.getElementById("ita-btn").addEventListener("click", () => {
  selectedArea = "Itasuomen laani";
});

document.getElementById("oulu-btn").addEventListener("click", () => {
  selectedArea = "Oulun laani";
});

document.getElementById("update-btn").addEventListener("click", () => {
  update();
});

async function update() {
  const name = document.getElementById("customer_name").value;
  const email = document.getElementById("customer_email").value;
  const phone = document.getElementById("customer_phone").value;

  const newName = document.getElementById("new_customer_name").value;
  const newEmail = document.getElementById("new_customer_email").value;
  const newPhone = document.getElementById("new_customer_phone").value;

  try {
    const response = await fetch("http://localhost:5000/update", {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name,
        email,
        phone,
        selectedArea,
        newName,
        newEmail,
        newPhone,
      }),
    });

    const result = await response.json();
    console.log(result);
  } catch (err) {
    console.log(err);
  }
}
