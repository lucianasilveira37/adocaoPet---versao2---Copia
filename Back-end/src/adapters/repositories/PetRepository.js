class PetRepository {
  constructor(database) {
    this.database = database;
  }

  async registerpet(pet) {
  try {
    const data = [
      pet.name,
      pet.specie,
      pet.sex,
      pet.age,
      pet.size,
      pet.state_id,
      pet.city_id,
      pet.description,
      pet.avatar,
      pet.tutor_id,
      pet.castrated,
      pet.vaccinated,
      pet.vermifugate,
      pet.need_special_care,
      pet.docile,
      pet.aggressive,
      pet.calm,
      pet.playful,
      pet.sociable,
      pet.aloof,
      pet.independent,
      pet.needy,
      pet.friendly_with_house_with_backyard,
      pet.friendly_with_apartment,
      pet.sociability_cats,
      pet.sociability_dogs,
      pet.sociability_children,
      pet.sociability_unknown,
      pet.created_at || new Date()  // usa a data atual se não tiver
    ];

    const query = `
      INSERT INTO pet (
        name, specie, sex, age, size, state_id, city_id, description, avatar, tutor_id,
        castrated, vaccinated, vermifugate, need_special_care,
        docile, aggressive, calm, playful, sociable, aloof, independent, needy,
        friendly_with_house_with_backyard, friendly_with_apartment,
        sociability_cats, sociability_dogs, sociability_children, sociability_unknown,
        created_at
      ) VALUES (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10,
        $11, $12, $13, $14, $15, $16, $17, $18, $19, $20,
        $21, $22, $23, $24, $25, $26, $27, $28, $29
      )
      RETURNING *;
    `;

    const result = await this.database.query(query, data);
    return result.rows[0];
  } catch (error) {
    return { error: error.message };
  }
}


  async getAllPet() {
    try {
      const query = "SELECT * FROM pet";
      const reply = await this.database.query(query);
      return reply.rows;
    } catch (error) {
      return { error: error.message };
    }
  }

 async searchPet(filters) {
  const { name, specie, sex, age, size, adotado } = filters;

  if (adotado === undefined) {
    throw new Error('Campo "adotado" é obrigatório');
  }

  const conditions = [];
  const values = [];

  // Começa pelo filtro obrigatório adotado
  conditions.push(`adotado = $${values.length + 1}`);
  values.push(adotado);

  if (name) {
    conditions.push(`name ILIKE $${values.length + 1}`);
    values.push(`%${name}%`);
  }
  if (specie) {
    conditions.push(`specie = $${values.length + 1}`);
    values.push(specie);
  }
  if (sex) {
    conditions.push(`sex = $${values.length + 1}`);
    values.push(sex);
  }
  if (age) {
    conditions.push(`age = $${values.length + 1}`);
    values.push(age);
  }
  if (size) {
    conditions.push(`size = $${values.length + 1}`);
    values.push(size);
  }

  let query = 'SELECT * FROM pet';
  if (conditions.length > 0) {
    query += ' WHERE ' + conditions.join(' AND ');
  }

  const result = await this.database.query(query, values);
  return result.rows;
}


  async deletePet(id) {
    const query = 'DELETE FROM pet WHERE id = $1 RETURNING *';
    const result = await this.database.query(query, [id]);
    return result.rows[0];
  }

  async updatePet(id, data) {
    const fields = [];
    const values = [];
    let i = 1;

    for (const key in data) {
      fields.push(`${key} = $${i++}`);
      values.push(data[key]);
    }

    const query = `
      UPDATE pet
      SET ${fields.join(', ')}
      WHERE id = $${i}
      RETURNING *;
    `;

    values.push(id);
    const result = await this.database.query(query, values);
    return result.rows[0];
  }
async findById(petId) {
    const query = 'SELECT * FROM pet WHERE id = $1';
    const result = await this.database.query(query, [petId]);
    return result.rows[0];
  }

  async findPostsByPetId(petId) {
    const query = 'SELECT * FROM posts WHERE pet_id = $1';
    const result = await this.database.query(query, [petId]);
    return result.rows;
  }

  async findSettingsByPetId(petId) {
    try {
      const query = 'SELECT * FROM pet_settings WHERE pet_id = $1';
      const result = await this.database.query(query, [petId]);
      return result.rows[0] || {};
    } catch (error) {
      console.error('Erro ao buscar configurações do pet:', error);
      return {};
    }
  }
  async marcarComoAdotado(id) {
    const query = `
      UPDATE pet
      SET adotado = true
      WHERE id = $1
      RETURNING *;
    `;
    const result = await this.database.query(query, [id]);
    return result.rows[0];
  }
  async getPet() {
  try {
    const query = "SELECT * FROM pet WHERE adotado = true";
    const reply = await this.database.query(query);
    return reply.rows;
  } catch (error) {
    return { error: error.message };
  }
}

async getPetByAdotado(adotado) {
  try {
    const query = 'SELECT * FROM pet WHERE adotado = $1';
    const values = [adotado];
    const result = await this.database.query(query, values);
    return result.rows;
  } catch (error) {
    return { error: error.message };
  }
}

}




module.exports = PetRepository;

