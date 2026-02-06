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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from "../../MainAbility/common/Common";

export default function UIfontTest() {
  describe('UIfontTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIfontTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Font/UIfontTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIfontTest state pages: " + JSON.stringify(pages));
        if (!("UIfontTest" == pages.name)) {
          console.info("get UIfontTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push UIfontTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIfontTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   UIfont_001
     * @tc.number SUB_ACE_ArkUI_font_001
     * @tc.desc   font fontDir test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UIfont_001', Level.LEVEL2, async (done: Function) => {

      console.info('[UIfont_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('UIfont_fontDir'));
      await button.click();
      console.info("click success");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('UIfont_Text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[UIfont_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('1');

      console.info('[UIfont_001] END');
      done();
    });

    /**
     * @tc.name   UIfont_002
     * @tc.number SUB_ACE_ArkUI_font_002
     * @tc.desc   font generic test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UIfont_002', Level.LEVEL2, async (done: Function) => {

      console.info('[UIfont_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('UIfont_generic'));
      await button.click();
      console.info("click success");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('UIfont_Text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[UIfont_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('3');

      console.info('[UIfont_002] END');
      done();
    });

    /**
     * @tc.name   UIfont_003
     * @tc.number SUB_ACE_ArkUI_font_003
     * @tc.desc   font fallbackGroups test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UIfont_003', Level.LEVEL2, async (done: Function) => {

      console.info('[UIfont_003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('UIfont_fallbackGroups'));
      await button.click();
      console.info("click success");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('UIfont_Text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[UIfont_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('1');

      console.info('[UIfont_003] END');
      done();
    });

    /**
     * @tc.name   UIfont_004
     * @tc.number SUB_ACE_ArkUI_font_004
     * @tc.desc   font alias test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UIfont_004', Level.LEVEL2, async (done: Function) => {

      console.info('[UIfont_004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('UIfont_alias'));
      await button.click();
      console.info("click success");
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('UIfont_Text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[UIfont_004] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('5');

      console.info('[UIfont_004] END');
      done();
    });
  })
}
