/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import {Driver, Component, ON} from '@ohos.UiTest';
import Utils from '../../../MainAbility/common/Utils';

export default function stepperInterface009() {
  describe('stepperInterface009', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperInterface/stepperInterface009',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stepperInterface009 state success " + JSON.stringify(pages));
        if (!("stepperInterface009" == pages.name)) {
          console.info("get stepperInterface009 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push stepperInterface009 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stepperInterface009 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperInterface009 after each called");
    });

    /*
     * @tc.number       SUB_ACE_UI_COMPONENT_NAV_STEPPER_INTERFACE_0090
     * @tc.name         stepperInterface0090
     * @tc.desic         stepperInterface0090
     */
    it('stepperInterface0090',  Level.LEVEL0, async (done: Function) => {
      console.info('stepperInterface0090 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('0'));
      let button: Component = await driver.findComponent(ON.text('Next'));
      await button.click();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('0'));
      done();
    });
  })
}
