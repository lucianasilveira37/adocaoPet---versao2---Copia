const PasswordRepository = require('../repositories/PasswordRepository');
const PasswordService = require('../../services/PasswordService');
const database = require('../../frameworks/PgDatabase');

const passwordRepository = new PasswordRepository(database); // ✅
const passwordService = new PasswordService(passwordRepository); // ✅

const PasswordController = {
  async requestReset(req, res) {
    try {
      const { email } = req.body;
      await passwordService.requestPasswordReset(email);
      res.status(200).json({ message: "Email de recuperação enviado" });
    } catch (err) {
      res.status(400).json({ error: err.message });
    }
  },

  async resetPassword(req, res) {
    try {
      const { token, password } = req.body;
      await passwordService.resetPassword(token, password);
      res.status(200).json({ message: "Senha redefinida com sucesso" });
    } catch (err) {
      res.status(400).json({ error: err.message });
    }
  }
};

module.exports = PasswordController;
