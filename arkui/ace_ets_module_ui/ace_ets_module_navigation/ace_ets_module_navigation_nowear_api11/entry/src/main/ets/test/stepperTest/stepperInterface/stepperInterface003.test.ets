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

export default function stepperInterface003() {
  describe('stepperInterface003', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperInterface/stepperInterface003',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stepperInterface003 state success " + JSON.stringify(pages));
        if (!("stepperInterface003" == pages.name)) {
          console.info("get stepperInterface003 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push stepperInterface003 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stepperInterface003 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperInterface003 after each called");
    });

    /*
     * @tc.number       SUB_ACE_UI_COMPONENT_NAV_STEPPER_INTERFACE_0030
     * @tc.name         stepperInterface0030
     * @tc.desic         stepperInterface0030
     */
    it('stepperInterface0030',  Level.LEVEL0, async (done: Function) => {
      console.info('stepperInterface0030 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('no'));
      let button: Component = await driver.findComponent(ON.text('Next'));
      await button.click();
      await driver.delayMs(1000);
      let button1: Component = await driver.findComponent(ON.text('Finish'));
      await button1.click();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('yes'));
      done();
    });
  })
}
