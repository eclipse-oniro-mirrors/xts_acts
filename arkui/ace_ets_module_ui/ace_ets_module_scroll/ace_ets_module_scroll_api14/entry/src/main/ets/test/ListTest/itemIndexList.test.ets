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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
export default function itemIndexList() {
  describe('itemIndexList', () => {
    beforeEach(async (done: Function) => {
      console.info("itemIndexList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/itemIndexList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get itemIndexList state pages:" + JSON.stringify(pages));
        if (!("itemIndexList" == pages.name)) {
          console.info("get itemIndexList pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push itemIndexList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push itemIndexList page error:" + err);
      }
      console.info("itemIndexList beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("itemIndexList after each called");
    });

    /**
     * @tc.name   itemIndexList_0100
     * @tc.number itemIndexList_001
     * @tc.desc   Retrieve the index of subcomponents through coordinates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('itemIndexList_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[itemIndexList_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.text('item-3'));
      await btn.longClick();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('listItem_Index');
      console.info("[itemIndexList_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[itemIndexList_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item_Index: 3');
      console.info('[itemIndexList_0100] END');
      done();
    });
  })
}
