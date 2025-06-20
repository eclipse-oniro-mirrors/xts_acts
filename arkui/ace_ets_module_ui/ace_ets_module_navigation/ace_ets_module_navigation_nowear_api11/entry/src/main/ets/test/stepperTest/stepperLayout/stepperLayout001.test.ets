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

export default function stepperLayout001() {
  describe('stepperLayout001', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
              let driver: Driver = Driver.create();
  let size = await driver.getDisplaySize();
  
  if (size.x != 466 && size.y != 466) {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperLayout/stepperLayout001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stepperLayout001 state success " + JSON.stringify(pages));
        if (!("stepperLayout001" == pages.name)) {
          console.info("get stepperLayout001 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push stepperLayout001 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stepperLayout001 page error: " + err);
      }
  }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperLayout001 after each called");
    });

    /*
     * @tc.number       SUB_ACE_UI_COMPONENT_NAV_STEPPER_LAYOUT_0010
     * @tc.name         stepperLayout0010
     * @tc.desic         stepperLayout0010
     */
    it('stepperLayout0010',  Level.LEVEL0, async (done: Function) => {
      console.info('stepperLayout0010 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('stepper1');
      console.info("[stepperLayout0010] component status strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Stepper');
      expect(JSON.parse(strJson).$attrs.width).assertEqual('200.00vp');
      expect(JSON.parse(strJson).$attrs.height).assertEqual('300.00vp');
      console.info("[stepperLayout0010] status value :" + JSON.parse(strJson).$attrs.status);
      done();
    });
  })
}
