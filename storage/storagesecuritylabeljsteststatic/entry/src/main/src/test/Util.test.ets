import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default class Utils{

  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async nextFileName(testName: string) : Promise<string> {
    return new Promise<string>((resolve, reject) => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let data = context.filesDir;
      let BASE_PATH = data + '/';
      resolve(BASE_PATH + testName);
    })
  }

  static async prepareFile(fpath: string, content: string) : Promise<boolean> {
    hilog.info(domain, tag, '%{public}s', 'content: ' + content);
    return new Promise<boolean>((resolve, reject) => {
      try {
        let file = fs.openSync(fpath, 0o102)
        fs.truncateSync(file.fd)
        fs.writeSync(file.fd, content)
        fs.fsyncSync(file.fd)
        fs.closeSync(file)
        resolve(true);
      }
      catch (e) {
        hilog.info(domain, tag, '%{public}s', 'content has failed for' + JSON.stringify(e));
        resolve(false);
      }
    })
  }

  static async isIntNum(val:double) : Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      if (typeof val === 'number' && val % 1 === 0) {
        resolve(true);
      } else {
        resolve(false);
      }
    })
  }

}