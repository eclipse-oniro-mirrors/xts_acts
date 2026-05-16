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

    /**
     * @tc.name   stepperLayout0010
     * @tc.number stepperLayout0010
     * @tc.desc   stepperLayout0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stepperLayout0010',  Level.LEVEL0, async (done: Function) => {
      console.info('stepperLayout0010 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('stepper1');
      console.info("[stepperLayout0010] component status strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Stepper');
      console.info("stepperLayout0010 obj width is: ", JSON.parse(strJson).$attrs.width)
      console.info("stepperLayout0010 obj width number is: ", parseInt(JSON.parse(strJson).$attrs.width))
      expect(Math.abs(parseInt(JSON.parse(strJson).$attrs.width) - 200.00) <= 1).assertTrue();
      console.info("stepperLayout0010 obj height is: ", JSON.parse(strJson).$attrs.height)
      console.info("stepperLayout0010 obj height number is: ", parseInt(JSON.parse(strJson).$attrs.height))
      expect(Math.abs(parseInt(JSON.parse(strJson).$attrs.height) - 300.00) <= 1).assertTrue();
      console.info("[stepperLayout0010] status value :" + JSON.parse(strJson).$attrs.status);
      done();
    });
  })
}
