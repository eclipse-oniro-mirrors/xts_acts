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

export default function RowTypeNodeTest() {
  describe('RowTypeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RowTypeNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/row/RowTypeNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowTypeNode state pages:" + JSON.stringify(pages));
        if (!("RowTypeNodePage" == pages.name)) {
          console.info("get RowTypeNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push RowTypeNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowTypeNode page error:" + err);
      }
      console.info("RowTypeNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("RowTypeNode after each called");
    });

    /**
     * @tc.number    RowTypeNodeTest_0100
     * @tc.name      RowTypeNodeTest_0100
     * @tc.desc      Test RowTypeNode
     * @tc.level     Level 1
     */
    it('RowTypeNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[RowTypeNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[RowTypeNodeTest_0100] Initial Row attributes.");

      let strJson = getInspectorByKey('RowTypeNodePage_typeNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RowTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[RowTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[RowTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');

      let button = await driver.findComponent(ON.id('RowTypeNodePage_Btn'));
      await button.click();
      console.info("[RowTypeNodeTest_0100] C modify Row attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('RowTypeNodePage_typeNode');
      obj = JSON.parse(strJson);
      console.info("[RowTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[RowTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[RowTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('150.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      console.info('[RowTypeNodeTest_0100] END');

      done();
    });
    /**
     * @tc.number    RowTypeNodeTest_0200
     * @tc.name      RowTypeNodeTest_0200
     * @tc.desc      Test RowTypeNodePage undefined.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('RowTypeNodeTest_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[RowTypeNodeTest_0200] START');
      let driver = Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('RowTypeNodePage_undefined'));
      await btn.click();
      console.info("[RowTypeNodeTest_0200] Click RowTypeNodePage_undefined.");
      await Utils.sleep(1000);

      console.info("[RowTypeNodeTest_0200] AppStorage.get('RowTypeNodePage'): " + AppStorage.get('RowTypeNodePage'));
      expect(AppStorage.get('RowTypeNodePage')).assertEqual(undefined);
      AppStorage.delete('RowTypeNodePage')

      console.info('[RowTypeNodeTest_0200] END');
      done();
    });
  })
}