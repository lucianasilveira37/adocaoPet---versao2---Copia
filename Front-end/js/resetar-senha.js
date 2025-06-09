// Extrair o token da URL
    const params = new URLSearchParams(window.location.search);
    const token = params.get("token");
    document.getElementById("token").value = token;

    document.getElementById("resetForm").addEventListener("submit", async function (e) {
      e.preventDefault();
      const password = document.getElementById("password").value;

      const res = await fetch("/reset-password", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ token, password })
      });
      const data = await res.json();
      document.getElementById("resetMessage").innerText = data.message || "Erro ao redefinir senha.";
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