const bcryptjs = require("bcryptjs");
const jwt = require('jsonwebtoken'); // Adicionando a importação do JWT

const User = require("../entities/User");

class UserService {
  constructor(userRepository) {
    this.userRepository = userRepository;
  }

  async getAllUsers() {
    return await this.userRepository.getAllUsers();
  }

  async registerUser(data) {
    console.log(data);

    const cryptPassword = await bcryptjs.hash(data.password, 10);
    const user = new User(data.nome, data.email, data.whatsapp, cryptPassword, data.entrou_com_facebook, data.entrou_com_google, data.quer_divulgar, data.quer_adotar, data.criado_em);

    return await this.userRepository.registerUser(user);
  }



   async authenticateUser(dataLogin) {
    // Buscar o usuário pelo e-mail
    const user = await this.userRepository.getUserByEmail(dataLogin.email);

    // Verificar se o usuário existe
    if (!user) {
      return { error: "User not found", code: 404 };
    }

    // Comparar a senha fornecida com a senha armazenada
    const correctPassword = await bcryptjs.compare(dataLogin.password, user.password);

    // Se as senhas não coincidirem
    if (!correctPassword) {
      return { error: "Invalid Credentials", code: 401 };
    }

    // Gerar um token JWT
    const token = this.generateAuthToken(user);  // Função que cria o token

    // Retornar o usuário junto com o token gerado
    return { user, token };
  }

  // Função para gerar o token JWT
  generateAuthToken(user) {
    const payload = {
      id: user.id,
      email: user.email,
    };

    // Aqui, 'secret' é o segredo para assinar o token. Nunca deve ser hardcoded em produção, deve vir de um arquivo .env
    const secret = process.env.JWT_SECRET || 'seu-segredo';

    const options = {
      expiresIn: '1h', // O token expira em 1 hora
    };

    return jwt.sign(payload, secret, options);
  }
  async deleteUser(id) {
    try {
      return await this.userRepository.deleteUser(id);
    } catch (error) {
      return { error: error.message };
    }
  }
 async updateUser(id, data) {
    try {
      return await this.userRepository.updateUser(id, data);
    } catch (error) {
      return { error: error.message };
    }
  }

 async getUserWithAllData(id) {
    const user = await this.userRepository.findById(id);
    if (!user) return null;

    const posts = await this.userRepository.findPostsByUserId(id);
    const settings = await this.userRepository.findSettingsByUserId(id);

    return {
      ...user,
      posts,
      settings
    };
  }
}





module.exports = UserService;
