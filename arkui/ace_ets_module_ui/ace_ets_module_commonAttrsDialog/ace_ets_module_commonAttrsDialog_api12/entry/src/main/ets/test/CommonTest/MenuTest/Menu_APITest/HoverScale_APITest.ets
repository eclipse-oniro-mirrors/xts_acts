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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function HoverScale_APITest() {
  describe('HoverScale_APITest', () => {
    beforeEach(async (done: Function) => {
      console.info("HoverScale_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Common/Menu/Menu_API/HoverScale",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get HoverScale_APITest state pages: " + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get HoverScale_APITest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push HoverScale_APITest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push HoverScale_APITest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    HoverScale
     * @tc.name      HoverScale_APITest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('HoverScale_APITest_0100', 0, async (done: Function) => {
      console.info('HoverScale_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('btn'));
      let row: Component = await driver.findComponent(ON.id('row'));
      let point = await row.getBoundsCenter();
      await btn.click();
      await CommonFunc.sleep(5000);
      await driver.click(Math.round(point.x/2), Math.round(point.y/4));
      await CommonFunc.sleep(1000);
      let hoverScale = getInspectorByKey('hoverScale');
      console.info("[HoverScale_APITest_0100] hoverScale attrs is: " + JSON.stringify(JSON.parse(hoverScale).$attrs));
      expect(JSON.parse(hoverScale).$attrs.content).assertEqual('hoverScale');
      console.info('[HoverScale_APITest_0100] END');
      done();
    });
  })
}