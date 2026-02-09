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
export default function getListVisible() {
  describe('getListVisible', () => {
    beforeEach(async (done: Function) => {
      console.info("getListVisible beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ListItemGroup/getListVisible",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getListVisible state pages:" + JSON.stringify(pages));
        if (!("getListVisible" == pages.name)) {
          console.info("get getListVisible pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getListVisible page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getListVisible page error:" + err);
      }
      console.info("getListVisible beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getListVisible after each called");
    });

    /**
     * @tc.name   getListVisible_0100
     * @tc.number getListVisible_001
     * @tc.desc   Retrieve index information of List subcomponents based on coordinates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getListVisible_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[getListVisible_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.text('数学'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('list_getMess');
      console.info("[getListVisible_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getListVisible_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Item: index:0 itemIndex:1');
      console.info('[getListVisible_0100] END');
      done();
    });
  })
}
