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
import testNapi from 'libentry.so';

let mpEnable : Boolean = false;
let ncpEnable : Boolean = false;

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function createNativeChildProcessWithConfigsTest() {
  describe('ActsCapiCreateNativeChildProcessWithConfigsTest', () => {
    beforeAll(() => {
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model') === 'true';
      } catch(err) {
        console.error(`ACTS_CreateNativeChildProcessWithConfig Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = false;
      }
      try{
        ncpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.start_native_child_process') === 'true';
      }catch(err){
        console.error(`ACTS_CreateNativeChildProcessWithConfig Get system parameter error: ${JSON.stringify(err)}`);
        ncpEnable = false;
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1600
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1600
     * @tc.desc To verify the function of creating a subprocess by CreateNativeChildProcessWithConfigs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1600', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeChildProcessWithConfigs_1600`;
      console.log(`${tag}, it begin`);
      try {
        let ret : Number = testNapi.CreateNativeChildProcessWithConfigs('libentry.so');
        console.log(`${tag}, get ret ` + JSON.stringify(ret));
        if(ret == 801 || ret == 16010004){
          console.info(`${tag}: multi process model disable or Native child process disable`);
          done();
        }else{
          expect(0).assertEqual(ret);
          console.info(`${tag}: Test ipc call for native child process`);
          let a = 123;
          let b = 456;
          expect(a + b).assertEqual(testNapi.childProcessAdd(a, b));
          expect(1).assertEqual(testNapi.requestExitChildProcess(0));
          await sleep(600);
          console.info(`${tag}: Test restart native child process`);
          expect(0).assertEqual(testNapi.CreateNativeChildProcessWithConfigs('libentry.so'));
          expect(1).assertEqual(testNapi.requestExitChildProcess(0));
          await sleep(600);
          done();
        }
      } catch(err) {
        console.error(`${tag} catch error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1700
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1700
     * @tc.desc An error is returned when the vaule of libname is a relative path during the creation of a subprocess
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1700', Level.LEVEL0, (done: Function) => {
      let tag = `ACTS_NativeChildProcessWithConfigs_1700`;
      console.log(`${tag}, it begin`);
      try {
        expect(401).assertEqual(testNapi.CreateNativeChildProcessWithConfigs('../libentry.so'));
        done();
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1800
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1800
     * @tc.desc An error is returned when the libname is nullptr during the creation of a subprocess
     * @tc.size MediumTest
     * @tc.type Function  
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1800', Level.LEVEL0, (done: Function) => {
      let tag = `ACTS_NativeChildProcessWithConfigs_1800`;
      console.log(`${tag}, it begin`);
      try {
        expect(401).assertEqual(testNapi.CreateNativeChildProcessWithConfigsLibNamenullptr());
        done();
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1900
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1900
     * @tc.desc An error is returned when the vaule of libname is an empty string during the creation of a subprocess
     * @tc.size MediumTest
     * @tc.type Function  
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_1900', Level.LEVEL0, (done: Function) => {
      let tag = `ACTS_NativeChildProcessWithConfigs_1900`;
      console.log(`${tag}, it begin`);

      try {
        expect(401).assertEqual(testNapi.CreateNativeChildProcessWithConfigs(''));
        done();
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_2100
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_2100
     * @tc.desc An error is returned when a subprocess whose libname use sandbox path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_2100', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeChildProcessWithConfigs_2100`;
      console.log(`${tag}, it begin`);
      try {
        let ret:number = testNapi.CreateNativeChildProcessWithConfigs('/data/storage/el1/bundle/libs/arm64/libentry.so');
        console.log(`${tag}, get ret ` + JSON.stringify(ret));
        if(ret == 801 || ret == 16010004){
          console.info(`${tag}: multi process model disable or Native child process disable`);
          done();
        }else{
          expect(16010007).assertEqual(ret);
          await sleep(600);
          done();
        }
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_2200
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_2200
     * @tc.desc An error is returned when a subprocess whose libname does not exist is created 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_2200', Level.LEVEL0, async (done: Function) => {
      let tag = `ACTS_NativeChildProcessWithConfigs_2200`;
      console.log(`${tag}, it begin`);
      try {
        let ret:number = testNapi.CreateNativeChildProcessWithConfigs('fake.so');
        console.log(`${tag}, get ret ` + JSON.stringify(ret));
        if(ret == 801 || ret == 16010004){
          console.info(`${tag}: multi process model disable or Native child process disable`);
          done();
        }else{
          expect(16010007).assertEqual(ret);
          await sleep(600);
          done();
        }
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_2300
     * @tc.name SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_2300
     * @tc.desc An error is returned when the callback of a subprocess to be created is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_NativeChildProcessWithConfigs_2300', Level.LEVEL0, (done: Function) => {
      let tag = `ACTS_NativeChildProcessWithConfigs_2300`;
      console.log(`${tag}, it begin`);
      try {
        expect(401).assertEqual(testNapi.CreateNativeChildProcessWithConfigsNullCallback());
        done();
      } catch(err) {
        console.error(`${tag} error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

  })
}
