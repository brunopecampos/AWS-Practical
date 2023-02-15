const express = require("express");
const cors = require("cors");
const app = express();
const port = 4000;

app.use(cors());
const mysql = require("./db_access");

app.get("/get-salary", async (req, res) => {
  console.log("getSalary()");
  a = await mysql.getSalary(1);
  db_res = a[0].raise_percent;
  console.log(db_res);
  currentPercentIndex = increasePercents.indexOf(db_res);
  res.send(db_res.toString());
});

increasePercents = [0.5, 1.0, 2.0, 5.0, 20.0, 100.0, 11273632.0];
currentPercentIndex = 0;
app.get("/increase-salary", async (req, res) => {
  currentPercentIndex++;
  if (currentPercentIndex == 7) currentPercentIndex = 0;
  newSal = increasePercents[currentPercentIndex].toFixed(1).toString();
  console.log("increaseSalary: " + newSal);
  a = await mysql.increaseSalary(1, newSal);
  console.log("OK");
  res.send("OK");
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

process.on("exit", () => {
  console.log("Closing MySQL connection...");
  mysql.closeDbConnection();
});
