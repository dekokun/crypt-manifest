import * as util from "util";
import * as child_process from "child_process";
import * as fs from "fs";

const execPromise = util.promisify(child_process.exec);

jest.setTimeout(10 * 1000)
describe('snapshot test for k8s manifest', () =>{
    const baseDir = "./charts"
    const chartDirs = fs.readdirSync(`${baseDir}`);
    chartDirs.map(systemDir => {
        const target = `${baseDir}/${systemDir}`
        test(target, async () => {
            await execPromise(`helm dep update ${target}`);
          const {stdout} = await execPromise(`helm template ${target}`);
          expect(stdout).toMatchSnapshot();
        });
    });
})

