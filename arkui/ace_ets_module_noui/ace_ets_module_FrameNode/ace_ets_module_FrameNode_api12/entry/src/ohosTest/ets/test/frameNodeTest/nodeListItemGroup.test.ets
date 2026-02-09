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
export default function nodeListItemGroup() {
  describe('nodeListItemGroup', () => {
    beforeEach(async (done: Function) => {
      console.info("nodeListItemGroup beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/nodeListItemGroup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get nodeListItemGroup state pages: " + JSON.stringify(pages));
        if (!("nodeListItemGroup" == pages.name)) {
          console.info("get nodeListItemGroup state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push nodeListItemGroup success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push nodeListItemGroup page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" nodeListItemGroup after each called");
    });


    /**
     * @tc.name   nodeListItemGroup_0100
     * @tc.number nodeListItemGroup_0100
     * @tc.desc   nodeListItemGroup_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('nodeListItemGroup_0100', Level.LEVEL0, async (done: Function) => {
      console.info('nodeListItemGroup_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.type('ListItemGroup'));
      let typeGroup = await button.getType();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('listItemGroup_node');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[nodeListItemGroup_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual(typeGroup);
      console.info('[nodeListItemGroup_0100] END');
      done();
    });
  })
}