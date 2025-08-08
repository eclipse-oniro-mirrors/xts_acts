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
export default function CanvasAttrsTabTest() {
  describe('CanvasAttrsTabTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CanvasAttrsTabTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/CanvasAttrsTabTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CanvasAttrsTabTest state pages: " + JSON.stringify(pages));
        if (!("CanvasAttrsTabTest" == pages.name)) {
          console.info("get CanvasAttrsTabTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CanvasAttrsTabTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasAttrsTabTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number
     * @tc.name      CanvasAttrsTabTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('CanvasAttrsTabTest_0100', 0, async (done: Function) => {
      console.info('CanvasAttrsTabTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // 页面加载
      let strJson1 = getInspectorByKey('visible_content');
      let strJson2 = getInspectorByKey('invisible_content');
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[CanvasAttrsTabTest_0100] visible_content is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[CanvasAttrsTabTest_0100] invisible_content is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('Canvas 1 is fully visible.');
      expect(obj2.$attrs.content).assertEqual('');

      // 切换至tab two页面
      let button = await driver.findComponent(ON.text('Tab two'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson1 = getInspectorByKey('visible_content');
      strJson2 = getInspectorByKey('invisible_content');
      obj1 = JSON.parse(strJson1);
      obj2 = JSON.parse(strJson2);
      console.info("[CanvasAttrsTabTest_0100] visible_content is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[CanvasAttrsTabTest_0100] invisible_content is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('Canvas 2 is fully visible.');
      expect(obj2.$attrs.content).assertEqual('Canvas 1 is completely invisible.');

      // 切换至tab three页面
      button = await driver.findComponent(ON.text('Tab three'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson1 = getInspectorByKey('visible_content');
      strJson2 = getInspectorByKey('invisible_content');
      obj1 = JSON.parse(strJson1);
      obj2 = JSON.parse(strJson2);
      console.info("[CanvasAttrsTabTest_0100] visible_content is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[CanvasAttrsTabTest_0100] invisible_content is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('Canvas 3 is fully visible.');
      expect(obj2.$attrs.content).assertEqual('Canvas 2 is completely invisible.');

      // 切换至tab one页面
      button = await driver.findComponent(ON.text('Tab one'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson1 = getInspectorByKey('visible_content');
      strJson2 = getInspectorByKey('invisible_content');
      obj1 = JSON.parse(strJson1);
      obj2 = JSON.parse(strJson2);
      console.info("[CanvasAttrsTabTest_0100] visible_content is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[CanvasAttrsTabTest_0100] invisible_content is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('Canvas 1 is fully visible.');
      expect(obj2.$attrs.content).assertEqual('Canvas 3 is completely invisible.');

      console.info('[CanvasAttrsTabTest_0100] END');
      done();
    });
  })
}

