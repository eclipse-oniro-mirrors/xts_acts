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
export default function CanvasAttrsTest() {
  describe('CanvasAttrsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CanvasAttrsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/CanvasAttrsTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CanvasAttrsTest state pages: " + JSON.stringify(pages));
        if (!("CanvasAttrsTest" == pages.name)) {
          console.info("get CanvasAttrsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CanvasAttrsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasAttrsTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number
     * @tc.name      CanvasAttrsTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('CanvasAttrsTest_0100', 0, async (done: Function) => {
      console.info('CanvasAttrsTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('show_content');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CanvasAttrsTest_0100] content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Canvas is fully visible.');

      // 
      let button = await driver.findComponent(ON.id('swipe_bottom'));
      await button.click();
      await CommonFunc.sleep(2000);

      strJson = getInspectorByKey('show_content');
      obj = JSON.parse(strJson);
      console.info("[CanvasAttrsTest_0100] content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Canvas is completely invisible.');

      // 
      button = await driver.findComponent(ON.id('swipe_top'));
      await button.click();
      await CommonFunc.sleep(2000);

      strJson = getInspectorByKey('show_content');
      obj = JSON.parse(strJson);
      console.info("[CanvasAttrsTest_0100] content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Canvas is fully visible.');

      console.info('[CanvasAttrsTest_0100] END');
      done();
    });
  })
}

