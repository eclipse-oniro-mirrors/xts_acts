/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function stepperItem() {
  describe('stepperItemTest', () => {
    beforeEach(async (done: Function) => {
      console.info("stepperItemJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepperItem',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get stepperItem state pages: " + JSON.stringify(pages));
        if (!("stepperItem" == pages.name)) {
          console.info("get stepperItem state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push stepperItem page error: " + err);
      }
      done()
    })

    /**
     * @tc.number ArkUX_Stage_StepperItem_0100
     * @tc.name Test the properties of components
     * @tc.desc Set nextLabel values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_StepperItem_0100', 0, async (done: Function) => {
      console.info('[ArkUX_Stage_StepperItem_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('nextLabel1');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_StepperItem_0100 is" + JSON.stringify(obj.$attrs.nextLabel));
          expect(obj.$attrs.nextLabel).assertEqual("textLabel");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_StepperItem_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_StepperItem_0200
     * @tc.name Test the properties of components
     * @tc.desc Set nextLabel values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_StepperItem_0200', 0, async (done: Function) => {
      console.info('[ArkUX_Stage_StepperItem_0200] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJson = getInspectorByKey('nextLabel1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("----ArkUX_Stage_StepperItem_0200 is" + JSON.stringify(obj.$attrs.nextLabel));
      expect(obj.$attrs.nextLabel).assertEqual("textLabel2");
      done();
    })
  })
}
