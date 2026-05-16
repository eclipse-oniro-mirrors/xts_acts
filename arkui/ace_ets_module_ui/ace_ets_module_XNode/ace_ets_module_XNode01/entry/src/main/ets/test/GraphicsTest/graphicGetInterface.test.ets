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
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';

export default function graphicGetInterfaceTest() {
  describe('graphicGetInterfaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("graphicGetInterfaceTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/Graphics/graphicTestInterface",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get graphicGetInterfaceTest state pages: " + JSON.stringify(pages));
        if (!("graphicTestInterface" == pages.name)) {
          console.info("get graphicTestInterface state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push graphicTestInterface success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push graphicTestInterface page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   graphicTestInterfaceTest_0100
     * @tc.number graphicTestInterface
     * @tc.desc   setOvalShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTestInterfaceTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('graphicTestInterfaceTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('setOvalShape'));
      await button.click();
      await CommonFunc.sleep(1000);
      // get the data
      let strJson: string = getInspectorByKey('overLay');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[graphicTestInterfaceTest_0100] component obj is: " + JSON.stringify(obj));

      let graphic: RectValue = CommonFunc.getComponentRect('NodeContainerTest');
      let graphic_width = graphic.right - graphic.left;
      let graphic_height = graphic.bottom - graphic.top;
      expect(Math.floor(Math.abs(graphic_width - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(graphic_height - vp2px(150))) <= 1).assertTrue();
      
      console.info('[graphicTestInterfaceTest_0100 ] END');
      done();
    });
  })
}