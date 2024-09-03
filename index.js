const { exec } = require('child_process');


const runScript = () => {

    console.log("Running the script")
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
setInterval(runScript, 300000 )