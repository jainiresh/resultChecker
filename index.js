const express = require('express');

const app = express();


const { exec } = require('child_process');


const runScript = () => {

console.log("Running the script !")
exec('bash devResultChecker.sh', (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error.message}`);
      return;
    }
    if (stderr) {
      console.error(`Stderr: ${stderr}`);
      return;
    }
    console.log(`Stdout: ${stdout}`);
  });
}

runScript();
setInterval(runScript, 300000 );

app.listen(3000, () => {
    console.log(`Server listening on port ${3000}`)
})