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

import { describe, it, expect, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import { ChildProcessArgs } from '@ohos.app.ability.ChildProcessArgs';
import { ChildProcessOptions } from '@ohos.app.ability.ChildProcessOptions';
import fs from '@ohos.file.fs';
import DemoProcess from '../process/DemoProcess';
import { Driver, ON } from '@ohos.UiTest';

let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000;
let tag: string = 'testTag';
const PARAMETER_ERROR_CODE = 401;
let context: common.UIAbilityContext | undefined;

export default function startArkChildProcessStatic() {
  describe('startArkChildProcessStatic', () => {

    beforeAll(async () => {
      let driver = Driver.create();
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actsstartchildprocesstest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'start success');
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'getcontext success, context: ' + context);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_Static_0300
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let path = context!.filesDir + '/test.txt';
      let file = fs.openSync(path, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: 'testParam',
        fds: {
          'key1': file.fd
        } as Record<string, int>
      };
      let options: ChildProcessOptions = {
        isolationMode: false,
        isolationUid: false
      };
      try {
        let pid = await childProcessManager.startArkChildProcess('', args, options);
        hilog.info(0x0000, 'testTag', '%{public}s', `startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (error) {
        if (error.code === 801){
          expect(error.code).assertEqual(801);
          done();
        } else {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          hilog.info(0x0000, 'testTag', '%{public}s',
            'Test passed: startArkChildProcess returns error 401  when Child process source file path is empty.');
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_Static_0400
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let path = context!.filesDir + '/test.txt';
      let file = fs.openSync(path, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: 'testParam',
        fds: {
          'key1': file.fd
        } as Record<string, int>
      };
      let options: ChildProcessOptions = {
        isolationMode: true,
        isolationUid: true
      };
      try {
        let pid = await childProcessManager.startArkChildProcess('', args, options);
        hilog.info(0x0000, 'testTag', '%{public}s', `startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (error) {
        if (error.code === 801){
          expect(error.code).assertEqual(801);
          done();
        } else {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          hilog.info(0x0000, 'testTag', '%{public}s',
            'Test passed: startArkChildProcess returns error 401  when Child process source file path is empty.');
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_Static_0500
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let path = context!.filesDir + '/test.txt';
      let file = fs.openSync(path, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE);
      let args: ChildProcessArgs = {};
      let options: ChildProcessOptions = {
        isolationMode: false,
        isolationUid: true
      };
      try {
        let pid = await childProcessManager.startArkChildProcess('', args, options);
        hilog.info(0x0000, 'testTag', '%{public}s', `startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (error) {
        if (error.code === 801){
          expect(error.code).assertEqual(801);
          done();
        } else {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          hilog.info(0x0000, 'testTag', '%{public}s',
            'Test passed: startArkChildProcess returns error 401  when Child process source file path is empty.');
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startArkChildProcess_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_startArkChildProcess_Static_0600
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_startArkChildProcess_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let path = context!.filesDir + '/test.txt';
      let file = fs.openSync(path, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE);
      let args: ChildProcessArgs = {};
      try {
        let pid = await childProcessManager.startArkChildProcess('', args);
        hilog.info(0x0000, 'testTag', '%{public}s', `startChildProcess success, pid: ${pid}`);
        expect().assertFail();
        done();
      } catch (error) {
        if (error.code === 801){
          expect(error.code).assertEqual(801);
          done();
        } else {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          hilog.info(0x0000, 'testTag', '%{public}s',
            'Test passed: startArkChildProcess returns error 401  when Child process source file path is empty.');
          done();
        }
      }
    })
  })
}