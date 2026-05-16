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
import common from '@ohos.app.ability.common';
import { ChildProcessArgs, childProcessManager, ChildProcessOptions } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { systemParameterEnhance } from '@kit.BasicServicesKit';


let context:common.UIAbilityContext;
let mpEnable: string;
export default function AbilityRuntimeAmsJSChildProcess() {
  describe('AbilityRuntimeAmsJSChildProcess', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        hilog.info(0x0000, "[%{public}s] Get system parameter error: ${public}s", JSON.stringify(err));
        mpEnable = 'fail';
      }
    })
    beforeEach(async () => {
    })
    afterEach(() => {})
    afterAll(async () => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0100
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0100
     * @tc.desc   Call the startArkChildProcess interface and pass the parameter srcEntry as null. If the call fails, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0100', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0100';
      let path = context.filesDir + "/test.txt";
      let file = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY | fileIo.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: "testParam",
        fds: {
          "key1": file.fd
        }
      };
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      if (mpEnable == 'true') {
        try {
          await childProcessManager.startArkChildProcess(null,args,options)
        } catch (err) {
          hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
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
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0200
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0200
     * @tc.desc   Call the startArkChildProcess interface and pass the parameter srcEntry as undefined. If the call fails, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0200', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0200';
      let path = context.filesDir + "/test.txt";
      let file = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY | fileIo.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: "testParam",
        fds: {
          "key1": file.fd
        }
      };
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      if (mpEnable == 'true') {
        try {
          await childProcessManager.startArkChildProcess(undefined,args,options)
        } catch (err) {
          hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
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
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0300
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0300
     * @tc.desc   Call the startArkChildProcess interface and pass the parameter srcEntry as an empty string. The call fails and returns a 401 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0300', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0300';
      let path = context.filesDir + "/test.txt";
      let file = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY | fileIo.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: "testParam",
        fds: {
          "key1": file.fd
        }
      };
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      if (mpEnable == 'true') {
        try {
          await childProcessManager.startArkChildProcess('',args,options)
        } catch (err) {
          hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
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
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0400
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0400
     * @tc.desc   Call the startArkChildProcess interface and pass the parameter srcEntry as the error path, onstart does not call back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0400', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0400';
      let path = context.filesDir + "/test.txt";
      let file = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY | fileIo.OpenMode.CREATE);
      let args: ChildProcessArgs = {
        entryParams: "testParam",
        fds: {
          "key1": file.fd
        }
      };
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      if (mpEnable == 'true') {
        try {
          let pid =  await childProcessManager.startArkChildProcess('entry_test/./ets/process/DemoProcess1.ets',args,options)
          let flag = pid > 0
          expect(flag).assertEqual(true)
          done();
        } catch (err) {
          hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
          expect().assertFail()
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
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0500
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0500
     * @tc.desc   When calling the startArkChildProcess interface, the parameter ChildProcessArgs passed in is empty. If the call is successful, the onStart callback returns empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0500', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0500';
      let path = context.filesDir + "/test.txt";
      let file = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY | fileIo.OpenMode.CREATE);
      let args: ChildProcessArgs = {};
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      if (mpEnable == 'true') {
        try {
          let pid =  await childProcessManager.startArkChildProcess('entry_test/./ets/process/DemoProcess.ets',args,options)
          let flag = pid > 0
          expect(flag).assertEqual(true)
          done();
        } catch (err) {
          hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
          expect().assertFail()
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
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0600
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0600
     * @tc.desc   The parameter ChildProcessArgs passed through the startArkChildProcess interface is null, and the call fails with a 401 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0600', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0600';
      let args = null;
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      if (mpEnable == 'true') {
        try {
          await childProcessManager.startArkChildProcess('entry_test/./ets/process/DemoProcess.ets',args,options)
        } catch (err) {
          hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
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
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0700
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0700
     * @tc.desc   The parameter ChildProcessArgs passed through the startArkChildProcess interface is undefined, and the call fails with a 401 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0700', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0700';
      let args = undefined;
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      if (mpEnable == 'true') {
        try {
          await childProcessManager.startArkChildProcess('entry_test/./ets/process/DemoProcess.ets',args,options)
        } catch (err) {
          hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
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
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0800
     * @tc.number SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0800
     * @tc.desc   The startArkChildProcess interface was successfully called with normal parameters, and the onsite callback was successful without exiting the child process
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0800', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_AMS_JSChildProcess_0800';
      let args = null;
      let options: ChildProcessOptions = {
        isolationMode: false
      };
      if (mpEnable == 'true') {
        try {
          await childProcessManager.startArkChildProcess('entry_test/./ets/process/DemoProcess.ets',args,options)
        } catch (err) {
          hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
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