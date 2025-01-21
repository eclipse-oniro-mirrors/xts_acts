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

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from './Utils'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

export default function listItemGroupJsunit() {
  describe('listItemGroupTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/listItemGroup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get list_item_group state success " + JSON.stringify(pages));
        if (!("listItemGroup" == pages.name)) {
          console.info("get list_item_group state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(5000);
        }
      } catch (err) {
        console.error("push list_item_group page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testList_item_group0007
     * @tc.name Test the properties of components
     * @tc.desc Set divider values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testList_item_group0007', 0, async (done: Function) => {
      console.info('testList_item_group0007 START');
      let strJson = getInspectorByKey('ListItemGroupKey1');
      let obj = JSON.parse(strJson);
      console.info("[testList_item_group0007] obj value :" + JSON.stringify(obj.$attrs));
      let divider = obj.$attrs.divider;
      console.info("[testList_item_group0007] obj divider value :" + JSON.stringify(divider));
      expect(divider.strokeWidth).assertEqual("12.00vp");
      expect(divider.startMargin).assertEqual("2.00vp");
      expect(divider.endMargin).assertEqual("2.00vp");
      expect(divider.color).assertEqual("#FF123456");
      console.info('testList_item_group0007 END');
      done();
    });

    /**
     * @tc.number testList_item_group0008
     * @tc.name Test the properties of components
     * @tc.desc Change divider values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testList_item_group0008', 0, async (done: Function) => {
      console.info('testList_item_group0008 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('ListItemGroupKey1');
      let objNew = JSON.parse(strJsonNew);
      console.info("testList_item_group0008 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.divider.strokeWidth).assertEqual("13.00vp");
      console.info('testList_item_group0008 END');
      done();
    });
  })
}
