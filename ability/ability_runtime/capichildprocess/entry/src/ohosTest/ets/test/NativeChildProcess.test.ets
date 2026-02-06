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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import testNapi from 'libentry.so';

let mpEnable : Boolean = false;
let ncpEnable : Boolean = false;

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function nativeChildProcessTest() {
  describe('ActsCapiNativeChildProcessTest', () => {
    beforeAll(() => {
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model') === 'true';
      } catch(err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = false;
      }
      try{
        ncpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.start_native_child_process') === 'true';
      }catch(err){
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        ncpEnable = false;
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_0100
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0100
     * @tc.desc   To verify the function of creating a subprocess by StartNativeChildProcess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_0100`;
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

        console.info(`${tag}: Test restart native child process`);
        expect(0).assertEqual(testNapi.startNativeChildProcess('libentry.so'));
        expect(1).assertEqual(testNapi.requestExitChildProcess(0));
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_0200
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0200
     * @tc.desc   An error is returned when the libname of a subprocess to be created is an empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0200', Level.LEVEL0, () => {
      let tag = `ACTS_NativeStartChildProcess_0200`;
      console.log(`${tag}, it begin`);

      try {
        expect(401).assertEqual(testNapi.startNativeChildProcess(''));
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_0300
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0300
     * @tc.desc   An error is returned when the vaule of libname is a relative path during the creation of a subprocess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0300', Level.LEVEL0, () => {
      let tag = `ACTS_NativeStartChildProcess_0300`;
      console.log(`${tag}, it begin`);

      try {
        expect(401).assertEqual(testNapi.startNativeChildProcess('../libentry.so'));
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_0400
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0400
     * @tc.desc   An error is returned when a subprocess whose libname does not exist is created
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0400', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_0400`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        expect(16010007).assertEqual(testNapi.startNativeChildProcess('fake.so'));
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_0500
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0500
     * @tc.desc   An error is returned when the callback of a subprocess to be created is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0500', Level.LEVEL0, () => {
      let tag = `ACTS_NativeStartChildProcess_0500`;
      console.log(`${tag}, it begin`);

      try {
        expect(401).assertEqual(testNapi.callApiWithNullCallback());
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_0600
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0600
     * @tc.desc   An error is returned when api called in child process
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0600', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_0600`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        expect(0).assertEqual(testNapi.startNativeChildProcess('libentry.so'));
        expect(16010005).assertEqual(testNapi.childProcessStartNewProcess());
        expect(1).assertEqual(testNapi.requestExitChildProcess(0));
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_0700
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0700
     * @tc.desc   An error is returned when the lib return invalid ipc stub object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0700', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_0700`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        expect(16010008).assertEqual(testNapi.startNativeChildProcess('libinvalidstub.so'));
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_0800
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0800
     * @tc.desc   An error is returned when max native child process reached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0800', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_0800`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        for (let i = 0; i < 50; i++) {
          expect(0).assertEqual(testNapi.startNativeChildProcess('libentry.so'));
        }
        expect(16010006).assertEqual(testNapi.startNativeChildProcess('libentry.so'));
        for (let i = 0; i < 50; i++) {
          expect(1).assertEqual(testNapi.requestExitChildProcess(0));
        }
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_0900
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_0900
     * @tc.desc   An error is returned when a subprocess whose libname use sandbox path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_0900', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_0900`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        expect(16010007).assertEqual(
          testNapi.startNativeChildProcess('/data/storage/el1/bundle/libs/arm64/libentry.so'));
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_1000
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_1000
     * @tc.desc   An error is returned when call the API twice at the same time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_1000', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_1000`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        expect(0).assertEqual(testNapi.busyTest());
        await sleep(100);
        expect(1).assertEqual(testNapi.requestExitChildProcess(0));
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_1100
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_1100
     * @tc.desc   An error is returned when the libname of a subprocess to be created is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_1100', Level.LEVEL0, () => {
      let tag = `ACTS_NativeStartChildProcess_1100`;
      console.log(`${tag}, it begin`);

      try {
        expect(401).assertEqual(testNapi.callApiWithNullLibName());
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_1200
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_1200
     * @tc.desc   An error is returned when the callback and libname of a subprocess to be created is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_1200', Level.LEVEL0, () => {
      let tag = `ACTS_NativeStartChildProcess_1200`;
      console.log(`${tag}, it begin`);

      try {
        expect(401).assertEqual(testNapi.callApiWithNull());
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_1300
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_1300
     * @tc.desc   To verify the function of creating a subprocess by startNativeChildProcess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_1300', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_1300`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        expect(0).assertEqual(testNapi.startNativeChildProcess('libentry.so'));
        expect(1).assertEqual(testNapi.requestExitChildProcess(0));

        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_1400
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_1400
     * @tc.desc   The number of child process can reach 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_1400', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_1400`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        for (let i = 0; i < 50; i++) {
          expect(0).assertEqual(testNapi.startNativeChildProcess('libentry.so'));
        }

        for (let i = 0; i < 50; i++) {
          expect(1).assertEqual(testNapi.requestExitChildProcess(0));
        }
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NativeStartChildProcess_1500
     * @tc.number SUB_Ability_AbilityRuntime_NativeStartChildProcess_1500
     * @tc.desc   An error is returned when max native child process reached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NativeStartChildProcess_1500', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_1500`;
      console.log(`${tag}, it begin`);

      try {
        if (!mpEnable || !ncpEnable) {
          console.info(`${tag}: Native child process disable, skip test`);
          return;
        }

        for (let i = 0; i < 50; i++) {
          expect(0).assertEqual(testNapi.startNativeChildProcess('libentry.so'));
        }
        expect(16010006).assertEqual(testNapi.startNativeChildProcess('libentry.so'));
        expect(1).assertEqual(testNapi.requestExitChildProcess(0));

        await sleep(100);
        expect(0).assertEqual(testNapi.startNativeChildProcess('libentry.so'));

        for (let i = 0; i < 50; i++) {
          expect(1).assertEqual(testNapi.requestExitChildProcess(0));
        }
        await sleep(600);
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
      } finally {
        done();
      }
    })
  })
}
