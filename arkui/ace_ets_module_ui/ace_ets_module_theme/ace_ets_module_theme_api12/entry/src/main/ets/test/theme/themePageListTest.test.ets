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
export default function themePageListTest() {
  describe('themePageListTest', () => {
    beforeEach(async (done: Function) => {
      console.info("themePageListTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/theme/themePageListTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get themePageListTest state pages: " + JSON.stringify(pages));
        if (!("themePageListTest" == pages.name)) {
          console.info("get themePageListTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await Utils.sleep(2000);
          console.info("push themePageListTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push themePageListTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   themeListInterfaceTest_0100
     * @tc.number themeColorTest
     * @tc.desc   theme Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('themeListInterfaceTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('frameNodeGetInterfaceTest_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      // click to change the skin
      let button = await driver.findComponent(ON.id('themeClick'));
      await button.click();
      await Utils.sleep(2000);
      // test the color whether change
      let strJson = getInspectorByKey('1bg');
      console.info("[frameNodeGetInterfaceTest_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[frameNodeGetInterfaceTest_0100] component obj is: " + JSON.parse(strJson).$attrs.backgroundColor);
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual('#00000000');
      // simulate the longClick
      let listItem: Component = await driver.findComponent(ON.id('1bg'));
      listItem.longClick();
      // test the theme color whether change
      let strJson2 = getInspectorByKey('1bg');
      expect(JSON.parse(strJson2).$attrs.backgroundColor).assertEqual('#00000000');
      console.info('themeListInterfaceTest_0100 END');
      done();
    });
  })
}