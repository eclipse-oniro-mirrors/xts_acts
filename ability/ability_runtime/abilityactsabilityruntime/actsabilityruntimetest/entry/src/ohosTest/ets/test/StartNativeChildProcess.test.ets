/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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


import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import {  ChildProcessArgs,
  childProcessManager,
  ChildProcessOptions } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';
import { systemParameterEnhance } from '@kit.BasicServicesKit';
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let context:common.UIAbilityContext;
let mpEnable: string;
export default function AbilityRuntimeStartNativeChildProcess() {
  describe('AbilityRuntimeStartNativeChildProcess', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        hilog.info(0x0000, "[%{public}s] Get system parameter error: ${public}s", JSON.stringify(err));
        mpEnable = 'fail';
      }
    })
    beforeEach(async () => {})
    afterEach(() => {})
    afterAll(async () => {})
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startNativeChildProcess_0100
     * @tc.number SUB_Ability_AbilityRuntime_startNativeChildProcess_0100
     * @tc.desc   Verify that startNativeChildProcess input parameter entryPoint is null and return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_startNativeChildProcess_0100', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_startNativeChildProcess_0100';
      if (mpEnable == 'true') {
        let args: ChildProcessArgs = {
          entryParams: "testParam",
          fds: {}
        };
        try {
          await childProcessManager.startNativeChildProcess(null,args)
        } catch (err) {
          hilog.error(0x0000, 'testTag', `requestPermissionsFromUser  restart failed: ${err.code}, ${err.message},${testNum}`);
          expect(err?.code).assertEqual(401)
          done();
        }
      }else if (mpEnable == 'false') {
        hilog.info(0x0000, 'testTag', `restart failed: The current device does not support`);
        done();
      } else {
        hilog.info(0x0000, 'testTag', `restart failed: The current device does not support`,mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startNativeChildProcess_0400
     * @tc.number SUB_Ability_AbilityRuntime_startNativeChildProcess_0400
     * @tc.desc   Verify that startNativeChildProcess input parameter entryPoint is null and return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_startNativeChildProcess_0400', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_startNativeChildProcess_0400';
      if (mpEnable == 'true') {
        let options: ChildProcessOptions = {
          isolationMode: false
        };
        try {
          await childProcessManager.startNativeChildProcess("libentry.so:Main", null, options);
        } catch (err) {
          hilog.error(0x0000, 'testTag', `requestPermissionsFromUser  restart failed: ${err.code}, ${err.message},${testNum}`);
          expect(err?.code).assertEqual(401)
          done();
        }
      }else if (mpEnable == 'false') {
        hilog.info(0x0000, 'testTag', `restart failed: The current device does not support`);
        done();
      } else {
        hilog.info(0x0000, 'testTag', `restart failed: The current device does not support`,mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startNativeChildProcess_0800
     * @tc.number SUB_Ability_AbilityRuntime_startNativeChildProcess_0800
     * @tc.desc   Verify that the startNativeChildProcess parameter options are undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_startNativeChildProcess_0800', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_startNativeChildProcess_0800';
      if (mpEnable == 'true') {
        let path = abilityDelegator.getAppContext().filesDir + "/test.txt";
        let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
        let args: ChildProcessArgs = {
          entryParams: "testParam",
          fds: {
            'fd1': file.fd
          }
        };
        let options = undefined;
        try {
          await childProcessManager.startNativeChildProcess("libentry.so:Main", args,options);
        } catch (err) {
          hilog.error(0x0000, 'testTag', `requestPermissionsFromUser  restart failed: ${err.code}, ${err.message},${testNum}`);
          expect(err?.code).assertEqual(401)
          done();
        }
      }else if (mpEnable == 'false') {
        hilog.info(0x0000, 'testTag', `restart failed: The current device does not support`);
        done();
      } else {
        hilog.info(0x0000, 'testTag', `restart failed: The current device does not support`,mpEnable);
        expect().assertFail();
        done();
      }
    })
  })
}
