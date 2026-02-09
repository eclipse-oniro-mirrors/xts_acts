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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import testNapi from 'libentry.so';
import { commonEventManager } from '@kit.BasicServicesKit';

const TAG = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityTest';

let subscriber = commonEventManager.createSubscriberSync({
  events: ['OH_AbilityRuntime_StartSelfUIAbility_Result']
});

@Concurrent
function StartSelfUIAbilityWithPidResult(casesName: string): number {
  let result = -1;
  if(casesName == "StartSelfUIAbilityWithPidResult_0200"){
    result = testNapi.ndkStartSelfUIAbilityWithPidResult_0200();
  }
  return result
}

export default function NdkStartSelfUIAbilityWithPidResultTest() {
  describe('NdkStartSelfUIAbilityWithPidResultTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithPidResult_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithPidResult_0100
     * @tc.desc   To verify that the main thread use StartSelfUIAbilityWithPidResult will return errorCode 16000134
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithPidResult_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartSelfUIAbilityWithPidResult_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(16000134);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithPidResult_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithPidResult_0200
     * @tc.desc   To verify that the child thread use StartSelfUIAbilityWithPidResult will return errorCode 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithPidResult_0200', Level.LEVEL3, async (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithPidResult_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      commonEventManager.subscribe(subscriber, (err, data) => {
        hilog.info(0x0000, TAG, '%{public}s',  ` ${TEST_SUITE_NAME} ========= subscribe ` + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber,()=>{
          hilog.info(0x0000, TAG, '%{public}s',  ` ${TEST_SUITE_NAME} ========= unsubscribe callback`);
          done();
        });
      });
      let task1: taskpool.Task = new taskpool.Task(StartSelfUIAbilityWithPidResult, "StartSelfUIAbilityWithPidResult_0200");
      await taskpool.execute(task1).then((value: Object) => {
        hilog.info(0x0000, TAG, TEST_SUITE_NAME + 'taskpool result: %{public}s ', JSON.stringify(value));
        if(value == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          expect(value).assertEqual(801);
          done();
        }else{
          expect(value).assertEqual(0);
        }
      });
    })
  })
}