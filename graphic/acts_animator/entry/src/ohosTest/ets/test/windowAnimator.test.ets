/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import animator, { AnimatorResult } from '@ohos.animator';

export default function windowAnimatorTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage, abilityStorage: LocalStorage) {
  console.log('windowTest context: ' + JSON.stringify(context))
  console.log('windowTest abilityStorage: ' + JSON.stringify(abilityStorage))
  describe('windowAnimator_test', () => {
    console.log('describe window_api_test start!!!')

    /**
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3970
     * @tc.name test_SetExpectedFrameRateRange
     * @tc.desc Test the function of SetExpectedFrameRateRange Promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetExpectedFrameRateRange', 0, async (done: Function) => {

      let msg = "test_SetExpectedFrameRateRange"
      console.log(msg + ' begin')
      try {
        let animatorResult: AnimatorResult | undefined = animator.create({
          duration: 2000,
          easing: "ease",
          delay: 0,
          fill: "forwards",
          direction: "normal",
          iterations: 1,
          begin: 100,
          end: 200
        })
        let expectedFrameRate: ExpectedFrameRateRange = {
          min: 0,
          max: 120,
          expected: 30
        }
        animatorResult.setExpectedFrameRateRange(expectedFrameRate);
        console.info(msg + 'Succeeded in loading the content.');
        expect(true).assertTrue()
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

  })
}
