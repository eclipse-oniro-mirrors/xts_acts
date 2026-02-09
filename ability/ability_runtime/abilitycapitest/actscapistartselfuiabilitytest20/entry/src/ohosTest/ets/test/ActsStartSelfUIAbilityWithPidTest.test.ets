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
import taskpool from '@ohos.taskpool';
import hilog from '@ohos.hilog';

const ABILITY_ERR_OK = 0;
const TAG = 'testTag';

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

@Concurrent
function StartSelfUIAbilityWithPidResult(casesName: string): number {
  let result = -1;
  if(casesName == "StartSelfUIAbilityWithPidResult_0200"){
    result = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsNoError();
  }
  if(casesName == "StartSelfUIAbilityWithPidResult_0100"){
    result = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsInstanceKeyNotSupport();
  }
  if(casesName == "StartSelfUIAbilityWithPidResult_0300"){
    result = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsUpperLimitReached();
  }
  if(casesName == "StartSelfUIAbilityWithPidResult_0400"){
    result = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsNoSuchAbility();
  }
  if(casesName == "StartSelfUIAbilityWithPidResult_0500"){
    result = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsCodeCrossApp();
  }
  if(casesName == "StartSelfUIAbilityWithPidResult_0600"){
    result = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsCodeInternal();
  }
  if(casesName == "StartSelfUIAbilityWithPidResult_0700"){
    result = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsInvalidAppInstanceKey();
  }
  if(casesName == "StartSelfUIAbilityWithPidResult_0800"){
    result = AbilityKitTest.StartSelfUIAbilityWithPidWithStartOptionsVisibilitySettingDisabled();
  }
  return result
}

export default function ActsStartSelfUIAbilityWithPidTest() {
  describe('ActsStartSelfUIAbilityWithPidTest', () => {
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0200
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0200
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return the correct code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          await sleep(2000)
          let task1: taskpool.Task = new taskpool.Task(StartSelfUIAbilityWithPidResult, "StartSelfUIAbilityWithPidResult_0200");
          await taskpool.execute(task1).then((value: Object) => {
            hilog.info(0x0000, TAG, LOG_NAME + 'taskpool result: %{public}s ', JSON.stringify(value));
            if(value == 801){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(801).assertEqual(value);
              done();
              return;
            }
            expect(0).assertEqual(value);
            console.info(`====>${LOG_NAME} result: ` + value);
            done();
          });
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

      
    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0100
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000079.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let task1: taskpool.Task = new taskpool.Task(StartSelfUIAbilityWithPidResult, "StartSelfUIAbilityWithPidResult_0100");
          await taskpool.execute(task1).then((value: Object) => {
            hilog.info(0x0000, TAG, LOG_NAME + 'taskpool result: %{public}s ', JSON.stringify(value));
            if(value == 801){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(801).assertEqual(value);
              done();
              return;
            }
            if(value == 16000078){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(16000078).assertEqual(value);
              done();
              return;
            }
            expect(16000079).assertEqual(value);
            console.info(`====>${LOG_NAME} result: ` + value);
            done();
          });

        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0300
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0300
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000077.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0300`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let task1: taskpool.Task = new taskpool.Task(StartSelfUIAbilityWithPidResult, "StartSelfUIAbilityWithPidResult_0300");
          await taskpool.execute(task1).then((value: Object) => {
            hilog.info(0x0000, TAG, LOG_NAME + 'taskpool result: %{public}s ', JSON.stringify(value));
            if(value == 801){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(801).assertEqual(value);
              done();
              return;
            }
            if(value == 16000078){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(16000078).assertEqual(value);
              done();
              return;
            }
            expect(16000077).assertEqual(value);
            console.info(`====>${LOG_NAME} result: ` + value);
            done();
          });
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0400
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0400
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0400`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let task1: taskpool.Task = new taskpool.Task(StartSelfUIAbilityWithPidResult, "StartSelfUIAbilityWithPidResult_0400");
          await taskpool.execute(task1).then((value: Object) => {
            hilog.info(0x0000, TAG, LOG_NAME + 'taskpool result: %{public}s ', JSON.stringify(value));
            if(value == 801){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(801).assertEqual(value);
              done();
              return;
            }
            expect(16000001).assertEqual(value);
            console.info(`====>${LOG_NAME} result: ` + value);
            done();
          });
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0500
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0500
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000018.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0500`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let task1: taskpool.Task = new taskpool.Task(StartSelfUIAbilityWithPidResult, "StartSelfUIAbilityWithPidResult_0500");
          await taskpool.execute(task1).then((value: Object) => {
            hilog.info(0x0000, TAG, LOG_NAME + 'taskpool result: %{public}s ', JSON.stringify(value));
            if(value == 801){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(801).assertEqual(value);
              done();
              return;
            }
            expect(16000018).assertEqual(value);
            console.info(`====>${LOG_NAME} result: ` + value);
            done();
          });
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0600
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0600
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0600`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let task1: taskpool.Task = new taskpool.Task(StartSelfUIAbilityWithPidResult, "StartSelfUIAbilityWithPidResult_0600");
          await taskpool.execute(task1).then((value: Object) => {
            hilog.info(0x0000, TAG, LOG_NAME + 'taskpool result: %{public}s ', JSON.stringify(value));
            if(value == 801){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(801).assertEqual(value);
              done();
              return;
            }
            expect(16000050).assertEqual(value);
            console.info(`====>${LOG_NAME} result: ` + value);
            done();
          });
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0700
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0700
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000076.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0700`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let task1: taskpool.Task = new taskpool.Task(StartSelfUIAbilityWithPidResult, "StartSelfUIAbilityWithPidResult_0700");
          await taskpool.execute(task1).then((value: Object) => {
            hilog.info(0x0000, TAG, LOG_NAME + 'taskpool result: %{public}s ', JSON.stringify(value));
            if(value == 801){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(801).assertEqual(value);
              done();
              return;
            }
            if(value == 16000078){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(16000078).assertEqual(value);
              done();
              return;
            }
            expect(16000076).assertEqual(value);
            console.info(`====>${LOG_NAME} result: ` + value);
            done();
          });
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0800
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0800
     * @tc.desc   Test OH_AbilityRuntime_StartSelfUIAbilityWithPidResult and return 16000067.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithPidResult_0800`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let task1: taskpool.Task = new taskpool.Task(StartSelfUIAbilityWithPidResult, "StartSelfUIAbilityWithPidResult_0800");
          await taskpool.execute(task1).then((value: Object) => {
            hilog.info(0x0000, TAG, LOG_NAME + 'taskpool result: %{public}s ', JSON.stringify(value));
            if(value == 801){
              console.info(`====>${LOG_NAME} result: ` + value);
              expect(801).assertEqual(value);
              done();
              return;
            }
            expect(16000067).assertEqual(value);
            console.info(`====>${LOG_NAME} result: ` + value);
            done();
          });
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

  })
}