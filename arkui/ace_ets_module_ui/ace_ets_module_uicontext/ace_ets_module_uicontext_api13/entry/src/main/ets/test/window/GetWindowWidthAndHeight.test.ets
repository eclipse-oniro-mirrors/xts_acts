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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function GetWindowWidthAndHeightTest() {
  describe('GetWindowWidthAndHeightTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetWindowWidthAndHeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/window/GetWindowWidthAndHeight",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetWindowWidthAndHeightTest state pages: " + JSON.stringify(pages));
        if (!("GetWindowWidthAndHeight" == pages.name)) {
          console.info("get GetWindowWidthAndHeightTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GetWindowWidthAndHeightTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetWindowWidthAndHeightTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   GetWindowWidthBreakpoint_0100
     * @tc.number GetWindowWidthBreakpoint_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetWindowWidthBreakpoint_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GetWindowWidthBreakpoint_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getWindowWidthBreakpointButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('getWindowWidth'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('widthBpValue');
      let obj: ESObject = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('windowWidthBreakpoint');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[GetWindowWidthBreakpoint_0100] component obj is: " + JSON.stringify(obj));
      console.info("[GetWindowWidthBreakpoint_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj.$attrs.content).assertEqual(obj1.$attrs.content)
      console.info('[GetWindowWidthBreakpoint_0100] END');
      done();
    });
    /**
     * @tc.name   GetWindowHeightBreakpoint_0200
     * @tc.number GetWindowHeightBreakpoint_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetWindowHeightBreakpoint_0200', Level.LEVEL0, async (done: Function) => {
      console.info('GetWindowHeightBreakpoint_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('getWindowHeightBreakpointButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('getWindowWidth'));
      await button2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('heightBpValue');
      let obj: ESObject = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('windowHeightBreakpoint');
      let obj1: ESObject = JSON.parse(strJson);
      console.info("[GetWindowHeightBreakpoint_0200] component obj is: " + JSON.stringify(obj));
      console.info("[GetWindowHeightBreakpoint_0200] component obj1 is: " + JSON.stringify(obj1));
      expect(obj.$attrs.content).assertEqual(obj1.$attrs.content);
      console.info('[GetWindowHeightBreakpoint_0200] END');
      done();
    });
  })
}