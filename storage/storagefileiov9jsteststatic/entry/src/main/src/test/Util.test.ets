/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
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
      hilog.info(domain, tag, '%{public}s', 'fw001context' + context);
      let data = context.filesDir;
      hilog.info(domain, tag, '%{public}s', 'fw001context.filesDir' + context.filesDir);
      let BASE_PATH = data + '/';
      hilog.info(domain, tag, '%{public}s', 'fw001BASE_PATH' + BASE_PATH);
      resolve(BASE_PATH + testName);
    })
  }

  static async prepareFile(fpath: string, content: string) : Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE)
        fs.truncateSync(file.fd)
        fs.writeSync(file.fd, content)
        fs.fsyncSync(file.fd)
        fs.closeSync(file)
        resolve(true);
      }
      catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'prepareFile has failed for' + JSON.stringify(e));
        resolve(false);
      }
    })
  }

  static async prepare200MFile(fpath: string) : Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        fs.truncateSync(file.fd);
        let bf = new ArrayBuffer(1024 * 1024 * 5);
        for (let i = 0; i < 4; i++) {
          let offset = bf.byteLength * i;
          fs.writeSync(file.fd, bf, { offset: offset, length: bf.byteLength, encoding: 'utf-8' });
        }
        fs.fsyncSync(file.fd)
        fs.closeSync(file)
        resolve(true);
      }
      catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'prepare200MFile has failed for' + JSON.stringify(e));
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

  static async isBigInt(val:BigInt) : Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      if (typeof val === 'bigint') {
        resolve(true);
      } else {
        resolve(false);
      }
    })
  }

  static async randomString(num:int) : Promise<string> {
    return new Promise<string>((resolve, reject) => {
      let len = num;
      let chars = 'aaaabbbbcccc';
      let maxPos = chars.length;
      let pwd = '';
      for (let i = 0; i < len; i++) {
        pwd += chars.charAt((Math.floor(Math.random() * maxPos)) as int);
      }
      resolve(pwd);
    })
  }

}