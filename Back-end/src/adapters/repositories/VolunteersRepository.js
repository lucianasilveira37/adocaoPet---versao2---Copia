class VolunteersRepository {
  constructor(database) {
    this.database = database;
  }

  async getAllVolunteers() {
    try {
      const query = "SELECT * FROM volunteers ORDER BY created_at DESC";
      const result = await this.database.query(query);
      return result.rows;
    } catch (error) {
      return { error: error.message };
    }
  }

  async registerVolunteers(volunteer) {
    try {
      const data = [volunteer.name, volunteer.email, volunteer.role];
      const query = `
        INSERT INTO volunteers (name, email, role)
        VALUES ($1, $2, $3)
        RETURNING *;
      `;
      const result = await this.database.query(query, data);
      return result.rows[0]; // Retorna o objeto inserido diretamente
    } catch (error) {
      return { error: error.message };
    }
  }

 

//admin
 async updateVolunteers(id, { name, email }) {
  const query = `
    UPDATE volunteers 
    SET name = $1, email = $2 
    WHERE id = $3 
    RETURNING *;
  `;
  const result = await this.database.query(query, [name, email, id]);
  return result.rows[0];
}
//admin
async deleteVolunteers(id) {
    const query = 'DELETE FROM volunteers WHERE id = $1';
   const result = await this.database.query(query, [id]);
    return { success: true };
  }
  // Busca um usuário pelo ID
  async findById(id) {
  try {
    const query = 'SELECT * FROM volunteers WHERE id = $1';
    const result = await this.database.query(query, [id]);
    return result.rows[0]; // retorna o objeto do usuário
  } catch (error) {
    return null; // ou lançar erro para tratamento
  }
}
  
}




module.exports = VolunteersRepository;
