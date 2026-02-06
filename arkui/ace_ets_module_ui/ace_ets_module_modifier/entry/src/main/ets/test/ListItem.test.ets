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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import Utils from './Utils'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

export default function listItemJsunit() {
  describe('listItemTest', () => {
    beforeAll(async (done: Function) => {
      console.info("listItemTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/listItem',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get list_item state success " + JSON.stringify(pages));
        if (!("listItem" == pages.name)) {
          console.info("get list_item state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push list_item page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testList_item00051
     * @tc.name Test the properties of components
     * @tc.desc Set selected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testList_item00051', Level.LEVEL0, async (done: Function) => {
      console.info('select testList_item00051 START');
      let driver = Driver.create();
      let item = await driver.findComponent(ON.id('ListItemKey1'));
      let re = await item.isSelected();
      expect(re).assertEqual(true);
      console.info('select testList_item00051 END');
      done();
    });

    /**
     * @tc.number testList_item00052
     * @tc.name Test the properties of components
     * @tc.desc Set selectable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testList_item00052', Level.LEVEL0, async (done: Function) => {
      console.info('select testList_item00052 START');
      let strJson = getInspectorByKey('ListItemKey1');
      console.info("[testList_item00052] obj " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.selectable).assertEqual(true);
      console.info('select testList_item00052 END');
      done();
    });

    /**
     * @tc.number testList_item00053
     * @tc.name Test the properties of components
     * @tc.desc Change selectable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testList_item00053', Level.LEVEL0, async (done: Function) => {
      console.info('testList_item00053 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('ListItemKey1'); //测试组件的key名称
      console.info("testList_item00053 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.selectable).assertEqual(false);
      console.info('testList_item00053 END');
      done();
    });
  })
}
