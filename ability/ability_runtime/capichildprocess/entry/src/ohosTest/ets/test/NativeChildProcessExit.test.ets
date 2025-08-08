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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import commonEvent from "@ohos.commonEvent";
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';
import testNapi from 'libentry.so';

let mpEnable : Boolean = false;
let ncpEnable : Boolean = false;

let subscriberInfo: commonEventManager.CommonEventSubscribeInfo = {
  events: ["SUB_Ability_AbilityRuntime_NativeChildProcessExit_0400"],
};
const NATIVE_EXIT_TIMEOUT = 1000;
let flag = true;
let subscriber:commonEventManager.CommonEventSubscriber | null = null;

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function nativeChildProcessExitTest() {
  describe('ActsCapiNativeChildProcessExitTest', () => {
    beforeAll(() => {
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model') === 'true';
      } catch(err) {
        console.error(`ACTS_NativeChildProcessExit Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = false;
      }
      try{
        ncpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.start_native_child_process') === 'true';
      }catch(err){
        console.error(`ACTS_NativeChildProcessExit Get system parameter error: ${JSON.stringify(err)}`);
        ncpEnable = false;
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessExit_0100
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessExit_0100
     * @tc.desc To verify the function of RegisterNativeChildProcessExit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessExit_0100', Level.LEVEL1, async (done: Function) => {
      let tag = `ACTS_NativeChildProcess_0100`;
      console.log(`${tag}, it begin`);

      try {
        let ret : Number = testNapi.startNativeChildProcess('libentry.so');
        if (!mpEnable) {
          console.info(`${tag}: multi process model disable`);
          expect(16010004).assertEqual(ret);
          return;
        } else if (!ncpEnable) {
          console.info(`${tag}: Native child process disable`);
          expect(801).assertEqual(ret);
          return;
        }

        expect(0).assertEqual(ret);

        console.info(`${tag}: Test ipc call for native child process`);
        let a = 123;
        let b = 456;
        expect(a + b).assertEqual(testNapi.childProcessAdd(a, b));
        expect(1).assertEqual(testNapi.requestExitChildProcess(0));
        await sleep(600);

        console.info(`${tag}: Test register native child process exit callback`);
        expect(0).assertEqual(testNapi.registerNativeChildExit());
        expect(0).assertEqual(testNapi.registerNativeChildExit());
        expect(0).assertEqual(testNapi.unregisterNativeChildExit());
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessExit_0200
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessExit_0200
     * @tc.desc To verify the function of UnregisterNativeChildProcessExit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessExit_0200', Level.LEVEL1, async (done: Function) => {
      let tag = `ACTS_NativeChildProcess_0200`;
      console.log(`${tag}, it begin`);

      try {
        let ret : Number = testNapi.startNativeChildProcess('libentry.so');
        if (!mpEnable) {
          console.info(`${tag}: multi process model disable`);
          expect(16010004).assertEqual(ret);
          return;
        } else if (!ncpEnable) {
          console.info(`${tag}: Native child process disable`);
          expect(801).assertEqual(ret);
          return;
        }

        expect(0).assertEqual(ret);

        console.info(`${tag}: Test ipc call for native child process`);
        let a = 123;
        let b = 456;
        expect(a + b).assertEqual(testNapi.childProcessAdd(a, b));
        expect(1).assertEqual(testNapi.requestExitChildProcess(0));
        await sleep(600);

        console.info(`${tag}: Test unregister native child process exit callback`);
        expect(0).assertEqual(testNapi.registerNativeChildExit());
        expect(0).assertEqual(testNapi.unregisterNativeChildExit());
        expect(16010009).assertEqual(testNapi.unregisterNativeChildExit());
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessExit_0300
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessExit_0300
     * @tc.desc To verify the function of native child process callback after register
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessExit_0300', Level.LEVEL1, async (done: Function) => {
      let tag = `ACTS_NativeChildProcessExit_0300`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        let ret : Number = testNapi.startNativeChildProcess('libentry.so');
        expect(0).assertEqual(ret);
        await sleep(600);

        expect(0).assertEqual(testNapi.registerNativeChildExit());
        await sleep(600);

        expect(1).assertEqual(testNapi.requestExitChildProcess(0));
        await sleep(600);

        expect(0).assertEqual(testNapi.unregisterNativeChildExit());
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessExit_0400
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessExit_0400
     * @tc.desc To verify the function of native child process callback after register
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessExit_0400', Level.LEVEL1, async (done: Function) => {
      let tag = `ACTS_NativeChildProcessExit_0400`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        expect(0).assertEqual(testNapi.registerNativeChildExit());
        await sleep(600);

        let ret : Number = testNapi.startChildNoArgs();
        expect(0).assertEqual(ret);

        subscriber = await commonEvent.createSubscriber(subscriberInfo);
        commonEvent.subscribe(subscriber, (err, data) => {
          hilog.info(0x0000, tag, '%{public}s',
            `${tag} subscribeCallBack  data =${JSON.stringify(data)}`);
          if (err) {
            expect().assertFail();
            done();
          }
          if (data.event == subscriberInfo.events[0]) {
            let dataObj = data.parameters as Map<string, string>;
            hilog.info(0x0000, tag, '%{public}s',
              `${tag} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
            let msg = dataObj['str'] as string;
            expect(msg).assertEqual('native child process exit');
            commonEvent.unsubscribe(subscriber);
            flag = false;
            done();
          }
        });
        setTimeout(() => {
          if (flag == true) {
            console.debug("in SUB_Ability_AbilityRuntime_NativeChildProcessExit_0400 - timeout");
            commonEvent.unsubscribe(subscriber);
            expect().assertFail();
          }
          console.debug("SUB_Ability_AbilityRuntime_NativeChildProcessExit_0400 - timeout");
        }, NATIVE_EXIT_TIMEOUT);

        expect(0).assertEqual(testNapi.unregisterNativeChildExit());
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })
  })
}
