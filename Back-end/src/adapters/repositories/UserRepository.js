class UserRepository {
  constructor(database) {
    this.database = database;
  }

  async getAllUsers() {
    try {
      const query = "SELECT * FROM users";
      const reply = await this.database.query(query);
      return reply.rows;
    } catch (error) {
      return { error: error.message };
    }
  }

  async registerUser(user) {
    try {
      const data = [
        user.nome,
        user.email,
        user.whatsapp,
        user.password,
        user.entrou_com_facebook,
        user.entrou_com_google,
        user.quer_divulgar,
        user.quer_adotar,
        user.criado_em
      ];

      const query = `
        INSERT INTO users (
          nome, email, whatsapp, password,
          entrou_com_facebook, entrou_com_google,
          quer_divulgar, quer_adotar, criado_em,role
        )
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9,'user')
        RETURNING *
      `;

      const reply = await this.database.query(query, data);
      return reply.rows[0]; // retornando apenas o usuário inserido
    } catch (error) {
      return { error: error.message };
    }
  }

  async getUserByEmail(email) {
    try {
      const query = "SELECT * FROM users WHERE email = $1";
      const reply = await this.database.query(query, [email]);
      return reply.rows[0]; // retorna o primeiro (e único) usuário com esse e-mail
    } catch (error) {
      return { error: error.message };
    }
  }
  async updateUser(id, { nome, email }) {
  const query = `
    UPDATE users 
    SET nome = $1, email = $2 
    WHERE id = $3 
    RETURNING *;
  `;
  const result = await this.database.query(query, [nome, email, id]);
  return result.rows[0];
}


async deleteUser(id) {
    try {
      const query = 'DELETE FROM users WHERE id = $1';
      await this.database.query(query, [id]);
      return { success: true };
    } catch (error) {
      return { error: error.message };
    }
  }

 // Busca um usuário pelo ID
  async findById(id) {
    try {
      const query = 'SELECT * FROM users WHERE id = $1';
      const result = await this.database.query(query, [id]);
      return result.rows[0];
    } catch (error) {
      return { error: error.message };
    }
  }

  // Busca posts do usuário
  async findPostsByUserId(userId) {
    try {
      const query = 'SELECT * FROM posts WHERE user_id = $1';
      const result = await this.database.query(query, [userId]);
      return result.rows;
    } catch (error) {
      return { error: error.message };
    }
  }

  // Busca configurações do usuário
  async findSettingsByUserId(userId) {
    try {
      const query = 'SELECT * FROM user_settings WHERE user_id = $1';
      const result = await this.database.query(query, [userId]);
      return result.rows[0] || {};
    } catch (error) {
      return { error: error.message };
    }
  }
  
}










module.exports = UserRepository;
