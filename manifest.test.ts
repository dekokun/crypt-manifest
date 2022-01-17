import * as util from "util";
import * as child_process from "child_process";
import * as fs from "fs";

const execPromise = util.promisify(child_process.exec);

describe('snapshot test for k8s manifest', () =>{
    const baseDir = "./charts"
    const chartDirs = fs.readdirSync(`${baseDir}`);
    chartDirs.map(systemDir => {
        const target = `${baseDir}/${systemDir}`
        test(target, async () => {
          const {stdout} = await execPromise(`helm template ${target}`);
          expect(stdout).toMatchSnapshot();
        });
    });
})

