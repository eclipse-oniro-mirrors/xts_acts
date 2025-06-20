/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'

export default function stepperItemDisabledJsunit() {
  describe('stepperItemDisabledTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperItem',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stepperItem state success " + JSON.stringify(pages));
        if (!("stepperItem" == pages.name)) {
          console.info("get stepperItem state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push stepperItem page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stepperItem page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperItemDisabled after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         teststepperItemDisabled0001
     * @tc.desic         acestepperItemDisabledEtsTest0001
     */
    it('teststepperItemDisabled0001',  Level.LEVEL0, async (done: Function) => {
      console.info('stepperItemDisabled teststepperItemDisabled0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('StepperItem');
      console.info("[teststepperItemDisabled0001] component status strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('StepperItem');
      expect(JSON.parse(strJson).$attrs.status).assertEqual("ItemState.Disabled");
      console.info("[teststepperItemDisabled0001] status value :" + JSON.parse(strJson).$attrs.status);
      done();
    });
  })
}
