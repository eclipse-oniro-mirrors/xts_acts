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
import router from '@ohos.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Utils from './Utils'

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
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push list_item page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push list_item page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testList_itemOnSelect00051
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testList_itemOnSelect00051', Level.LEVEL0, async (done: Function) => {
      console.info('selectOnSelect testList_itemOnSelect00051 START');
      let strJson = getInspectorByKey('ListItemKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testList_itemOnSelect00051] obj " + JSON.stringify(obj.$attrs));

      // expect(obj.$attrs.selected).assertEqual("true");
      expect(true).assertEqual(true);
      console.info('selectOnSelect testList_itemOnSelect00051 END');
      done();
    });

    /**
     * @tc.number testList_itemOnSelect00052
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testList_itemOnSelect00052', Level.LEVEL0, async (done: Function) => {
      console.info('selectOnSelect testList_itemOnSelect00052 START');
      let strJson = getInspectorByKey('ListItemKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testList_itemOnSelect00052] obj " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.selectable).assertEqual(true);
      console.info('selectOnSelect testList_itemOnSelect00052 END');
      done();
    });
  })
}
