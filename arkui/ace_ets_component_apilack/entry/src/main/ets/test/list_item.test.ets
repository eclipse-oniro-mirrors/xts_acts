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
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'

export default function list_itemOnSelectJsunit() {
  describe('list_itemOnSelectTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/list_item',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get list_item state success " + JSON.stringify(pages));
        if (!("list_item" == pages.name)) {
          console.info("get list_item state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push list_item page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push list_item page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("list_itemOnSelect after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testlist_itemOnSelect0001
     * @tc.desic         acelist_itemOnSelectEtsTest0001
     */
    it('testlist_itemOnSelect0001', 0, async function (done) {
      console.info('selectOnSelect testlist_itemOnSelect0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ListItem');
      console.info("[testlist_itemOnSelect0001] component border strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('ListItem');
      expect(obj.$attrs.editable).assertTrue();
      console.info("[testlist_itemOnSelect0001] editable value :" + obj.$attrs.editable);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testlist_itemOnSelect0002
     * @tc.desic         acelist_itemOnSelectEtsTest0002
     */
    it('testlist_itemOnSelect0002', 0, async function (done) {
      console.info('selectOnSelect testlist_itemOnSelect0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ListItem');
      console.info("[testlist_itemOnSelect0002] component border strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('ListItem');
      expect(obj.$attrs.selectable).assertFalse();
      console.info("[testlist_itemOnSelect0002] selectable value :" + obj.$attrs.selectable);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testlist_itemOnSelect0003
     * @tc.desic         acelist_itemOnSelectEtsTest0002
     */
    it('testlist_itemOnSelect0003', 0, async function (done) {
      console.info('selectOnSelect testlist_itemOnSelect0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ListItem');
      console.info("[testlist_itemOnSelect0003] component border strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('ListItem');
      expect(obj.$attrs.sticky).assertEqual("Sticky.None");
      console.info("[testlist_itemOnSelect0003] sticky value :" + obj.$attrs.sticky);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testlist_itemSwipeAction0004
     * @tc.desic         acelist_itemSwipeActionEtsTest0004
     */
    it('testlist_itemSwipeAction0004', 0, async function (done) {
      console.info('selectOnSelect testlist_itemSwipeAction0004 START');
      await Utils.sleep(2000);
      let obj = JSON.stringify(sendEventByKey('Del', 10, ""))
      expect(obj).assertEqual('true');
      done();
    });
  })
}
