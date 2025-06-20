/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import Utils from './Utils';

export default function menuItemJsunit() {
  describe('menuItemTest', () => {
    beforeEach(async (done: Function) => {
      console.info("menuItemJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menuItem',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get menuItem state pages: " + JSON.stringify(pages));
        if (!("menuItem" == pages.name)) {
          console.info("get menuItem state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push menuItem page error: " + err);
      }
      done();
    })


    /**
     * @tc.number menuItemJsunit01
     * @tc.name Test the properties of components
     * @tc.desc Set size values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('menuItemJsunit01', 0, async (done: Function) => {
      console.info('[menuItemJsunit01] START');
      let strJson = getInspectorByKey('menuItem_options1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[menuItemJsunit01] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentFont.size).assertEqual("10.00fp");
      console.info('[menuItemJsunit01] END');
      done();
    });

    /**
     * @tc.number menuItemJsunit02
     * @tc.name Test the properties of components
     * @tc.desc Set contentFontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('menuItemJsunit02', 0, async (done: Function) => {
      console.info('[menuItemJsunit02] START');
      let strJson = getInspectorByKey('menuItem_options1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[menuItemJsunit02] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contentFontColor).assertEqual("#FF0000FF");
      console.info('[menuItemJsunit02] END');
      done();
    });

    /**
     * @tc.number menuItemJsunit03
     * @tc.name Test the properties of components
     * @tc.desc Set labelFont values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('menuItemJsunit03', 0, async (done: Function) => {
      console.info('[menuItemJsunit03] START');
      let strJson = getInspectorByKey('menuItem_options1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[menuItemJsunit03] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.labelFont?.size).assertEqual("15.00fp");
      console.info('[menuItemJsunit03] END');
      done();
    });

    /**
     * @tc.number menuItemJsunit04
     * @tc.name Test the properties of components
     * @tc.desc Set labelFontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('menuItemJsunit04', 0, async (done: Function) => {
      console.info('[menuItemJsunit04] START');
      let strJson = getInspectorByKey('menuItem_options1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[menuItemJsunit04] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.labelFontColor).assertEqual("#FFFF0000");
      console.info('[menuItemJsunit04] END');
      done();
    });

    /**
     * @tc.number menuItemJsunit05
     * @tc.name Test the properties of components
     * @tc.desc Set attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('menuItemJsunit05', 0, async (done: Function) => {
      console.info('[menuItemJsunit05] START');
      let driver = Driver.create();
      let menuItem = await driver.findComponent(ON.id('menuItem_options1'));
      let re = await menuItem.isSelected();
      expect(re).assertEqual(true);
      console.info('[menuItemJsunit05] END');
      done();
    });

    /**
     * @tc.number menuItemJsunit06
     * @tc.name Test the properties of components
     * @tc.desc Set attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('menuItemJsunit06', 0, async (done: Function) => {
      console.info('[menuItemJsunit06] START');
      let strJson = getInspectorByKey('menuItem_options1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[menuItemJsunit06] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.selectIcon).assertEqual("true");
      console.info('[menuItemJsunit06] END');
      done();
    });

    /**
     * @tc.number menuItemJsunit07
     * @tc.name Test the properties of components
     * @tc.desc Change labelFontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('menuItemJsunit07', 0, async (done: Function) => {

      console.info('menuItemJsunit07 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('menuItem_options1');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("menuItemJsunit07 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.labelFontColor).assertEqual("#FFFFA500");
      console.info('menuItemJsunit07 END');
      done();
    });

  })
}
