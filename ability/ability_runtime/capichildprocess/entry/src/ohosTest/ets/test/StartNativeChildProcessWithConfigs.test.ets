/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
export default function startNativeChildProcessWithConfigsTest() {
  describe('ActsCapiStartNativeChildProcessWithConfigsTest', () => {
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
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0100
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0100
     * @tc.desc   Call SetIsolation to set ChildProcessConfigs IsolationMode, set the value of configs nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_0100`;
      console.log(`${tag} it begin`);
      try {
        let ret = testNapi.SetIsolationModeConfigsNullptr();
        expect(401).assertEqual(ret);
        await sleep(3000);
        done();
      } catch (err) {
        console.error(`${tag} SetIsolationModeConfigsNullptr error, errorCode: ${err.code}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0200
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0200
     * @tc.desc   Call SetProcessName to set ChildProcessConfigs process name, set the value of configs nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0200', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_0200`;
      console.log(`${tag} it begin`);
      try {
        let ret = testNapi.SetProcessNameConfigsNullptr();
        expect(401).assertEqual(ret);
        await sleep(3000);
        done();
      } catch (err) {
        console.error(`${tag} SetProcessNameConfigsNullptr error, errorCode: ${err.code}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0300
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0300
     * @tc.desc   Call SetProcessName to set ChildProcessConfigs process name, set the value of process name null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0300', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_0300`;
      console.log(`${tag} it begin`);
      try {
        let ret = testNapi.SetProcessName("");
        expect(401).assertEqual(ret);
        await sleep(3000);
        done();
      } catch (err) {
        console.error(`${tag} SetProcessName error, errorCode: ${err.code}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0400
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0400
     * @tc.desc   Call SetProcessName to set ChildProcessConfigs process name, set the length of process name exceeds 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0400', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_0400`;
      console.log(`${tag} it begin`);
      try {
        let ret = testNapi.SetProcessName("1231fdafqw131fafq2fagfag23KJHKHH68dafagf\
                                            123143hnkfhakdafafafaffHJLKJHFALJFLA");
        expect(401).assertEqual(ret);
        await sleep(3000);
        done();
      } catch (err) {
        console.error(`${tag} SetProcessName error, errorCode: ${err.code}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0500
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0500
     * @tc.desc   Call SetProcessName to set ChildProcessConfigs process name, set the value of process name "abc_123".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0500', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_0500`;
      console.log(`${tag} it begin`);
      try {
        let ret = testNapi.SetProcessName("abc_123");
        expect(0).assertEqual(ret);
        await sleep(3000);
        done();
      } catch (err) {
        console.error(`${tag} SetProcessName error, errorCode: ${err.code}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0600
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0600
     * @tc.desc   Call SetProcessName to set ChildProcessConfigs process name, the value of process name contains special characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0600', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_0600`;
      console.log(`${tag} it begin`);
      try {
        let ret = testNapi.SetProcessName("abc_123([]");
        expect(401).assertEqual(ret);
        await sleep(3000);
        done();
      } catch (err) {
        console.error(`${tag} SetProcessName error, errorCode: ${err.code}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0700
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0700
     * @tc.desc   Call DestroyChildProcessConfigs to destroy ChildProcessConfigs, the value of configs is correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0700', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_0700`;
      console.log(`${tag} it begin`);
      try {
        let ret = testNapi.DestroyChildProcessConfigs();
        expect(0).assertEqual(ret);
        await sleep(3000);
        done();
      } catch (err) {
        console.error(`${tag} DestroyChildProcessConfigs error, errorCode: ${err.code}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0800
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0800
     * @tc.desc   Call DestroyChildProcessConfigs to destroy ChildProcessConfigs, the value of configs is nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0800', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_0800`;
      console.log(`${tag} it begin`);
      try {
        let ret = testNapi.DestroyChildProcessConfigsNullptr();
        expect(401).assertEqual(ret);
        await sleep(3000);
        done();
      } catch (err) {
        console.error(`${tag} DestroyChildProcessConfigs error, errorCode: ${err.code}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0900
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0900
     * @tc.desc   Call StartNativeChildProcessWithConfigs to create a child process, give correct args and configs and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_0900', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_0900`;
      console.log(`${tag} it begin`);
      let path = "/data/storage/el2/base/haps/entry/files/test0.txt";
      try {
        let pid = -1;
        pid = testNapi.StartNativeChildProcessWithConfigsEntryNull();
        console.log(`${tag} StartNativeChildProcess success, pid: ${pid}`);
        if(pid == 801 || pid == 16010004){
          done();
        }else{
          expect(401).assertEqual(pid);
          done();
        }
      } catch (err) {
        console.error(`${tag} StartNativeChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1000
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1000
     * @tc.desc   Call StartNativeChildProcess to create a child process, give correct args and configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1000', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_1000`;
      console.log(`${tag} it begin`);
      let path = "/data/storage/el2/base/haps/entry/files/test0.txt";
      try {
        let pid = -1;
        pid = testNapi.StartNativeChildProcessWithConfigs("libnoexisted.so:Main");
        console.log(`${tag} StartNativeChildProcess success, pid: ${pid}`);
        if(pid == 801 || pid == 16010004){
          done();
        }else{
          expect(pid > 0).assertTrue();
          done();
        }
      } catch (err) {
        console.error(`${tag} StartNativeChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1100
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1100
     * @tc.desc   Call StartNativeChildProcess to create a child process, give correct args and configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1100', Level.LEVEL0, async (done: Function) => {
      let tag = `NativeChildProcessWithConfigs_1100`;
      console.log(`${tag} it begin`);
      let path = "/data/storage/el2/base/haps/entry/files/test0.txt";
      try {
        let pid = -1;
        pid = testNapi.StartNativeChildProcessWithConfigs("libentry.so:notexisted");
        console.log(`${tag} StartNativeChildProcess success, pid: ${pid}`);
        if(pid == 801 || pid == 16010004){
          done();
        }else{
          expect(pid > 0).assertTrue();
          done();
        }
      } catch (err) {
        console.error(`${tag} StartNativeChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KillChildProcess_0100
     * @tc.number SUB_Ability_AbilityRuntime_KillChildProcess_0100
     * @tc.desc   Call KillChildProcess to kill a child process, give a valid pid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KillChildProcess_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `KillChildProcess_0100`;
      console.log(`${tag} it begin`);
      let path = "/data/storage/el2/base/haps/entry/files/test0.txt";
      let pid = -1;
      try {
        pid = testNapi.StartNativeChildProcessWithConfigs("libentry.so:MainLoop");
        console.log(`${tag} StartNativeChildProcess success, pid: ${pid}`);
        if(pid == 801 || pid == 16010004){
          done();
          return;
        }else{
          expect(pid > 0).assertTrue();
        }
      } catch (err) {
        console.error(`${tag} StartNativeChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }

      try {
        let ret: Number = testNapi.KillChildProcessWithPid(pid);
        console.log(`${tag} KillChildProcessWithValidPid , ret: ${ret}`);
        expect(0).assertEqual(ret);
        done();
      } catch (err) {
        console.error(`${tag} KillChildProcessWithValidPid error, errorCode: ${err.code}`);
        expect().assertFail();
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