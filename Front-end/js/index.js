document.addEventListener('DOMContentLoaded', () => {
  carregarPets();
  configurarMenuAdotar();
  configurarMenuCadastrarPet();
  carregarNoticias();
  carregarPetsAdotados();
});

// Função para validar o token
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

// ==========================
// 1. Carregar pets disponíveis
// ==========================
async function carregarPets() {
  const container = document.getElementById('pets-container');

  try {
    const response = await fetch('http://localhost:8080/pet/all');
    if (!response.ok) throw new Error(`HTTP ${response.status} - ${response.statusText}`);

    const data = await response.json();
    const pets = data.pet;

    if (!Array.isArray(pets)) throw new Error("A chave 'pet' não contém um array");

    const lastPets = pets.slice(-20);
    container.innerHTML = '';

    const specieMap = { 'G': 'Gato', 'C': 'Cachorro' };
    const sizeMap = { 'P': 'Pequeno', 'M': 'Médio', 'G': 'Grande' };
    const sexMap = { 'M': 'Macho', 'F': 'Fêmea' };

    lastPets.forEach(pet => {
      const specie = specieMap[pet.specie] || 'Desconhecido';
      const size = sizeMap[pet.size] || 'Desconhecido';
      const sex = sexMap[pet.sex] || 'Desconhecido';
      const avatar = pet.avatar ? pet.avatar.split('\\').pop() : null;
      const imagePath = avatar ? `images/${avatar}` : 'imgs/pet-placeholder.jpg';

      const card = document.createElement('div');
      card.className = 'col-md-4 col-lg-3';
      card.innerHTML = `
        <div class="card h-100 shadow-sm" style="cursor: pointer;">
          <img src="${imagePath}" class="card-img-top" alt="${pet.name}" />
          <div class="card-body">
            <h5 class="card-title">${pet.name}</h5>
            <p class="card-text text-muted">${specie} • ${sex} • ${pet.age} anos • ${size}</p>
            <p class="card-text">${pet.description || ''}</p>
          </div>
          <div class="card-footer text-muted text-center">
            ${pet.city_id}, ${pet.state_id}
            <br />
            <button class="btn btn-sm btn-success mt-2 btn-adotar">Adotar</button>
          </div>
        </div>
      `;

      card.querySelector('.btn-adotar').addEventListener('click', (e) => {
        e.stopPropagation();
        const token = localStorage.getItem("token");
        if (isTokenValid(token)) {
          localStorage.setItem("petSelecionado", JSON.stringify(pet));
          window.location.href = 'quer_adotar.html';
        } else {
          alert("Sessão expirada. Faça login novamente.");
          window.location.href = 'login.html';
        }
      });

      container.appendChild(card);
    });

  } catch (error) {
    console.error('Erro ao carregar pets:', error);
    container.innerHTML = '<p class="text-danger">Erro ao carregar os pets. Tente novamente mais tarde.</p>';
  }
}

// ==========================
// 2. Menu "Quero Adotar"
// ==========================
function configurarMenuAdotar() {
  const botao = document.querySelector('#menu-quer-adotar');
  if (botao) {
    botao.addEventListener('click', (e) => {
      e.preventDefault();
      const token = localStorage.getItem('token');
      if (isTokenValid(token)) {
        window.location.href = 'quer_adotar.html';
      } else {
        alert("Seu token expirou, faça login novamente.");
        window.location.href = 'login.html';
      }
    });
  }
}

// ==========================
// 3. Menu "Cadastrar Pet"
// ==========================
function configurarMenuCadastrarPet() {
  const botao = document.querySelector('#menu-cadastrar-pet');
  if (botao) {
    botao.addEventListener('click', (e) => {
      e.preventDefault();
      const token = localStorage.getItem('token');
      if (isTokenValid(token)) {
        window.location.href = 'quer_divulgar.html';
      } else {
        alert("Sessão expirada. Faça login novamente.");
        window.location.href = 'login.html';
      }
    });
  }
}

// ==========================
// 4. Carrossel de Notícias
// ==========================
function carregarNoticias() {
  const noticias = [
    {
      titulo: "Projeto na Alece prevê microchips para identificar cães e gatos e mutirões de castração",
      descricao: "Inicialmente, programa será voltado para animais em situação de rua ou sob tutela de pessoas em vulnerabilidade social.",
      imagem: "images/cadastro.jpg",
      link: "https://diariodonordeste.verdesmares.com.br/pontopoder/projeto-na-alece-preve-microchips-para-identificar-caes-e-gatos-e-mutiroes-de-castracao-1.3646111/"
    },
    {
      titulo: "Secretaria de Saúde de Jaguaruana promove Dia D Antirrábica dos Pets",
      descricao: "Vacinação em diversos pontos por toda a cidade. Veja como foi este dia.",
      imagem: "images/buceta-marrom-apos-cirurgia-injecao-para-um-animal-veterinario-de-luvas-com-uma-injecao (1).jpg",
      link: "https://www.jaguaruana.ce.gov.br/informa/3293/secretaria-de-sa-de-da-prefeitura-de-jaguaruana-pr"
    },
    {
      titulo: "Pet Móvel Ceará",
      descricao: "Pet Móvel Ceará realizou 1.000 castrações em poucos dias de funcionamento!",
      imagem: "images/Pet-Ceara-Movel-696x464.jpeg",
      link: "https://oestadoce.com.br/ceara/pet-movel-ceara-realizou-1-000-castracoes-em-poucos-dias-de-funcionamento/"
    },
    {
      titulo: "Sana 2025",
      descricao: "59 cães e gatos adotados no Maior Evento de Adoção do Ceará!",
      imagem: "images/pet-696x435.png",
      link: "https://www.ceara.gov.br/2025/02/25/22-animais-foram-adotados-na-i-feira-de-adocao-de-animais-da-arena-castelao/"
    }
  ];

  const carouselInner = document.getElementById('carousel-news');

  noticias.forEach((noticia, index) => {
    const itemDiv = document.createElement('div');
    itemDiv.className = 'carousel-item' + (index === 0 ? ' active' : '');

    itemDiv.innerHTML = `
      <img src="${noticia.imagem}" class="d-block w-100" alt="${noticia.titulo}" style="max-height: 600px; object-fit: cover;" />
      <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-3">
        <h5>${noticia.titulo}</h5>
        <p>${noticia.descricao}</p>
        <a href="${noticia.link}" target="_blank" class="btn btn-primary mt-2">Saiba mais</a>
      </div>
    `;

    carouselInner.appendChild(itemDiv);
  });
}

// ==========================
// 5. Listar Pets Adotados
// ==========================
async function carregarPetsAdotados() {
  const container = document.getElementById('adoptedPetsList');

  try {
    const response = await fetch('http://localhost:8080/pet?adotado=true');
    if (!response.ok) throw new Error('Erro ao buscar pets adotados');

    const pets = await response.json();

    if (!Array.isArray(pets) || pets.length === 0) {
      container.innerHTML = '<p class="text-muted">Nenhum pet adotado no momento.</p>';
      return;
    }

    const specieMap = { 'G': 'Gato', 'C': 'Cachorro' };
    const sizeMap = { 'P': 'Pequeno', 'M': 'Médio', 'G': 'Grande' };
    const sexMap = { 'M': 'Macho', 'F': 'Fêmea' };

    container.innerHTML = '';

  pets.forEach((pet, index) => {
      const specie = specieMap[pet.specie] || 'Desconhecido';
      const size = sizeMap[pet.size] || 'Desconhecido';
      const sex = sexMap[pet.sex] || 'Desconhecido';
      const avatar = pet.avatar ? pet.avatar.split('\\').pop() : null;
      const imagePath = avatar ? `images/${avatar}` : 'imgs/pet-placeholder.jpg';

    const card = document.createElement('div');
card.className = 'col-6 col-sm-4 col-md-3 col-lg-2 d-flex';
card.innerHTML = `
  <div class="card h-100 shadow-sm w-100">
    <img src="${imagePath}" class="card-img-top" alt="${pet.name}" />
    <div class="card-body">
      <h5 class="card-title">${pet.name}</h5>
      <p class="card-text text-muted">${specie} • ${sex} • ${pet.age} anos • ${size}</p>
      <p class="card-text">${pet.description || ''}</p>
    </div>
    <div class="card-footer text-muted text-center">
      ${pet.city_id}, ${pet.state_id}
      <br />
      <button class="btn btn-sm btn-danger" disabled>Adotado</button>
    </div>
  </div>

      `;
      card.style.animationDelay = `${index * 0.15}s`; // delay crescente pra animação
  container.appendChild(card);
});
      

  } catch (error) {
    console.error('Erro ao carregar pets adotados:', error);
    container.innerHTML = `<p class="text-danger">Erro ao carregar pets adotados: ${error.message}</p>`;
  }
}