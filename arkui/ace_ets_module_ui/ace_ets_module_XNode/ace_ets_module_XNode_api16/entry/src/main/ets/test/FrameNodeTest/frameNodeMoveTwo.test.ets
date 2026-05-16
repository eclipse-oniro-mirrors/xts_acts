/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function frameNodeMoveTwoTest() {
  describe('frameNodeMoveTwoTest', () => {
    beforeEach(async (done: Function) => {
      console.info("frameNodeMoveTwoTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeMoveTwoTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeMoveTwoTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get frameNodeMoveTwoTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push frameNodeMoveTwoTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeMoveTwoTest page error:" + err);
      }
      console.info("frameNodeMoveTwoTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("frameNodeMoveTwoTest after each called");
    });

    /**
     * @tc.name   frameNodeMoveTwoTest_0100
     * @tc.number frameNodeMoveTwoTest_0100
     * @tc.desc   frameNode: test UINode node move
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('frameNodeMoveTwoTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('frameNodeMoveTwoTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('customPopupOptions_id'));
      await button1.click();
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('popup_id'));
      await button2.click();

      await CommonFunc.sleep(1000);
      let strJson1: string = getInspectorByKey('frame1ChildCount');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[frameNodeMoveTwoTest_0100] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      let strJson2: string = getInspectorByKey('frame2ChildCount');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[frameNodeMoveTwoTest_0100] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      let strJson3: string = getInspectorByKey('frame3ChildCount');
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[frameNodeMoveTwoTest_0100] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('0');
      expect(obj2.$attrs.content).assertEqual('1');
      expect(obj2.$attrs.content).assertEqual('1');
      console.info('[frameNodeMoveTwoTest_0100] END');
      done();
    });

  })
}