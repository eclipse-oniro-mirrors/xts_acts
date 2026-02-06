/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { AtomicServiceOptions, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';
import { FailureCode } from '@ohos.app.ability.CompletionHandlerForAtomicService';

let context: common.UIAbilityContext;
const MALFUNCTION_MSG: string = 'A system error occurred';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() =>{
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext;
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_CompletionHandlerForAtomicService_0100
     * @tc.name: SUB_Ability_AbilityRuntime_CompletionHandlerForAtomicService_0100
     * @tc.desc: UIAbilityContext openAtomicService.
     */
    it('SUB_Ability_AbilityRuntime_CompletionHandlerForAtomicService_0100', Level.LEVEL0, (done: Function) => {
      const tcNumber = `SUB_Ability_AbilityRuntime_CompletionHandlerForAtomicService_0100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      let tag: string = 'UIAbilityContext.openAtomicService';
      let options: AtomicServiceOptions = {
        displayId: 0,
        completionHandlerForAtomicService:
        {
          onAtomicServiceRequestSuccess(appId) {
            hilog.info(0x0000, 'testTag',
              `UIAbilityContext.openAtomicService onAtomicServiceRequestSuccess appId:${appId}`);
          },
          onAtomicServiceRequestFailure(appId, failureCode, failureMessage) {
            hilog.info(0x0000, 'testTag',
              `UIAbilityContext.openAtomicService onAtomicServiceRequestFailure appId:${appId},
              failureCode:${FailureCode[failureCode]}, failureMessage:${failureMessage}`);
            expect(failureCode === FailureCode.FAILURE_CODE_USER_CANCEL).assertFalse();
            expect(failureCode === FailureCode.FAILURE_CODE_USER_REFUSE).assertFalse();
            expect(failureCode).assertEqual(FailureCode.FAILURE_CODE_SYSTEM_MALFUNCTION);
            expect(failureMessage).assertEqual(MALFUNCTION_MSG);
            done();
          }
        }
      };

      try {
        context.openAtomicService(undefined, options)
          .then((result: common.AbilityResult) => {
            hilog.info(0x0000, 'testTag', `${tag} succeed:${JSON.stringify(result)}`);
          })
          .catch((err: BusinessError<void>) => {
            hilog.error(0x0000, 'testTag', `${tag} error:${JSON.stringify(err)}`);
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${tag} failed:${JSON.stringify(err)}`);
        expect((err as BusinessError).code).assertEqual(401);
        done();
      }
    })
  })
}