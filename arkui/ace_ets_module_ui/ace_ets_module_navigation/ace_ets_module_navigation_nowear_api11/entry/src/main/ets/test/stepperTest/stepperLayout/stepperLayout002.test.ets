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
import Utils from '../../../MainAbility/common/Utils';
import { Driver, } from '@ohos.UiTest';

export default function stepperLayout002() {
  describe('stepperLayout002', () => {
    beforeEach(async (done: Function) => {
              let driver: Driver = Driver.create();
  let size = await driver.getDisplaySize();
  if (size.x != 466 && size.y != 466) {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperLayout/stepperLayout002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stepperLayout002 state success " + JSON.stringify(pages));
        if (!("stepperLayout002" == pages.name)) {
          console.info("get stepperLayout002 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push stepperLayout002 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stepperLayout002 page error: " + err);
      }
  }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperLayout002 after each called");
    });

    /*
     * @tc.number       SUB_ACE_UI_COMPONENT_NAV_STEPPER_LAYOUT_0020
     * @tc.name         stepperLayout0020
     * @tc.desic         stepperLayout0020
     */
    it('stepperLayout0020',  Level.LEVEL0, async (done: Function) => {
      console.info('stepperLayout0020 START');
      await Utils.sleep(2000);
      let stepperJson: string = getInspectorByKey('stepper2');
      let flexJson: string = getInspectorByKey('flex');
      console.info("[stepperLayout0020] component status stepperJson:" + stepperJson);
      expect(JSON.parse(stepperJson).$type).assertEqual('Stepper');
      expect(JSON.parse(flexJson).$type).assertEqual('Flex');
      expect(JSON.parse(stepperJson).$attrs.width).assertEqual(JSON.parse(flexJson).$attrs.width);
      expect(JSON.parse(stepperJson).$attrs.height).assertEqual(JSON.parse(flexJson).$attrs.height);
      console.info("[stepperLayout0020] status value :" + JSON.parse(stepperJson).$attrs.status);
      done();
    });
  })
}
