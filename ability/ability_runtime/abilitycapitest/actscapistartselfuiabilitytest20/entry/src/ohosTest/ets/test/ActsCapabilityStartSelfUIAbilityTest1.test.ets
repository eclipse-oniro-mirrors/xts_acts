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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import AbilityKitTest from 'libentry.so'

const ABILITY_ERR_OK = 0;

export default function ActsCapabilityStartSelfUIAbilityTest1() {
  describe('ActsCapabilityStartSelfUIAbilityTest1', () => {
    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0100
     * @tc.desc   Testing CreateNativeChildProcess returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.CreateNativeChildProcessNoError();
          if(result == 801 || result == 16010004 || result == 16010006){
            done();
            return;
          }
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0200
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0200
     * @tc.desc   Testing CreateNativeChildProcess returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.CreateNativeChildProcessInvalidParam();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0300
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0300
     * @tc.desc   Testing CreateNativeChildProcess returns 16010007.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcess_0300`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.CreateNativeChildProcessLibLoadingFailed();
          if(result == 801 || result == 16010004 || result == 16010006){
            done();
            return;
          }
          expect(16010007).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcessWithConfigs_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcessWithConfigs_0100
     * @tc.desc   Testing CreateNativeChildProcessWithConfigs returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcessWithConfigs_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcessWithConfigs_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.CreateNativeChildProcessWithConfigsNoError();
          if(result == 801 || result == 16010004 || result == 16010006){
            done();
            return;
          }
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcessWithConfigs_0200
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcessWithConfigs_0200
     * @tc.desc   Testing CreateNativeChildProcessWithConfigs returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcessWithConfigs_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_CreateNativeChildProcessWithConfigs_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.CreateNativeChildProcessWithConfigsInvalidParam();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcess_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcess_0100
     * @tc.desc   Testing StartNativeChildProcess returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcess_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcess_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartNativeChildProcessNoError();
          if(result == 801 || result == 16010004 || result == 16010006){
            done();
            return;
          }
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcess_0200
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcess_0200
     * @tc.desc   Testing StartNativeChildProcess returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcess_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcess_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartNativeChildProcessInvalidParam();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0100
     * @tc.desc   Testing StartNativeChildProcessWithConfigs returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartNativeChildProcessWithConfigsNoError();
          if(result == 801 || result == 16010004 || result == 16010006){
            done();
            return;
          }
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0200
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0200
     * @tc.desc   Testing StartNativeChildProcessWithConfigs returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartNativeChildProcessWithConfigsInvalidParam();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0300
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0300
     * @tc.desc   Testing StartNativeChildProcessWithConfigs returns 16010003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_StartNativeChildProcessWithConfigs_0300`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartNativeChildProcessWithConfigsServiceError();
          if(result == 801 || result == 16010004 || result == 16010006){
            done();
            return;
          }
          expect(16010003).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0100
     * @tc.desc   Test StartSelfUIAbility and return 16000079.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityInstanceKeyNotSupport();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000050){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000050).assertEqual(result);
            done();
            return;
          }
          expect(16000079).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0200
     * @tc.desc   Test StartSelfUIAbility and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityNoError();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0300
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0300
     * @tc.desc   Test StartSelfUIAbility and return 16000077.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbility_0300`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityUpperLimitReached();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000050){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000050).assertEqual(result);
            done();
            return;
          }
          expect(16000077).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })


    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0100
     * @tc.desc   Test StartSelfUIAbilityWithStartOptions and return 16000079.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithStartOptionsInstanceKeyNotSupport();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000078){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000078).assertEqual(result);
            done();
            return;
          }
          expect(16000079).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0200
     * @tc.desc   Test StartSelfUIAbilityWithStartOptions and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithStartOptionsNoError();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0300
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0300
     * @tc.desc   Test StartSelfUIAbilityWithStartOptions and return 16000077.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0300`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithStartOptionsUpperLimitReached();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000078){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000078).assertEqual(result);
            done();
            return;
          }
          expect(16000077).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0400
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0400
     * @tc.desc   Test StartSelfUIAbilityWithStartOptions and return 16000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0400`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithStartOptionsNoSuchAbility();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000001).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0500
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0500
     * @tc.desc   Test StartSelfUIAbilityWithStartOptions and return 16000018.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0500`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithStartOptionsCodeCrossApp();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000018).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0600
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0600
     * @tc.desc   Test StartSelfUIAbilityWithStartOptions and return 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0600`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithStartOptionsCodeInternal();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000050).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0700
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0700
     * @tc.desc   Test StartSelfUIAbilityWithStartOptions and return 16000076.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0700`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithStartOptionsInvalidAppInstanceKey();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000078){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000078).assertEqual(result);
            done();
            return;
          }
          expect(16000076).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0800
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0800
     * @tc.desc   Test StartSelfUIAbilityWithStartOptions and return 16000067.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0800`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result : number = AbilityKitTest.StartSelfUIAbilityWithStartOptionsVisibilitySettingDisabled();
          if(result == 801){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000067).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCacheDir_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCacheDir_0100
     * @tc.desc   Test ApplicationContextGetCacheDir and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCacheDir_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCacheDir_0100`;
        try {
          console.info(`${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetCacheDirNoError();
          expect(0).assertEqual(result);
          console.info(`${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCacheDir_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCacheDir_0200
     * @tc.desc   Testing ApplicationContextGetCacheDir returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCacheDir_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCacheDir_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetCacheDirInvPar();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetAreaMode_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetAreaMode_0100
     * @tc.desc   Test ApplicationContextGetAreaMode and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetAreaMode_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetAreaMode_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetAreaModeNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetAreaMode_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetAreaMode_0200
     * @tc.desc   Testing ApplicationContextGetAreaMode returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetAreaMode_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetAreaMode_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetAreaModeInvPar();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleName_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleName_0100
     * @tc.desc   Test ApplicationContextGetBundleName and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleName_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleName_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetBundleNameNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleName_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleName_0200
     * @tc.desc   Testing ApplicationContextGetBundleName returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleName_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleName_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetBundleNameInvPar();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetTempDir_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetTempDir_0100
     * @tc.desc   Test ApplicationContextGetTempDir and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetTempDir_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetTempDir_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetTempDirNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetTempDir_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetTempDir_0200
     * @tc.desc   Testing ApplicationContextGetTempDir returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetTempDir_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetTempDir_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetTempDirInvPar();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetFilesDir_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetFilesDir_0100
     * @tc.desc   Test ApplicationContextGetFilesDir and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetFilesDir_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetFilesDir_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetFilesDirNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetFilesDir_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetFilesDir_0200
     * @tc.desc   Testing ApplicationContextGetFilesDir returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetFilesDir_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetFilesDir_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetFilesDirInvPar();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDatabaseDir_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDatabaseDir_0100
     * @tc.desc   Test ApplicationContextGetDatabaseDir and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDatabaseDir_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDatabaseDir_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetDatabaseDirNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDatabaseDir_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDatabaseDir_0200
     * @tc.desc   Testing ApplicationContextGetDatabaseDir returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDatabaseDir_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDatabaseDir_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetDatabaseDirInvPar();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetPreferencesDir_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetPreferencesDir_0100
     * @tc.desc   Test ApplicationContextGetPreferencesDir and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetPreferencesDir_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetPreferencesDir_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetPreferencesDirNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetPreferencesDir_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetPreferencesDir_0200
     * @tc.desc   Testing ApplicationContextGetPreferencesDir returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetPreferencesDir_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetPreferencesDir_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetPreferencesDirInvPar();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleCodeDir_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleCodeDir_0100
     * @tc.desc   Test ApplicationContextGetBundleCodeDir and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleCodeDir_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleCodeDir_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetBundleCodeDirNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleCodeDir_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleCodeDir_0200
     * @tc.desc   Testing ApplicationContextGetBundleCodeDir returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleCodeDir_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetBundleCodeDir_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetBundleCodeDirInvPar();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDistributedFilesDir_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDistributedFilesDir_0100
     * @tc.desc   Test ApplicationContextGetDistributedFilesDir and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDistributedFilesDir_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDistributedFilesDir_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetDistributedFilesDirNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDistributedFilesDir_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDistributedFilesDir_0200
     * @tc.desc   Testing ApplicationContextGetDistributedFilesDir returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDistributedFilesDir_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetDistributedFilesDir_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetDistributedFilesDirInvPar();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCloudFileDir_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCloudFileDir_0100
     * @tc.desc   Test ApplicationContextGetCloudFileDir and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCloudFileDir_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCloudFileDir_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetCloudFileDirNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCloudFileDir_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCloudFileDir_0200
     * @tc.desc   Testing ApplicationContextGetCloudFileDir returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCloudFileDir_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetCloudFileDir_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetCloudFileDirInvPar();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetResourceDir_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetResourceDir_0100
     * @tc.desc   Test ApplicationContextGetResourceDir and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetResourceDir_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetResourceDir_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetResourceDirNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorInvalidParam_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorInvalidParam_0100
     * @tc.desc   Test NcpErrorInvalidParam Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorInvalidParam_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorInvalidParam_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.NcpErrorInvalidParamCode();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorServiceError_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorServiceError_0100
     * @tc.desc   Test NcpErrorServiceError Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorServiceError_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorServiceError_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.NcpErrorServiceErrorCode();
          if(result == 801 || result == 16010004 || result == 16010006){
            done();
            return;
          }
          expect(16010003).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorLibLoadingFailed_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorLibLoadingFailed_0100
     * @tc.desc   Test NcpErrorLibLoadingFailed Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorLibLoadingFailed_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_NcpErrorLibLoadingFailed_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.NcpErrorLibLoadingFailedCode();
          if(result == 801 || result == 16010004 || result == 16010006){
            done();
            return;
          }
          expect(16010007).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_NcpErrCallBackNotExist_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_NcpErrCallBackNotExist_0100
     * @tc.desc   Test NcpErrCallBackNotExist Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_NcpErrCallBackNotExist_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_NcpErrCallBackNotExist_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.NcpErrCallBackNotExistCode();
          expect(16010009).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_AbilityBaseErrorCodeNoError_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_AbilityBaseErrorCodeNoError_0100
     * @tc.desc   Test AbilityBaseErrorCodeNoError Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_AbilityBaseErrorCodeNoError_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_AbilityBaseErrorCodeNoError_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityBaseErrorCodeNoErrorCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_AbilityBaseErrorCodeParamInvalid_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_AbilityBaseErrorCodeParamInvalid_0100
     * @tc.desc   Test AbilityBaseErrorCodeParamInvalid Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_AbilityBaseErrorCodeParamInvalid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_AbilityBaseErrorCodeParamInvalid_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityBaseErrorCodeParamInvalidCode();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeNoSuchAbility_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeNoSuchAbility_0100
     * @tc.desc   Test AbilityRuntimeErrorCodeNoSuchAbility Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeNoSuchAbility_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeNoSuchAbility_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeErrorCodeNoSuchAbilityCode();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000001).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeCrossApp_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeCrossApp_0100
     * @tc.desc   Test AbilityRuntimeErrorCodeCrossApp Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeCrossApp_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeCrossApp_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeErrorCodeCrossAppCode();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000018).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeInternal_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeInternal_0100
     * @tc.desc   Test AbilityRuntimeErrorCodeInternal Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeInternal_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeInternal_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeErrorCodeInternalCode();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000050).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorVisibilitySettingDisabled_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorVisibilitySettingDisabled_0100
     * @tc.desc   Test AbilityRuntimeErrorVisibilitySettingDisabled Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorVisibilitySettingDisabled_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorVisibilitySettingDisabled_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeErrorVisibilitySettingDisabledCode();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000067).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeInvalidAppInstanceKey_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeInvalidAppInstanceKey_0100
     * @tc.desc   Test AbilityRuntimeErrorCodeInvalidAppInstanceKey Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeInvalidAppInstanceKey_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeInvalidAppInstanceKey_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeErrorCodeInvalidAppInstanceKeyCode();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000078){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000078).assertEqual(result);
            done();
            return;
          }
          expect(16000076).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeUpperLimitReached_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeUpperLimitReached_0100
     * @tc.desc   Test AbilityRuntimeErrorCodeUpperLimitReached Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodeUpperLimitReached_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_AbilityRuntimeErrorCodeUpperLimitReached_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeErrorCodeUpperLimitReachedCode();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000050){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000050).assertEqual(result);
            done();
            return;
          }
          expect(16000077).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorAppInstanceKeyNotSupport_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorAppInstanceKeyNotSupport_0100
     * @tc.desc   Test AbilityRuntimeErrorAppInstanceKeyNotSupport Error Code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorAppInstanceKeyNotSupport_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorAppInstanceKeyNotSupport_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeErrorAppInstanceKeyNotSupportCode();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          if(result == 16000078){
            console.info(`====>${LOG_NAME} result: ` + result);
            expect(16000078).assertEqual(result);
            done();
            return;
          }
          expect(16000079).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetVersionCode_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetVersionCode_0100
     * @tc.desc   Test ApplicationContextGetVersionCode and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetVersionCode_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetVersionCode_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetVersionCodeNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetVersionCode_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetVersionCode_0200
     * @tc.desc   Testing ApplicationContextGetVersionCode returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetVersionCode_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_ApplicationContextGetVersionCode_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ApplicationContextGetVersionCodeParamInvalid();
          expect(401).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done()
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done()
        }
      })
  })
}