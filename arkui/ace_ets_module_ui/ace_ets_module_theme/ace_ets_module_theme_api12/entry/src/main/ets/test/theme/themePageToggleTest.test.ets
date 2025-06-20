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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import Utils from '../Utils';

export default function themePageToggleTest() {
  describe('themePageToggleTest', () => {
    beforeEach(async (done:Function) =>{
      console.info("themePageTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/theme/themePageMgmtColorsTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get themePageMgmtColorsTest state pages: " + JSON.stringify(pages));
        if (!("themePageMgmtColorsTest" == pages.name)) {
          console.info("get themePageTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await Utils.sleep(2000);
          console.info("push themePageMgmtColorsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push themePageMgmtColorsTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number themeColorTest
     * @tc.name themeInterfaceIsValidTest_0100
     * @tc.desc theme Test
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('themeInterfaceIsValidTest_0100', 0, async (done:Function) =>{
      console.info('themeInterfaceIsValidTest_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      // click to change the skin
      let button = await driver.findComponent(ON.id('themeToggleClick'));
      await button.click();
      await Utils.sleep(2000);
      // test the color whether change
      let strJson = getInspectorByKey('toggleBg');
      console.info("[themeInterfaceIsValidTest_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[themeInterfaceIsValidTest_0100] component JSON.parse(strJson) is: " + JSON.parse(strJson).$attrs.backgroundColor);
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual('#00000000');
      console.info('[themeInterfaceIsValidTest_0100] END');
      done();
    });
  })
}

