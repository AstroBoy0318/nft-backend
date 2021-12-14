module.exports = (sequelize, Sequelize) => {
    const Categories = sequelize.define("categories", {
      name: {
        type: Sequelize.STRING
      },
      createdAt: {
        type: Sequelize.DATE
      },
      updatedAt: {
        type: Sequelize.DATE
      }
    });
    return Categories;
  };
