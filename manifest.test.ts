import * as util from "util";
import * as child_process from "child_process";
import * as fs from "fs";

const execPromise = util.promisify(child_process.exec);

jest.setTimeout(10 * 1000)
describe('snapshot test for k8s manifest', () =>{
    const baseDir = "./charts"
    const chartDirs = fs.readdirSync(`${baseDir}`);
    chartDirs.map(dir => {
        const target = `${baseDir}/${dir}`
        test(target, async () => {
            await execPromise(`helm dep update ${target}`);
          const {stdout} = await execPromise(`helm template ${target} --name-template=${dir}-snapshot-test -n default`);
          expect(stdout).toMatchSnapshot();
        });
    });
})

