let selectedArea = "";

document.getElementById("etela-btn").addEventListener("click", () => {
  console.log("hello");
  selectedArea = "Etelasuomen laani";
});

document.getElementById("ita-btn").addEventListener("click", () => {
  selectedArea = "Itasuomen laani";
});

document.getElementById("oulu-btn").addEventListener("click", () => {
  selectedArea = "Oulun laani";
});

document.getElementById("registration-btn").addEventListener("click", () => {
  register();
});

async function register() {
  const name = document.getElementById("customer_name").value;
  const email = document.getElementById("customer_email").value;
  const phone = document.getElementById("customer_phone").value;

  console.log("hello");

  try {
    const response = await fetch("http://localhost:5000/register", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ name, email, phone, selectedArea }),
    });
    if (response.ok) {
      console.log("Data inserted");
    }
  } catch (err) {
    console.log(err);
  }
}
