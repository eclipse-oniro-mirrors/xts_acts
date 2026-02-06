/*
  * Copyright (C) 2024 HiHope Open Source Organization.
  * Licensed under the Apache License, Version 2.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  *    http://www.apache.org/licenses/LICENSE-2.0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
*/

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import { ChildProcessArgs, ChildProcessOptions, childProcessManager, common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import DemoProcess from '../process/DemoProcess';
import { Driver } from '@kit.TestKit';

export default function startArkChildProcess() {
  describe('startArkChildProcess', () => {
    const PARAMETER_ERROR_CODE = 401;
    let context: common.UIAbilityContext;
    beforeAll(async (done: Function) => {
      let driver = Driver.create()
      await driver.delayMs(2000)
      context = getContext() as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Succeeded in starting SpecifiedAbility11ww11` + JSON.stringify(context));
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0600
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0600
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0600', Level.LEVEL0, async (done: Function) => {
      let args: ChildProcessArgs | null = null;
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      try {
        DemoProcess.toString();
        let pid =
          await childProcessManager.startArkChildProcess('entry_test/./ets/process/DemoProcess.ets', args, options);
        hilog.info(0x0000, 'testTag', '%{public}s', `startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (error) {
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'Test passed: startArkChildProcess returns error 401 when called with null ChildProcessArgs.');
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0700
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0700
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0700', Level.LEVEL0, async (done: Function) => {
      let args: ChildProcessArgs | undefined = undefined;
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      try {
        DemoProcess.toString();
        let pid =
          await childProcessManager.startArkChildProcess('entry_test/./ets/process/DemoProcess.ets', args, options);
        hilog.info(0x0000, 'testTag', '%{public}s', `startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (error) {
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy');
        hilog.info(0x0000, 'testTag', '%{public}s',
          'Test passed: startArkChildProcess returns error 401 when called with undefined ChildProcessArgs.');
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0900
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0900
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0900', Level.LEVEL0, async (done: Function) => {
      let path = context.filesDir + '/test.txt';
      let file = fs.openSync(path, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: 'testParam',
        fds: {
          'key1': file.fd
        }
      };
      let options: ChildProcessOptions | null = null;
      try {
        DemoProcess.toString();
        let pid =
          await childProcessManager.startArkChildProcess('entry_test/./ets/process/DemoProcess.ets', args, options);
        hilog.info(0x0000, 'testTag', '%{public}s', `startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (error) {
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'Test passed: startArkChildProcess returns error 401 when called with null ChildProcessOptions.');
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_1000
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_1000
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_1000', Level.LEVEL0, async (done: Function) => {
      let path = context.filesDir + '/test.txt';
      let file = fs.openSync(path, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: 'testParam',
        fds: {
          'key1': file.fd
        }
      };
      let options: ChildProcessOptions | undefined = undefined;
      try {
        DemoProcess.toString();
        await childProcessManager.startArkChildProcess('entry_test/./ets/process/DemoProcess.ets', args, options);
        hilog.info(0x0000, 'testTag', '%{public}s', 'startChildProcess success');
        expect().assertFail();
        done();
      } catch (error) {
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'Test passed: startArkChildProcess returns error 401 when called with undefined ChildProcessOptions.');
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0100
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0100
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0100', Level.LEVEL0, async (done: Function) => {
      let path = context.filesDir + '/test.txt';
      let file = fs.openSync(path, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: 'testParam',
        fds: {
          'key1': file.fd
        }
      };
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      try {
        DemoProcess.toString();
        let pid = await childProcessManager.startArkChildProcess(null, args, options);
        hilog.info(0x0000, 'testTag', '%{public}s', `startChildProcess success pid:${pid}`);
        expect().assertFail();
        done();
      } catch (error) {
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'Test passed: startArkChildProcess returns error 401 when Child process source file path is null.');
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0200
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0200
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0200', Level.LEVEL0, async (done: Function) => {
      let path = context.filesDir + '/test.txt';
      let file = fs.openSync(path, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: 'testParam',
        fds: {
          'key1': file.fd
        }
      };
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      try {
        DemoProcess.toString();
        let pid = await childProcessManager.startArkChildProcess(undefined, args, options);
        hilog.info(0x0000, 'testTag', '%{public}s', `startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (error) {
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'Test passed: startArkChildProcess returns error 401 when Child process source file path is undefined.');
        done();
      }
    });
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0300
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0300
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0300', Level.LEVEL0, async (done: Function) => {
      let path = context.filesDir + '/test.txt';
      let file = fs.openSync(path, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: 'testParam',
        fds: {
          'key1': file.fd
        }
      };
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      try {
        DemoProcess.toString();
        let pid = await childProcessManager.startArkChildProcess('', args, options);
        hilog.info(0x0000, 'testTag', '%{public}s', `startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (error) {
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'Test passed: startArkChildProcess returns error 401  when Child process source file path is empty.');
        done();
      }
    });
  });
}