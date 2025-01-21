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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, UiDirection, MouseButton, UIElementInfo, UIEventObserver} from '@ohos.UiTest';
export default function aboutToAppearTest() {
  describe('aboutToAppearTest', function () {
    beforeEach(async function (done) {
      console.info("aboutToAppearTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Com_Attr/aboutToAppear',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get aboutToAppearTest state pages:" + JSON.stringify(pages));
        if (!("aboutToAppear" == pages.name)) {
          console.info("get WaterFlow_WaterFlow pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push aboutToAppearTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push aboutToAppearTest page error:" + err);
      }
      console.info("aboutToAppearTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("aboutToAppearTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_aboutToAppearTest_0100
     * @tc.name      aboutToAppearTest
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('aboutToAppearTest_0100', 0, async function (done) {
      console.info('[aboutToAppearTest_0100] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('aboutToAppear'));
      await CommonFunc.sleep(1000);
      await button.longClick();
      await CommonFunc.sleep(3000);
      let closeButton: Component = await driver.findComponent(ON.id('close'));
      let point = await closeButton.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.click(point.x, point.y)
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('aboutToAppear');
      let obj = JSON.parse(strJson);
      console.info("[aboutToAppearTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[aboutToAppearTest_0100] component obj is: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual("#FFFF0000");
      console.info('[aboutToAppearTest_0100] END');
      await CommonFunc.sleep(3000);
      done();
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_aboutToAppearTest_0200
     * @tc.name      aboutToAppearTest
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('aboutToAppearTest_0200', 0, async function (done) {
      console.info('[aboutToAppearTest_0200] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('aboutToAppear'));
      await CommonFunc.sleep(1000);
      await button.longClick();
      await CommonFunc.sleep(3000);
      let closeButton: Component = await driver.findComponent(ON.id('close'));
      let point = await closeButton.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.click(point.x, point.y)
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('aboutToAppear');
      let obj = JSON.parse(strJson);
      console.info("[aboutToAppearTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[aboutToAppearTest_0200] component obj is: " + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual("#FF0000FF");
      console.info('[aboutToAppearTest_0200] END');
      await CommonFunc.sleep(3000);
      done();
    });
  })
}
