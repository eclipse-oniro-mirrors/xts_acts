/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function nodeList() {
  describe('nodeList', () => {
    beforeEach(async (done: Function) => {
      console.info("nodeList beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/nodeList',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get nodeList state pages: " + JSON.stringify(pages));
        if (!("nodeList" == pages.name)) {
          console.info("get nodeList state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push nodeList success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push nodeList page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" nodeList after each called");
    });
    /* *
    * @tc.number: SUB_ACE_TYPENODE_LIST_0100
    * @tc.name  : nodeList_0100
    * @tc.desc  : List type FrameNode node
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */


    it('nodeList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('nodeList_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.type('List'));
      let type1 = await button.getType();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_node');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nodeList_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual(type1);
      console.info('[nodeList_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_TYPENODE_LISTITEM_0100
    * @tc.name  : nodeList_0100
    * @tc.desc  : ListItem type FrameNode node
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */


    it('nodeList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('nodeList_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('listItem_node');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nodeList_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('ListItem');
      console.info('[nodeList_0100] END');
      done();
    });
  })
}