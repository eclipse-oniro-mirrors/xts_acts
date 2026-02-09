/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function BorderRadiusRenderStrategyTest() {
  describe('BorderRadiusRenderStrategyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("BorderRadiusRenderStrategyTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonAttrs/BorderRadiusRenderStrategy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BorderRadiusRenderStrategy state pages: " + JSON.stringify(pages));
        if (!("BorderRadiusRenderStrategy" == pages.name)) {
          console.info("get VideoSupportMorBorderRadiusRenderStrategyeSpeed state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push BorderRadiusRenderStrategy success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BorderRadiusRenderStrategy page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   BorderRadiusRenderStrategyTest_0100
     * @tc.number SUB_ARKUI_API_BorderRadiusRenderStrategyTest_0100
     * @tc.desc   CommonCustomAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BorderRadiusRenderStrategyTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[BorderRadiusRenderStrategyTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('RenderStrategyNull'));
      await button1.click();
      await Utils.sleep(1000)
      let strJson1 = getInspectorByKey('RenderStrategyText');

      let button2 = await driver.findComponent(ON.id('RenderStrategyUndefined'));
      await button2.click();
      await Utils.sleep(1000)
      let strJson2 = getInspectorByKey('RenderStrategyText');

      let button3 = await driver.findComponent(ON.id('RenderStrategyFast'));
      await button3.click();
      await Utils.sleep(1000)
      let strJson3 = getInspectorByKey('RenderStrategyText');

      let button4 = await driver.findComponent(ON.id('RenderStrategyOffscreen'));
      await button4.click();
      await Utils.sleep(1000)
      let strJson4 = getInspectorByKey('RenderStrategyText');

      expect(JSON.parse(strJson1).$attrs.content).assertEqual('null');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('undefined');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('0');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('1');

      console.info('[BorderRadiusRenderStrategyTest_0100] END');
      done();
    });
  })
}
