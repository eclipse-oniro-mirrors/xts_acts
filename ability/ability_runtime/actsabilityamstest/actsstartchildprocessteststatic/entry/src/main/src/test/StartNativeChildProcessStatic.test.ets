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

import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, beforeEach } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import { Driver, ON } from '@ohos.UiTest';
import fs from '@ohos.file.fs';
import { ChildProcessArgs } from '@ohos.app.ability.ChildProcessArgs';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import { ChildProcessOptions } from '@ohos.app.ability.ChildProcessOptions';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator | undefined;
let domain: int = 0x0000;
let tag: string = 'testTag';
const PARAMETER_ERROR_CODE = 401;

export default function StartNativeChildProcessStaticTest() {
  describe('StartNativeChildProcessStaticTest', () => {
    let pid = 0;
    let mpEnable: Boolean = false;
    beforeAll(async() => {
      let driver = Driver.create();
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start1');
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start2');
    })

    afterEach(async () => {
      if (pid > 0) {
        hilog.info(0x0000, tag,`afterEach() kill pid: ${pid}`)
        await abilityDelegator!.executeShellCommand(`kill -9 ${pid}`);
        pid = 0;
        await Utils.msSleep(500);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0100
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0100 begin');

      let path = abilityDelegator!.getAppContext().filesDir + "/test.txt";
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      try {
        let args: ChildProcessArgs = {
          entryParams: 'testEntryParams',
          fds: {
            'fd1': file.fd
          } as Record<string, int>
        };
        let options: ChildProcessOptions = {
          isolationMode: false
        };
        await Utils.msSleep(500)
        hilog.info(0x0000, 'testTag',`startNativeChildProcess before,fd1:${file.fd}, isolation:${options.isolationMode}`);
        pid = await childProcessManager.startNativeChildProcess('', args, options);
        hilog.info(0x0000, 'testTag',`StartNativeChildProcess success, pid: ${pid}`);
        fs.closeSync(file.fd);
        expect().assertFail();
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag',`startNativeChildProcess error, code:${error.code}`);
        if (error.code === 801){
          expect(error.code).assertEqual(801);
          done();
        } else {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          hilog.info(0x0000, 'testTag', '%{public}s',
            'Test passed: startNativeChildProcess returns error 401  when Child process source file path is empty.');
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0200
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0200 begin');

      let path = abilityDelegator!.getAppContext().filesDir + "/test.txt";
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      try {
        let args: ChildProcessArgs = {
          entryParams: 'testEntryParams',
          fds: {
            'fd1': file.fd
          } as Record<string, int>
        };
        let options: ChildProcessOptions = {
          isolationMode: true
        };
        await Utils.msSleep(500)
        hilog.info(0x0000, 'testTag',`startNativeChildProcess before,fd1:${file.fd}, isolation:${options.isolationMode}`);
        pid = await childProcessManager.startNativeChildProcess("libentry.so:Main", args, options);
        hilog.info(0x0000, 'testTag',`StartNativeChildProcess success, pid: ${pid}`);
        fs.closeSync(file.fd);
        expect(pid > 0).assertTrue();
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag',`startNativeChildProcess error, code:${error.code}`);
        if (error.code === 801){
          expect(error.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0300
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0300
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0300 begin');

      let path = abilityDelegator!.getAppContext().filesDir + "/test.txt";
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      try {
        let args: ChildProcessArgs = {}
        let options: ChildProcessOptions = {
          isolationMode: true
        };
        await Utils.msSleep(500)
        hilog.info(0x0000, 'testTag',`startNativeChildProcess before,fd1:${file.fd}, isolation:${options.isolationMode}`);
        pid = await childProcessManager.startNativeChildProcess('', args, options);
        hilog.info(0x0000, 'testTag',`StartNativeChildProcess success, pid: ${pid}`);
        fs.closeSync(file.fd);
        expect().assertFail();
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag',`startNativeChildProcess error, code:${error.code}`);
        if (error.code === 801){
          expect(error.code).assertEqual(801);
          done();
        } else {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          hilog.info(0x0000, 'testTag', '%{public}s',
            'Test passed: startNativeChildProcess returns error 401  when Child process source file path is empty.');
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0400
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0400
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0400 begin');

      let path = abilityDelegator!.getAppContext().filesDir + "/test.txt";
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      try {
        let args: ChildProcessArgs = {
          entryParams: 'testEntryParams',
          fds: {
            'fd1': file.fd
          } as Record<string, int>
        };
        await Utils.msSleep(500)
        hilog.info(0x0000, 'testTag',`startNativeChildProcess before,fd1:${file.fd}`);
        pid = await childProcessManager.startNativeChildProcess('', args);
        hilog.info(0x0000, 'testTag',`StartNativeChildProcess success, pid: ${pid}`);
        fs.closeSync(file.fd);
        expect().assertFail();
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag',`startNativeChildProcess error, code:${error.code}`);
        if (error.code === 801){
          expect(error.code).assertEqual(801);
          done();
        } else {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          hilog.info(0x0000, 'testTag', '%{public}s',
            'Test passed: startNativeChildProcess returns error 401  when Child process source file path is empty.');
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0500
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0500', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0500 begin');

      let path = abilityDelegator!.getAppContext().filesDir + "/test.txt";
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      try {
        let args: ChildProcessArgs = {}
        await Utils.msSleep(500)
        hilog.info(0x0000, 'testTag',`startNativeChildProcess before,fd1:${file.fd}`);
        pid = await childProcessManager.startNativeChildProcess('', args);
        hilog.info(0x0000, 'testTag',`StartNativeChildProcess success, pid: ${pid}`);
        fs.closeSync(file.fd);
        expect(pid > 0).assertTrue();
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag',`startNativeChildProcess error, code:${error.code}`);
        if (error.code === 801){
          expect(error.code).assertEqual(801);
          done();
        } else {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          hilog.info(0x0000, 'testTag', '%{public}s',
            'Test passed: startNativeChildProcess returns error 401  when Child process source file path is empty.');
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0600
     * @tc.number SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0600
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartNativeChildProcess_static_0600 begin');

      let path = abilityDelegator!.getAppContext().filesDir + "/test.txt";
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      try {
        let args: ChildProcessArgs = {
          entryParams: 'testEntryParams',
          fds: {
            'fd1': file.fd
          } as Record<string, int>
        };
        await Utils.msSleep(500)
        hilog.info(0x0000, 'testTag',`startNativeChildProcess before,fd1:${file.fd}`);
        pid = await childProcessManager.startNativeChildProcess("libentry.so:Main", args);
        hilog.info(0x0000, 'testTag',`StartNativeChildProcess success, pid: ${pid}`);
        fs.closeSync(file.fd);
        expect(pid > 0).assertTrue();
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag',`startNativeChildProcess error, code:${error.code}`);
        if (error.code === 801){
          expect(error.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });
  })
}