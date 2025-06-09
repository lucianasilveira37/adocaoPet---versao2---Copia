class WhatsappRepository {
  constructor(database) {
    this.database = database;
  }
 async findTutorPhoneByPetId(petId) {
    try {
      const query = `SELECT tutor_id FROM pet WHERE id = $1`;
      const result = await this.database.query(query, [petId]);
      return result.rows[0]; // { tutor_id: '5511998765432' } ou undefined
    } catch (error) {
      throw new Error(error.message);
    }
  }
}

module.exports = WhatsappRepository;