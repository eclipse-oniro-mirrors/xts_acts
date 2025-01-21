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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from './Utils'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

export default function datePickerJsunit() {
  describe('datePickerTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePicker',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get datePicker state success " + JSON.stringify(pages));
        if (!("datePicker" == pages.name)) {
          console.info("get datePicker state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push datePicker page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testDatePicker0021
     * @tc.name Test the properties of components
     * @tc.desc Set lunar values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDatePicker0021', 0, async (done: Function) => {
      console.info('[testDatePicker0021] START');
      let strJson = getInspectorByKey('DatePicker');
      console.info("[testDatePicker] obj is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.lunar).assertEqual('true');
      console.info('[testDatePicker0021] END');
      done();
    });

    /**
     * @tc.number testDatePicker0022
     * @tc.name Test the properties of components
     * @tc.desc Set selectedTextStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDatePicker0022', 0, async (done: Function) => {
      console.info('[testDatePicker0022] START');
      let strJson = getInspectorByKey('DatePicker');
      console.info("[testDatePicker] obj is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      let selectedTextStyle: ESObject = JSON.parse(strJson).$attrs.selectedTextStyle;
      expect(selectedTextStyle['color']).assertEqual("#FF182431");
      expect(selectedTextStyle['font'].size).assertEqual("18.00fp");
      expect(selectedTextStyle['font'].weight).assertEqual("FontWeight.Normal");
      console.info('[testDatePicker0022] END');
      done();
    });

    /**
     * @tc.number testDatePicker0023
     * @tc.name Test the properties of components
     * @tc.desc Set textStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDatePicker0023', 0, async (done: Function) => {
      console.info('[testDatePicker0023] START');
      let strJson = getInspectorByKey('DatePicker');
      console.info("[testDatePicker] obj is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      let textStyle: ESObject = JSON.parse(strJson).$attrs.textStyle;

      expect(textStyle['color']).assertEqual("#FF0000FF");
      expect(textStyle['font'].size).assertEqual("26.00fp");
      expect(textStyle['font'].weight).assertEqual("FontWeight.Normal");
      console.info('[testDatePicker0023] END');
      done();
    });

    /**
     * @tc.number testDatePicker0024
     * @tc.name Test the properties of components
     * @tc.desc Set disappearTextStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDatePicker0024', 0, async (done: Function) => {
      console.info('[testDatePicker0024] START');
      let strJson = getInspectorByKey('DatePicker');
      console.info("[testDatePicker] obj is : " + JSON.stringify(JSON.parse(strJson).$attrs));
      let disappearTextStyle: ESObject = JSON.parse(strJson).$attrs.disappearTextStyle;

      expect(disappearTextStyle['color']).assertEqual('#FF000000');
      expect(disappearTextStyle['font'].size).assertEqual('8.00fp');
      expect(disappearTextStyle['font'].weight).assertEqual('FontWeight.Lighter');
      console.info('[testDatePicker0024] END');
      done();
    });

    /**
     * @tc.number testDatePicker0025
     * @tc.name Test the properties of components
     * @tc.desc Change textStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testDatePicker0025', 0, async (done: Function) => {
      console.info('testDatePicker0025 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('DatePicker');
      console.info("testDatePicker0025 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      let textStyle: ESObject = JSON.parse(strJsonNew).$attrs.textStyle;
      expect(textStyle['font'].size).assertEqual("27.00fp");
      console.info('testDatePicker0025 END');
      done();
    });
  })
}
