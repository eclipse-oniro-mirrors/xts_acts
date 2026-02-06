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

export default function stepperLayout004() {
  describe('stepperLayout004', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperLayout/stepperLayout004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stepperLayout004 state success " + JSON.stringify(pages));
        if (!("stepperLayout004" == pages.name)) {
          console.info("get stepperLayout004 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push stepperLayout004 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stepperLayout004 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepperLayout004 after each called");
    });

    /*
     * @tc.number       SUB_ACE_UI_COMPONENT_NAV_STEPPER_LAYOUT_0040
     * @tc.name         stepperLayout0040
     * @tc.desic         stepperLayout0040
     */
    it('stepperLayout0040',  Level.LEVEL0, async (done: Function) => {
      console.info('stepperLayout0040 START');
      await Utils.sleep(2000);
      let stepperJson: string = getInspectorByKey('stepper4');
      let columnJson: string = getInspectorByKey('column2');
      console.info("[stepperLayout0040] component status stepperJson:" + stepperJson);
      expect(JSON.parse(stepperJson).$type).assertEqual('Stepper');
      expect(JSON.parse(columnJson).$type).assertEqual('Column');
      expect(JSON.parse(stepperJson).$attrs.width).assertEqual(JSON.parse(columnJson).$attrs.width);
      expect(JSON.parse(stepperJson).$attrs.height).assertEqual('600.00vp');
      console.info("[stepperLayout0040] status value :" + JSON.parse(stepperJson).$attrs.status);
      done();
    });
  })
}
