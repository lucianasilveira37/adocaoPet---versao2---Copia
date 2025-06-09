const bcrypt = require("bcryptjs");
const { v4: uuidv4 } = require("uuid");

// services/PasswordService.js
class PasswordService {
  constructor(userRepository) {
    this.userRepository = userRepository;
  }

  async requestPasswordReset(email) {
    const user = await this.userRepository.findByEmail(email);
    if (!user) throw new Error("Usuário não encontrado");

    const token = uuidv4();
    user.reset_token = token;
    user.reset_token_expires = new Date(Date.now() + 60 * 60 * 1000); // 1 hora

    await this.userRepository.updateUser(user);

    console.log(
      `Email enviado para ${email} com link: http://localhost:8080/reset?token=${token}`
    );
  }

  async resetPassword(token, newPassword) {
    const user = await this.userRepository.findByResetToken(token);

    if (!user) throw new Error("Token inválido ou expirado");

    const hashedPassword = await bcrypt.hash(newPassword, 10);
    user.password = hashedPassword;
    user.reset_token = null;
    user.reset_token_expires = null;

    await this.userRepository.updateUser(user);
  }
}

module.exports = PasswordService;
