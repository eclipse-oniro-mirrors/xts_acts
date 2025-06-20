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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function APIdisposeTreeTest() {
  describe('APIdisposeTreeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APIdisposeTreeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/APIdisposeTree",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIdisposeTreeTest state pages: " + JSON.stringify(pages));
        if (!("APIdisposeTree" == pages.name)) {
          console.info("get APIdisposeTreeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push APIdisposeTreeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIdisposeTreeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    APIdisposeTreeTest_0100
     * @tc.name      APIdisposeTreeTest_0100
     * @tc.desc      frameNode: APIdisposeTree
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('APIdisposeTreeTest_0100', 0, async (done: Function) => {
      console.info('APIdisposeTreeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('APIdisposeTree_Button2'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('APIdisposeTree_Button1'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let button3 = await driver.findComponent(ON.id('APIdisposeTree_Text'));
      await button3.click();
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('APIdisposeTree_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[APIdisposeTreeTest_0100] component obj is: ",obj, obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('start700');
      console.info('[APIdisposeTreeTest_0100] END');
      done();
    });    
  })
}

