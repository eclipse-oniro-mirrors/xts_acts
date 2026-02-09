/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import { ChildProcessArgs } from '@ohos.app.ability.ChildProcessArgs';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { ChildProcessOptions } from '@ohos.app.ability.ChildProcessOptions';
import testNapi from 'libentry.so';
import util from '@ohos.util';
import { BusinessError } from '@kit.BasicServicesKit';
export default function nativeProcessTest() {
  describe('StartNativeChildProcessTest', () => {
    let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    let pid = 0;
    let mpEnable: Boolean = false;

    beforeAll(() => {
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model') === 'true';
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = false;
      }
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      if (pid > 0) {
        console.log(`afterEach() kill pid: ${pid}`)
        await abilityDelegator.executeShellCommand(`kill -9 ${pid}`);
        pid = 0;
        await sleep(500);
      }
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_0100
     * @tc.desc   Expect: 1.Return child pid 2.read Result: 'SUCC'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `StartNativeChildProcess_0100`;
      console.log(`${tag} it begin`);
      let path = abilityDelegator.getAppContext().filesDir + "/test.txt";
      let fileContent = 'test';
      writeFile(path, fileContent);
      console.log(`${tag} write file end`);
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      try {
        let args: ChildProcessArgs = {
          entryParams: 'testEntryParams',
          fds: {
            'fd1': file.fd
          }
        };
        let options: ChildProcessOptions = {
          isolationMode: false
        };

        await sleep(500);
        console.log(`${tag} startNativeChildProcess before,fd1:${file.fd}, isolation:${options.isolationMode}`);
        pid = await childProcessManager.startNativeChildProcess("libentry.so:Main", args, options);
        console.log(`${tag} StartNativeChildProcess success, pid: ${pid}`);
        fs.closeSync(file.fd);
        expect(pid > 0).assertTrue();
        await sleep(3000);
        let result = readFile(path);
        expect(result).assertEqual('SUCC');
        done();
      } catch (err) {
        fs.closeSync(file.fd);
        console.error(`${tag} StartNativeChildProcess error, errorCode: ${err.code}`);
        if (!mpEnable && err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_0200
     * @tc.desc   Expect: 1.Return child pid 2.read Result: 'SUCC'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_0200', Level.LEVEL0, async (done: Function) => {
      let tag = `StartNativeChildProcess_0200`;
      console.log(`${tag} it begin`);
      let path = abilityDelegator.getAppContext().filesDir + "/test.txt";
      let fileContent = 'test';
      writeFile(path, fileContent);
      console.log(`${tag} write file end`);
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      try {
        let args: ChildProcessArgs = {
          entryParams: 'testEntryParams',
          fds: {
            'fd1': file.fd
          }
        };
        let options: ChildProcessOptions = {
          isolationMode: true
        };

        await sleep(500);
        console.log(`${tag} startNativeChildProcess before,fd1:${file.fd}, isolation:${options.isolationMode}`);
        pid = await childProcessManager.startNativeChildProcess("libentry.so:Main", args, options);
        console.log(`${tag} StartNativeChildProcess success, pid: ${pid}`);
        fs.closeSync(file.fd);
        expect(pid > 0).assertTrue();
        await sleep(3000);
        let result = readFile(path);
        expect(result).assertEqual('SUCC');
        done();
      } catch (err) {
        fs.closeSync(file.fd);
        console.error(`${tag} StartNativeChildProcess error, errorCode: ${err.code}`);
        if (!mpEnable && err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_0300
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_0300
     * @tc.desc   Expect: 1.Return child pid 2.read Result: 'SUCC'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_0300', Level.LEVEL0, async (done: Function) => {
      let tag = `StartNativeChildProcess_0300`;
      console.log(`${tag} it begin`);
      try {
        let args: ChildProcessArgs = {};
        let options: ChildProcessOptions = {
          isolationMode: true
        };

        await sleep(500);
        console.log(`${tag} startNativeChildProcess before,emtry args, isolation:${options.isolationMode}`);
        pid = await childProcessManager.startNativeChildProcess("libentry.so:Main", args, options);
        console.log(`${tag} StartNativeChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();
        await sleep(3000);
        done();
      } catch (err) {
        console.error(`${tag} StartNativeChildProcess error, errorCode: ${err.code}`);
        if (!mpEnable && err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_0400
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_0400
     * @tc.desc   Expect: 1.Return ret = 0 2.read Result: 'SUCC'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_0400', Level.LEVEL0, async (done: Function) => {
      let tag = `StartNativeChildProcess_0400`;
      try {
        console.log(`${tag} startNativeChildProcess before`);
        let ret = testNapi.startChildIsolated();
        console.log(`${tag} startNativeChildProcess ret:${ret}, mpEnable:${mpEnable}`);
        if (ret == 0) {
          await sleep(3000);
          let path = abilityDelegator.getAppContext().filesDir + "/test.txt";
          let result = readFile(path);
          expect(result).assertEqual('SUCC');
          done();
        } else if (!mpEnable && ret == 16010004) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.error(`${tag} StartNativeChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_0500
     * @tc.desc   Expect: 1.Return ret = 0 2.read Result: 'SUCC'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_0500', Level.LEVEL0, async (done: Function) => {
      let tag = `StartNativeChildProcess_0500`;
      try {
        console.log(`${tag} startNativeChildProcess before`);
        let ret = testNapi.startChildIsolated();
        console.log(`${tag} startNativeChildProcess ret:${ret}`);
        if (ret == 0) {
          await sleep(3000);
          let path = abilityDelegator.getAppContext().filesDir + "/test.txt";
          let result = readFile(path);
          expect(result).assertEqual('SUCC');
          done();
        } else if (!mpEnable && ret == 16010004) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.error(`${tag} StartNativeChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_0600
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_0600
     * @tc.desc   Expect: 1.Return ret = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_0600', Level.LEVEL0, async (done: Function) => {
      let tag = `StartNativeChildProcess_0600`;
      try {
        console.log(`${tag} startNativeChildProcess before`);
        let ret = testNapi.startChildNoArgs();
        console.log(`${tag} startNativeChildProcess ret:${ret}`);
        await sleep(1000);
        if (ret == 0) {
          done();
        } else if (!mpEnable && ret == 16010004) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.error(`${tag} StartNativeChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_0700
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_0700
     * @tc.desc   Expect: 1.Return child pid 2.read Result: 'SUCC'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_0700', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartNativeChildProcess_0700`;
      console.log(`${tag} it begin`);
      try {
        childProcessManager.startNativeChildProcess("libentry.so:Main", null)
          .then((pid) => {
            console.info(`SUB_Ability_AbilityRuntime_StartNativeChildProcess_0700 success, pid: ${pid}`);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`SUB_Ability_AbilityRuntime_StartNativeChildProcess_0700 business error, errorCode: ${err.code}, errorMsg:${err.message}`);
            expect(err.code).assertEqual(401);
            done();
          })
      } catch (err) {
        console.error(`SUB_Ability_AbilityRuntime_StartNativeChildProcess_0700 error, errorCode: ${err.code}, errorMsg:${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });
  });
}

function writeFile(path: string, text: string) {
  let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
  fs.writeSync(file.fd, text);
  fs.closeSync(file);
}

function readFile(path: string): string {
  let file = fs.openSync(path, fs.OpenMode.READ_ONLY);
  let buf = new ArrayBuffer(4);
  fs.readSync(file.fd, buf);
  let decoder = util.TextDecoder.create('utf-8');
  let str = decoder.decodeWithStream(new Uint8Array(buf));
  fs.closeSync(file.fd);
  return str;
}

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time);
  });
}