const mysql = require("mysql2");
const fs = require("fs");

// create a connection to the MySQL database
const connection = mysql.createConnection({
  // Load Balancer hostname
  host: "172.17.0.2",
  user: "root",
  password: "admin",
});

const initScript = fs.readFileSync("init_db.sql").toString();

connection.query("CREATE DATABASE IF NOT EXISTS opus_db", (error, results, fields) => {
  if (error) throw error;
  console.log("Database created or already exists");
  connection.config.database = "opus_db";
  connection.changeUser({ database: "opus_db" }, (error) => {
    if (error) throw error;
    console.log("Database changed to opus_db");
    connection.connect();
    console.log("Connected to database");
    connection.query(
      "CREATE TABLE IF NOT EXISTS salary (id INT NOT NULL AUTO_INCREMENT, raise_percent FLOAT NOT NULL, PRIMARY KEY (id));"
    );
    connection.query(
      "INSERT INTO salary (raise_percent) SELECT (0.5) WHERE NOT EXISTS (SELECT * FROM salary WHERE id = 1);"
    );

    console.log("Table created or already exists");
  });
});

const increaseSalary = (id, raisePercent) => {
  const query = `UPDATE salary SET raise_percent = ${raisePercent} WHERE id = ${id}`;

  return new Promise((resolve, reject) => {
    connection.query(query, (error, results, fields) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    });
  });
};

const getSalary = (id) => {
  const query = `SELECT raise_percent FROM salary WHERE id = ${mysql.escape(id)}`;

  return new Promise((resolve, reject) => {
    connection.query(query, (error, results, fields) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    });
  });
};

const closeDbConnection = () => {
  connection.end();
};

module.exports = {
  getSalary,
  increaseSalary,
  closeDbConnection,
};
