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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton } from '@ohos.UiTest';
import { KeyCode } from '@kit.InputKit';

export default function XComponentCNodeTest() {
  describe('XComponentCNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("XComponentCNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/XComponentCNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get XComponentCNode state pages:" + JSON.stringify(pages));
        if (!("XComponentCNodePage" == pages.name)) {
          console.info("get XComponentCNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push XComponentCNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push XComponentCNode page error:" + err);
      }
      console.info("XComponentCNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("XComponentCNode after each called");
    });

    /**
     * @tc.name   XComponentCNodeTest_0100
     * @tc.number XComponentCNodeTest_0100
     * @tc.desc   Test XComponentCNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentCNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentCNodeTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info("[XComponentCNodeTest_0100] Initial XComponent attributes.");

      let strJson = getInspectorByKey('XComponentCrossLanguage_capiNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.enableSecure is: " + obj.$attrs.enableSecure);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.enableAnalyzer is: " + obj.$attrs.enableAnalyzer);
      expect(obj.$attrs.width).assertEqual('300.00vp');
      expect(obj.$attrs.height).assertEqual('200.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.enableSecure).assertEqual('false');
      expect(obj.$attrs.enableAnalyzer).assertEqual('false');

      let button = await driver.findComponent(ON.id('XComponentCNodePage_Btn_TS'));
      await button.click();
      console.info("[XComponentCNodeTest_0100] TS modify XComponent attributes.");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentCrossLanguage_capiNode');
      obj = JSON.parse(strJson);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.enableSecure is: " + obj.$attrs.enableSecure);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.enableAnalyzer is: " + obj.$attrs.enableAnalyzer);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('200.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FF008000');
      expect(obj.$attrs.enableSecure).assertEqual('true');
      expect(obj.$attrs.enableAnalyzer).assertEqual('true');

      button = await driver.findComponent(ON.id('XComponentCNodePage_Btn_C'));
      await button.click();
      console.info("[XComponentCNodeTest_0100] C modify XComponent attributes.");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentCrossLanguage_capiNode');
      obj = JSON.parse(strJson);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.enableSecure is: " + obj.$attrs.enableSecure);
      console.info("[XComponentCNodeTest_0100] obj.$attrs.enableAnalyzer is: " + obj.$attrs.enableAnalyzer);
      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('200.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.enableSecure).assertEqual('true');
      expect(obj.$attrs.enableAnalyzer).assertEqual('false');

      console.info('[XComponentCNodeTest_0100] END');
      done();
    });
  })
}