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

export default function ActsCapabilityStartSelfUIAbilityTest() {
  describe('ActsCapabilityStartSelfUIAbilityTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_DestroyChildProcessConfigs_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_DestroyChildProcessConfigs_0100
     * @tc.desc   Testing DestroyChildProcessConfigs returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_DestroyChildProcessConfigs_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_DestroyChildProcessConfigs_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.DestroyChildProcessConfigsParamInvalid();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_DestroyChildProcessConfigs_0200
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_DestroyChildProcessConfigs_0200
     * @tc.desc   Test DestroyChildProcessConfigs and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_DestroyChildProcessConfigs_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_DestroyChildProcessConfigs_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.DestroyChildProcessConfigsNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetIsolationMode_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetIsolationMode_0100
     * @tc.desc   Testing ChildProcessConfigsSetIsolationMode returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetIsolationMode_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetIsolationMode_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ChildProcessConfigsSetIsolationModeInvalidParam();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetIsolationMode_0200
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetIsolationMode_0200
     * @tc.desc   Testing ChildProcessConfigsSetIsolationMode returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetIsolationMode_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetIsolationMode_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ChildProcessConfigsSetIsolationModeNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetProcessName_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetProcessName_0100
     * @tc.desc   Testing ChildProcessConfigsSetProcessName returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetProcessName_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetProcessName_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ChildProcessConfigsSetProcessNameInvalidParam();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetProcessName_0200
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetProcessName_0200
     * @tc.desc   Testing ChildProcessConfigsSetProcessName returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetProcessName_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_ChildProcessConfigsSetProcessName_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.ChildProcessConfigsSetProcessNameNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_RegisterNativeChildProcessExitCallback_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_RegisterNativeChildProcessExitCallback_0100
     * @tc.desc   Testing RegisterNativeChildProcessExitCallback returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_RegisterNativeChildProcessExitCallback_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_RegisterNativeChildProcessExitCallback_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.RegisterNativeChildProcessExitCallbackNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_RegisterNativeChildProcessExitCallback_0200
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_RegisterNativeChildProcessExitCallback_0200
     * @tc.desc   Testing RegisterNativeChildProcessExitCallback returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_RegisterNativeChildProcessExitCallback_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_RegisterNativeChildProcessExitCallback_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.RegisterNativeChildProcessExitCallbackInvPar();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_UnregisterNativeChildProcessExitCallback_0100
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_UnregisterNativeChildProcessExitCallback_0100
     * @tc.desc   Testing UnregisterNativeChildProcessExitCallback returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_UnregisterNativeChildProcessExitCallback_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_UnregisterNativeChildProcessExitCallback_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.UnregisterNativeChildProcessExitCallbackNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_UnregisterNativeChildProcessExitCallback_0200
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_UnregisterNativeChildProcessExitCallback_0200
     * @tc.desc   Testing UnregisterNativeChildProcessExitCallback returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_UnregisterNativeChildProcessExitCallback_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_UnregisterNativeChildProcessExitCallback_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.UnregisterNativeChildProcessExitCallbackInvPar();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeChildProcess_UnRegisterNativeChildProcessExitCallback_0300
     * @tc.number SUB_Ability_AbilityBase_NativeChildProcess_UnRegisterNativeChildProcessExitCallback_0300
     * @tc.desc   Test UnregisterNativeChildProcessExitCallback and return the error code that there is no callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_UnRegisterNativeChildProcessExitCallback_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_UnRegisterNativeChildProcessExitCallback_0300`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.UnregisterNativeChildProcessExitCallbackNotExist();
          expect(16010009).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_DestroyWant_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_DestroyWant_0100
     * @tc.desc   Testing DestroyWant returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_DestroyWant_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_DestroyWant_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.DestroyWantNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_SetWantElement_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_SetWantElement_0100
     * @tc.desc   Testing SetWantElement returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_SetWantElement_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_SetWantElement_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetWantElementNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_GetWantElement_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_GetWantElement_0100
     * @tc.desc   Testing GetWantElement returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_GetWantElement_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_GetWantElement_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetWantElementNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_SetWantCharParam_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_SetWantCharParam_0100
     * @tc.desc   Testing SetWantCharParam returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_SetWantCharParam_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_SetWantCharParam_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetWantCharParamNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_GetWantCharParam_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_GetWantCharParam_0100
     * @tc.desc   Testing GetWantCharParam returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_GetWantCharParam_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_GetWantCharParam_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetWantCharParamNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_AddWantFd_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_AddWantFd_0100
     * @tc.desc   Testing AddWantFd returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_AddWantFd_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_AddWantFd_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AddWantFdNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_SetWantUri_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_SetWantUri_0100
     * @tc.desc   Testing SetWantUri returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_SetWantUri_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_SetWantUri_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetWantUriNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_GetWantUri_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_GetWantUri_0100
     * @tc.desc   Testing GetWantUri returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_GetWantUri_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_GetWantUri_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetWantUriNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_SetWantInt32Param_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_SetWantInt32Param_0100
     * @tc.desc   Testing SetWantInt32Param returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_SetWantInt32Param_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_SetWantInt32Param_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetWantInt32ParamNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_GetWantInt32Param_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_GetWantInt32Param_0100
     * @tc.desc   Testing GetWantInt32Param returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_GetWantInt32Param_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_GetWantInt32Param_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetWantInt32ParamNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_SetWantBoolParam_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_SetWantBoolParam_0100
     * @tc.desc   Testing SetWantBoolParam returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_SetWantBoolParam_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_SetWantBoolParam_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetWantBoolParamNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_GetWantBoolParam_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_GetWantBoolParam_0100
     * @tc.desc   Testing GetWantBoolParam returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_GetWantBoolParam_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_GetWantBoolParam_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetWantBoolParamNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_SetWantDoubleParam_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_SetWantDoubleParam_0100
     * @tc.desc   Testing SetWantDoubleParam returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_SetWantDoubleParam_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_SetWantDoubleParam_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetWantDoubleParamNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityBase_GetWantDoubleParam_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityBase_GetWantDoubleParam_0100
     * @tc.desc   Testing GetWantDoubleParam returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityBase_GetWantDoubleParam_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityBase_GetWantDoubleParam_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetWantDoubleParamNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl2_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl2_0100
     * @tc.desc   Testing AbilityRuntimeAreaModeEl2 returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl2_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl2_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeAreaModeEl2Code();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl3_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl3_0100
     * @tc.desc   Testing AbilityRuntimeAreaModeEl3 returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl3_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl3_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeAreaModeEl3Code();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl4_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl4_0100
     * @tc.desc   Testing AbilityRuntimeAreaModeEl4 returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl4_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl4_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeAreaModeEl4Code();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl5_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl5_0100
     * @tc.desc   Testing AbilityRuntimeAreaModeEl5 returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl5_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeAreaModeEl5_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeAreaModeEl5Code();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeHideUponStart_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeHideUponStart_0100
     * @tc.desc   Testing AbilityRuntimeHideUponStart returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeHideUponStart_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeHideUponStart_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeHideUponStartCode();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_DestroyStartOptions_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_DestroyStartOptions_0100
     * @tc.desc   Testing DestroyStartOptions returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_DestroyStartOptions_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_DestroyStartOptions_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.DestroyStartOptionsNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowMode_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowMode_0100
     * @tc.desc   Testing SetStartOptionsWindowMode returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowMode_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowMode_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsWindowModeNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowMode_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowMode_0100
     * @tc.desc   Testing GetStartOptionsWindowMode returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowMode_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowMode_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsWindowModeNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsDisplayId_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsDisplayId_0100
     * @tc.desc   Testing SetStartOptionsDisplayId returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsDisplayId_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsDisplayId_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsDisplayIdNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsDisplayId_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsDisplayId_0200
     * @tc.desc   Testing SetStartOptionsDisplayId returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsDisplayId_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsDisplayId_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsDisplayIdParamInvalid();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsDisplayId_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsDisplayId_0100
     * @tc.desc   Testing GetStartOptionsDisplayId returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsDisplayId_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsDisplayId_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsDisplayIdNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWithAnimation_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWithAnimation_0100
     * @tc.desc   Testing SetStartOptionsWithAnimation returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWithAnimation_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWithAnimation_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsWithAnimationNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWithAnimation_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWithAnimation_0100
     * @tc.desc   Testing GetStartOptionsWithAnimation returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWithAnimation_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWithAnimation_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsWithAnimationNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowLeft_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowLeft_0100
     * @tc.desc   Testing SetStartOptionsWindowLeft returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowLeft_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowLeft_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsWindowLeftNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowLeft_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowLeft_0100
     * @tc.desc   Testing GetStartOptionsWindowLeft returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowLeft_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowLeft_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsWindowLeftNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowTop_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowTop_0100
     * @tc.desc   Testing SetStartOptionsWindowTop returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowTop_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowTop_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsWindowTopNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowTop_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowTop_0100
     * @tc.desc   Testing GetStartOptionsWindowTop returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowTop_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowTop_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsWindowTopNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowHeight_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowHeight_0100
     * @tc.desc   Testing SetStartOptionsWindowHeight returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowHeight_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowHeight_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsWindowHeightNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowHeight_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowHeight_0100
     * @tc.desc   Testing GetStartOptionsWindowHeight returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowHeight_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowHeight_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsWindowHeightNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowWidth_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowWidth_0100
     * @tc.desc   Testing SetStartOptionsWindowWidth returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowWidth_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsWindowWidth_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsWindowWidthNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowWidth_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowWidth_0100
     * @tc.desc   Testing GetStartOptionsWindowWidth returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowWidth_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsWindowWidth_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsWindowWidthNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartVisibility_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartVisibility_0100
     * @tc.desc   Testing SetStartOptionsStartVisibility returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartVisibility_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartVisibility_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsStartVisibilityNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartVisibility_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartVisibility_0100
     * @tc.desc   Testing GetStartOptionsStartVisibility returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartVisibility_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartVisibility_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsStartVisibilityNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartWindowIcon_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartWindowIcon_0100
     * @tc.desc   Testing SetStartOptionsStartWindowIcon returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartWindowIcon_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartWindowIcon_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsStartWindowIconNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartWindowIcon_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartWindowIcon_0100
     * @tc.desc   Testing GetStartOptionsStartWindowIcon returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartWindowIcon_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartWindowIcon_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsStartWindowIconNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartWindowBackgroundColor_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartWindowBackgroundColor_0100
     * @tc.desc   Testing SetStartOptionsStartWindowBackgroundColor returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartWindowBackgroundColor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsStartWindowBackgroundColor_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsStartWindowBackgroundColorNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartWindowBackgroundColor_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartWindowBackgroundColor_0100
     * @tc.desc   Testing GetStartOptionsStartWindowBackgroundColor returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartWindowBackgroundColor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsStartWindowBackgroundColor_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsStartWindowBackgroundColorNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsSupportedWindowModes_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsSupportedWindowModes_0100
     * @tc.desc   Testing SetStartOptionsSupportedWindowModes returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsSupportedWindowModes_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsSupportedWindowModes_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsSupportedWindowModesNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsSupportedWindowModes_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsSupportedWindowModes_0100
     * @tc.desc   Testing GetStartOptionsSupportedWindowModes returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsSupportedWindowModes_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsSupportedWindowModes_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsSupportedWindowModesNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMinWindowWidth_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMinWindowWidth_0100
     * @tc.desc   Testing SetStartOptionsMinWindowWidth returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMinWindowWidth_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMinWindowWidth_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsMinWindowWidthNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowWidth_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowWidth_0100
     * @tc.desc   Testing GetStartOptionsMinWindowWidth returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowWidth_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowWidth_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsMinWindowWidthNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMaxWindowWidth_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMaxWindowWidth_0100
     * @tc.desc   Testing SetStartOptionsMaxWindowWidth returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMaxWindowWidth_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMaxWindowWidth_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsMaxWindowWidthNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMaxWindowWidth_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMaxWindowWidth_0100
     * @tc.desc   Testing GetStartOptionsMaxWindowWidth returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMaxWindowWidth_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMaxWindowWidth_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsMaxWindowWidthNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMinWindowHeight_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMinWindowHeight_0100
     * @tc.desc   Testing SetStartOptionsMinWindowHeight returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMinWindowHeight_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMinWindowHeight_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsMinWindowHeightNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowHeight_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowHeight_0100
     * @tc.desc   Testing GetStartOptionsMinWindowHeight returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowHeight_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowHeight_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsMinWindowHeightNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowHeight_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowHeight_0200
     * @tc.desc   Testing GetStartOptionsMinWindowHeight returns an invalid parameter error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowHeight_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMinWindowHeight_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsMinWindowHeightParamInvalid();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMaxWindowHeight_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMaxWindowHeight_0100
     * @tc.desc   Testing SetStartOptionsMaxWindowHeight returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMaxWindowHeight_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_SetStartOptionsMaxWindowHeight_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.SetStartOptionsMaxWindowHeightNoError();
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
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMaxWindowHeight_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMaxWindowHeight_0100
     * @tc.desc   Testing GetStartOptionsMaxWindowHeight returns a correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMaxWindowHeight_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_GetStartOptionsMaxWindowHeight_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.GetStartOptionsMaxWindowHeightNoError();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })
  })
}
