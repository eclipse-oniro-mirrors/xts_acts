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

 import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function XComponentDrawingCanvasTestTest() {
  describe('XComponentDrawingCanvasTestTest', () => {
    beforeEach(async (done: Function) => {
      console.info("XComponentDrawingCanvasTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/XComponentDrawingCanvasPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get XComponentDrawingCanvasTest state pages:" + JSON.stringify(pages));
        if (!("XComponentDrawingCanvasPage" == pages.name)) {
          console.info("get XComponentDrawingCanvasTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push XComponentDrawingCanvasTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push XComponentDrawingCanvasTest page error:" + err);
      }
      console.info("XComponentDrawingCanvasTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("XComponentDrawingCanvasTest after each called");
    });
/**
     * @tc.number    XComponentDrawingCanvasTest_0100
     * @tc.name      XComponentDrawingCanvasTest_0100
     * @tc.desc      Test XComponentDrawingCanvasTest
     * @tc.level     Level 2
     */
    it('XComponentDrawingCanvasTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[XComponentDrawingCanvasTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('XComponentDrawingCanvas_btn'));
      await button.click();
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('XComponent1_lock1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentDrawingCanvasTest_0100] XComponent1_lock1 content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('ok');

      strJson = getInspectorByKey('XComponent1_lock2');
      obj = JSON.parse(strJson);
      console.info("[XComponentDrawingCanvasTest_0100] XComponent1_lock2 content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('ok');

      strJson = getInspectorByKey('XComponent1_lock3');
      obj = JSON.parse(strJson);
      console.info("[XComponentDrawingCanvasTest_0100] XComponent1_lock3 content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('ok');

      strJson = getInspectorByKey('XComponent2_lock1');
      obj = JSON.parse(strJson);
      console.info("[XComponentDrawingCanvasTest_0100] XComponent2_lock1 content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('ok');

      strJson = getInspectorByKey('XComponent2_lock2');
      obj = JSON.parse(strJson);
      console.info("[XComponentDrawingCanvasTest_0100] XComponent2_lock2 content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('ok');

      strJson = getInspectorByKey('XComponent2_lock3');
      obj = JSON.parse(strJson);
      console.info("[XComponentDrawingCanvasTest_0100] XComponent2_lock3 content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('ok');

      console.info('[XComponentDrawingCanvasTest_0100] END');
      done();
    });
  })
}