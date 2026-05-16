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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function GetGlobalPositionOnDisplayTest() {
  describe('GetGlobalPositionOnDisplayTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetGlobalPositionOnDisplayTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/GetGlobalPositionOnDisplayTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetGlobalPositionOnDisplayTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GetGlobalPositionOnDisplayTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GetGlobalPositionOnDisplayTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetGlobalPositionOnDisplayTest page error:" + err);
      }
      console.info("GetGlobalPositionOnDisplayTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetGlobalPositionOnDisplayTest after each called");
    });

    /**
     * @tc.name   GetGlobalPositionOnDisplayTest_0100
     * @tc.number GetGlobalPositionOnDisplayTest_0100
     * @tc.desc   FrameNode getGlobalPositionOnDisplay test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetGlobalPositionOnDisplayTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GetGlobalPositionOnDisplayTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_getGlobalPositionOnDisplay'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1: string = getInspectorByKey('text_getGlobalPositionOnDisplay');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[GetGlobalPositionOnDisplayTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[GetGlobalPositionOnDisplayTest_0100] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('true');
      console.info('[GetGlobalPositionOnDisplayTest_0100] END');
      done();
    });
  })
}