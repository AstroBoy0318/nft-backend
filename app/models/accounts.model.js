module.exports = (sequelize, Sequelize) => {
    const Accounts = sequelize.define("accounts", {
      name: {
        type: Sequelize.STRING
      },
      description: {
        type: Sequelize.STRING
      },
      address: {
        type: Sequelize.STRING
      },
      signature: {
        type: Sequelize.STRING
      },
      avatar: {
        type: Sequelize.STRING
      },
      twitter: {
        type: Sequelize.STRING
      },
      telegram: {
        type: Sequelize.STRING
      },
      instagram: {
        type: Sequelize.STRING
      },
      createdAt: {
        type: Sequelize.DATE
      },
      updatedAt: {
        type: Sequelize.DATE
      }
    });
    return Accounts;
  };
