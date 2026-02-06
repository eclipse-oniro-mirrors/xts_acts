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

export default function XComponentTypeNodeTest() {
  describe('XComponentTypeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("XComponentTypeNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/XComponentTypeNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get XComponentTypeNode state pages:" + JSON.stringify(pages));
        if (!("XComponentTypeNodePage" == pages.name)) {
          console.info("get XComponentTypeNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push XComponentTypeNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push XComponentTypeNode page error:" + err);
      }
      console.info("XComponentTypeNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("XComponentTypeNode after each called");
    });

    /**
     * @tc.number    XComponentTypeNodeTest_0100
     * @tc.name      XComponentTypeNodeTest_0100
     * @tc.desc      Test XComponentTypeNode
     * @tc.level     Level 1
     */
    it('XComponentTypeNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentTypeNodeTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info("[XComponentTypeNodeTest_0100] Initial XComponent attributes.");

      let strJson = getInspectorByKey('XComponentCrossLanguage_typeNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.enableSecure is: " + obj.$attrs.enableSecure);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.enableAnalyzer is: " + obj.$attrs.enableAnalyzer);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('200.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FF0000FF');
      expect(obj.$attrs.enableSecure).assertEqual('true');
      expect(obj.$attrs.enableAnalyzer).assertEqual('true');

      let button = await driver.findComponent(ON.id('XComponentTypeNodePage_Btn_C'));
      await button.click();
      console.info("[XComponentTypeNodeTest_0100] C modify XComponent attributes.");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentCrossLanguage_typeNode');
      obj = JSON.parse(strJson);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.enableSecure is: " + obj.$attrs.enableSecure);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.enableAnalyzer is: " + obj.$attrs.enableAnalyzer);
      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('200.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.enableSecure).assertEqual('true');
      expect(obj.$attrs.enableAnalyzer).assertEqual('false');

      button = await driver.findComponent(ON.id('XComponentTypeNodePage_Btn_TS'));
      await button.click();
      console.info("[XComponentTypeNodeTest_0100] C modify XComponent attributes.");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentCrossLanguage_typeNode');
      obj = JSON.parse(strJson);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.enableSecure is: " + obj.$attrs.enableSecure);
      console.info("[XComponentTypeNodeTest_0100] obj.$attrs.enableAnalyzer is: " + obj.$attrs.enableAnalyzer);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('200.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FF008000');
      expect(obj.$attrs.enableSecure).assertEqual('false');
      expect(obj.$attrs.enableAnalyzer).assertEqual('true');

      console.info('[XComponentTypeNodeTest_0100] END');
      done();
    });

    /**
     * @tc.number    XComponentTypeNodeTest_0200
     * @tc.name      XComponentTypeNodeTest_0200
     * @tc.desc      Test XComponentTypeNode
     * @tc.level     Level 1
     */
    it('XComponentTypeNodeTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentTypeNodeTest_0200] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('XComponentTypeNodePage_Btn_undefined'));
      await button.click();
      console.info("[XComponentTypeNodeTest_0200] Click XComponentTypeNodePage_Btn_undefined.");
      await CommonFunc.sleep(1000);

      console.info("[XComponentTypeNodeTest_0200] AppStorage.get('XComponentTypeNodePage'): " + AppStorage.get('XComponentTypeNodePage'));
      expect(AppStorage.get('XComponentTypeNodePage')).assertEqual(undefined);
      AppStorage.delete('XComponentTypeNodePage')

      console.info('[XComponentTypeNodeTest_0200] END');
      done();
    });
  })
}