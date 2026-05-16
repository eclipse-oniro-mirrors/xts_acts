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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';

export default function RenderNodeBlurTest() {
  describe('RenderNodeBlurTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RenderNodeBlurTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/RenderNode/RenderNodeBlur",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RenderNodeBlur state pages: " + JSON.stringify(pages));
        if (!("RenderNodeBlur" == pages.name)) {
          console.info("get RenderNodeBlur state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push RenderNodeBlur success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RenderNodeBlur page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   RenderNodeBlurTest_0100
     * @tc.number SUB_ARKUI_API_RenderNodeBlurTest_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RenderNodeBlurTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[RenderNodeBlurTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('setBackgroundBlur'));
      await button1.click();
      await CommonFunc.sleep(2000);

      let button2 = await driver.findComponent(ON.id('setContentBlur'));
      await button2.click();
      await CommonFunc.sleep(2000);

      let button3 = await driver.findComponent(ON.id('setForegroundBlur'));
      await button3.click();
      await CommonFunc.sleep(2000);

      let button4 = await driver.findComponent(ON.id('clearBlurEffects'));
      await button4.click();
      await CommonFunc.sleep(2000);

      let button5 = await driver.findComponent(ON.id('getBlurConfigs'));
      await button5.click();
      await CommonFunc.sleep(2000);

      let button6 = await driver.findComponent(ON.id('setAndGetUndefined'));
      await button6.click();
      await CommonFunc.sleep(2000);

      console.info('RenderNodeBlur backgroundBlurRadiusUndefined:' + AppStorage.get('backgroundBlurRadiusUndefined'))
      console.info('RenderNodeBlur backgroundBlurGrayscaleUndefined:' + AppStorage.get('backgroundBlurGrayscaleUndefined'))
      console.info('RenderNodeBlur contentBlurRadiusUndefined:' + AppStorage.get('contentBlurRadiusUndefined'))
      console.info('RenderNodeBlur contentBlurGrayscaleUndefined:' + AppStorage.get('contentBlurGrayscaleUndefined'))
      console.info('RenderNodeBlur foregroundBlurRadiusUndefined:' + AppStorage.get('foregroundBlurRadiusUndefined'))

      expect(AppStorage.get('backgroundBlurRadiusUndefined')).assertDeepEquals(0);
      AppStorage.delete('backgroundBlurRadiusUndefined')
      expect(AppStorage.get('backgroundBlurGrayscaleUndefined')).assertDeepEquals([0,0]);
      AppStorage.delete('backgroundBlurGrayscaleUndefined')
      expect(AppStorage.get('contentBlurRadiusUndefined')).assertDeepEquals(0);
      AppStorage.delete('contentBlurRadiusUndefined')
      expect(AppStorage.get('contentBlurGrayscaleUndefined')).assertDeepEquals([0,0]);
      AppStorage.delete('contentBlurGrayscaleUndefined')
      expect(AppStorage.get('foregroundBlurRadiusUndefined')).assertDeepEquals(0);
      AppStorage.delete('foregroundBlurRadiusUndefined')
      
      console.info('[RenderNodeBlurTest_0100 ] END');
      done();
    });
  })
}