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

import { expect, describe, it, beforeEach, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';

export default function FlexTypeNodeTest() {
  describe('FlexTypeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FlexTypeNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/FlexTypeNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FlexTypeNode state pages:" + JSON.stringify(pages));
        if (!("FlexTypeNodePage" == pages.name)) {
          console.info("get FlexTypeNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push FlexTypeNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexTypeNode page error:" + err);
      }
      console.info("FlexTypeNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("FlexTypeNode after each called");
    });

    /**
     * @tc.name   FlexTypeNodeTest_0100
     * @tc.number FlexTypeNodeTest_0100
     * @tc.desc   Test FlexTypeNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexTypeNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[FlexTypeNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[FlexTypeNodeTest_0100] Initial Flex attributes.");

      let strJson = getInspectorByKey('FlexTypeNodePage_typeNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[FlexTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[FlexTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[FlexTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');

      let button = await driver.findComponent(ON.id('FlexTypeNodePage_Btn'));
      await button.click();
      console.info("[FlexTypeNodeTest_0100] C modify Flex attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('FlexTypeNodePage_typeNode');
      obj = JSON.parse(strJson);
      console.info("[FlexTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[FlexTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[FlexTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('150.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      console.info('[FlexTypeNodeTest_0100] END');

      done();
    });
    /**
     * @tc.name   FlexTypeNodeTest_0200
     * @tc.number FlexTypeNodeTest_0200
     * @tc.desc   Test FlexTypeNodePage undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('FlexTypeNodeTest_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[FlexTypeNodeTest_0200] START');
      let driver = Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('FlexTypeNodePage_undefined'));
      await btn.click();
      console.info("[FlexTypeNodeTest_0200] Click FlexTypeNodePage_undefined.");
      await Utils.sleep(1000);

      console.info("[FlexTypeNodeTest_0200] AppStorage.get('FlexTypeNodePage'): " + AppStorage.get('FlexTypeNodePage'));
      expect(AppStorage.get('FlexTypeNodePage')).assertEqual(undefined);
      AppStorage.delete('FlexTypeNodePage')

      console.info('[FlexTypeNodeTest_0200] END');
      done();
    });
  })
}