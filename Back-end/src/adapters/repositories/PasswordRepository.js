class PasswordRepository {
  constructor(database) {
    this.database = database;
  }

  async findByEmail(email) {
    const result = await this.database.query('SELECT * FROM users WHERE email = $1', [email]);
    return result.rows[0];
  }

  async findByResetToken(token) {
    const now = new Date();
    const result = await this.database.query(
      `SELECT * FROM users WHERE reset_token = $1 AND reset_token_expires > $2`,
      [token, now]
    );
    return result.rows[0];
  }

  async updateUser(user) {
    const query = `
      UPDATE users SET
        password = $1,
        reset_token = $2,
        reset_token_expires = $3
      WHERE id = $4
    `;
    await this.database.query(query, [
      user.password,
      user.reset_token,
      user.reset_token_expires,
      user.id,
    ]);
  }
}

module.exports = PasswordRepository;
