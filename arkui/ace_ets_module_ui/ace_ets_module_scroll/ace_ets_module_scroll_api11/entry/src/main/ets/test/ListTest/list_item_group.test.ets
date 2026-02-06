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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils.ets'

export default function list_item_groupJsunit() {
  describe('list_item_groupJsunit', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/list_item_group',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get list_item_group state success " + JSON.stringify(pages));
        if (!("list_item" == pages.name)) {
          console.info("get list_item_group state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push list_item_group page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push list_item_group page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("list_item_group after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testlist_itemOnSelect0001
     * @tc.desic         acelist_itemOnSelectEtsTest0001
     */
    it('testlist_item_group0001', Level.LEVEL1, async (done: Function) => {
      console.info('testcase testlist_item_group0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Mon');
      console.info("[testlist_item_group0001] component state strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('ListItemGroup');
      console.info("[testlist_item_group0001] editable value :" + JSON.parse(strJson).$type);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testlist_itemOnSelect0002
     * @tc.desic         acelist_itemOnSelectEtsTest0002
     */
    it('testlist_item_group0002', Level.LEVEL1, async (done: Function) => {
      console.info('testcase testlist_item_group0002 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Tues');
      console.info("[testlist_item_group0002] component border strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('ListItemGroup');
      console.info("[testlist_item_group0002] selectable value :" + JSON.parse(strJson).$type);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testlist_itemOnSelect0003
     * @tc.desic         acelist_itemOnSelectEtsTest0002
     */
    it('testlist_item_group0003', Level.LEVEL1, async (done: Function) => {
      console.info('testcase testlist_item_group0003 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Wens');
      console.info("[testlist_item_group0003] component border strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('ListItemGroup');
      expect(JSON.parse(strJson).$attrs.header).assertNotEqual(undefined);
      console.info("[testlist_itemOnSelect0003] hear value :" + JSON.parse(strJson).$attrs.header);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testlist_itemSwipeAction0004
     * @tc.desic         acelist_itemSwipeActionEtsTest0004
     */
    it('testlist_item_group0004', Level.LEVEL1, async (done: Function) => {
      console.info('testcase testlist_item_group0004 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Thurs');
      console.info("[testlist_item_group0004] component border strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('ListItemGroup');
      expect(JSON.parse(strJson).$attrs.rooter).assertNotEqual(undefined);
      console.info("[testlist_item_group0004] hear value :" + JSON.parse(strJson).$attrs.rooter);
      done();
    });
  })
}
