/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
export default function CanvasParamsVisibilityTest() {
  describe('CanvasParamsVisibilityTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CanvasParamsVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/CanvasParamsVisibilityPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CanvasParamsVisibilityTest state pages: " + JSON.stringify(pages));
        if (!("CanvasParamsVisibilityTest" == pages.name)) {
          console.info("get CanvasParamsVisibilityTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push CanvasParamsVisibilityTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasParamsVisibilityTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CanvasParamsVisibilityTest_0100
     * @tc.number SUB_ARKUI_API_CanvasParamsVisibilityTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CanvasParamsVisibilityTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('CanvasParamsVisibilityTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // Drawing takes effect
      let button = await driver.findComponent(ON.id('CanvasParamsVisibilityPage_btn_draw'));
      await button.click();
      await CommonFunc.sleep(500);
      console.info('CanvasParamsVisibilityTest_0100 click draw');

      button = await driver.findComponent(ON.id('CanvasParamsVisibilityPage_btn_reset'));
      await button.click();
      await CommonFunc.sleep(500);
      console.info('CanvasParamsVisibilityTest_0100 click reset');

      button = await driver.findComponent(ON.id('CanvasParamsVisibilityPage_btn_visibility'));
      await button.click();
      await CommonFunc.sleep(500);
      console.info('CanvasParamsVisibilityTest_0100 change visibility is Visibility.Hidden');

      // Drawing does not take effect
      button = await driver.findComponent(ON.id('CanvasParamsVisibilityPage_btn_draw'));
      await button.click();
      await CommonFunc.sleep(500);
      console.info('CanvasParamsVisibilityTest_0100 click draw 2');

      button = await driver.findComponent(ON.id('CanvasParamsVisibilityPage_btn_visibility'));
      await button.click();
      await CommonFunc.sleep(500);
      console.info('CanvasParamsVisibilityTest_0100 change visibility is Visibility.Visible');

      // Drawing takes effect
      button = await driver.findComponent(ON.id('CanvasParamsVisibilityPage_btn_draw'));
      await button.click();
      await CommonFunc.sleep(500);
      console.info('CanvasParamsVisibilityTest_0100 click draw 3');

      // ErrorCode: 103702
      button = await driver.findComponent(ON.id('CanvasParamsVisibilityPage_btn_error'));
      await button.click();
      await CommonFunc.sleep(500);
      console.info('CanvasParamsVisibilityTest_0100 click CanvasParamsVisibilityPage_btn_error');
      console.info('CanvasParamsVisibilityTest_0100 errorcode: ' + AppStorage.get('CanvasParamsVisibilityPage_errorcode'));
      expect(AppStorage.get('CanvasParamsVisibilityPage_errorcode')).assertEqual(103702);
      AppStorage.delete('CanvasParamsVisibilityPage_errorcode')

      console.info('[CanvasParamsVisibilityTest_0100] END');
      done();
    });
  })
}