 document.getElementById("recoverForm").addEventListener("submit", async function (e) {
      e.preventDefault();
      const email = document.getElementById("email").value;
      const res = await fetch("/recover-password", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email })
      });
      const data = await res.json();
      document.getElementById("message").innerText = data.message || "Erro ao enviar e-mail.";
    });
    //menu tempo do token

function isTokenValid(token) {
  if (!token) return false;
  try {
    const decoded = jwt_decode(token); // já disponível globalmente
    const now = Date.now() / 1000; // tempo atual em segundos
    return decoded.exp > now;
  } catch {
    return false;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const botaoAdotar = document.querySelector('#menu-quer-adotar');

  if (botaoAdotar) {
    botaoAdotar.addEventListener('click', (e) => {
      e.preventDefault();

      const token = window.localStorage.getItem('token');
      if (isTokenValid(token)) {
        window.location.href = 'quer_adotar.html';
      } else {
        alert("Seu token expirou, faça login novamente.");
        window.location.href = 'login.html';
      }
    });
  }
});


function isTokenValid(token) {
  if (!token) return false;
  try {
    const decoded = jwt_decode(token);
    const now = Date.now() / 1000;
    return decoded.exp > now;
  } catch {
    return false;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const botaoCadastrarPet = document.querySelector('#menu-cadastrar-pet');

  if (botaoCadastrarPet) {
    botaoCadastrarPet.addEventListener('click', (e) => {
      e.preventDefault();

      const token = window.localStorage.getItem('token');

      if (isTokenValid(token)) {
        window.location.href = 'quer_divulgar.html';
      } else {
        alert("Sessão expirada. Faça login novamente.");
        window.location.href = 'login.html';
      }
    });
  }
});