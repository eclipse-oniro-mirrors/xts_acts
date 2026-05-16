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

export default function ColumnTypeNodeTest() {
  describe('ColumnTypeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ColumnTypeNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnTypeNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnTypeNode state pages:" + JSON.stringify(pages));
        if (!("ColumnTypeNodePage" == pages.name)) {
          console.info("get ColumnTypeNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ColumnTypeNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnTypeNode page error:" + err);
      }
      console.info("ColumnTypeNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ColumnTypeNode after each called");
    });

    /**
     * @tc.name   ColumnTypeNodeTest_0100
     * @tc.number ColumnTypeNodeTest_0100
     * @tc.desc   Test ColumnTypeNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ColumnTypeNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ColumnTypeNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[ColumnTypeNodeTest_0100] Initial Column attributes.");

      let strJson = getInspectorByKey('ColumnTypeNodePage_typeNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ColumnTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[ColumnTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[ColumnTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('100.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');

      let button = await driver.findComponent(ON.id('ColumnTypeNodePage_Btn'));
      await button.click();
      console.info("[ColumnTypeNodeTest_0100] C modify Column attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('ColumnTypeNodePage_typeNode');
      obj = JSON.parse(strJson);
      console.info("[ColumnTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[ColumnTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[ColumnTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('150.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      console.info('[ColumnTypeNodeTest_0100] END');

      done();
    });
    /**
     * @tc.name   ColumnTypeNodeTest_0200
     * @tc.number ColumnTypeNodeTest_0200
     * @tc.desc   Test ColumnTypeNodePage undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ColumnTypeNodeTest_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[ColumnTypeNodeTest_0200] START');
      let driver = Driver.create();
      await Utils.sleep(1000);

      let btn = await driver.findComponent(ON.id('ColumnTypeNodePage_undefined'));
      await btn.click();
      console.info("[ColumnTypeNodeTest_0200] Click ColumnTypeNodePage_undefined.");
      await Utils.sleep(1000);

      console.info("[ColumnTypeNodeTest_0200] AppStorage.get('ColumnTypeNodePage'): " + AppStorage.get('ColumnTypeNodePage'));
      expect(AppStorage.get('ColumnTypeNodePage')).assertEqual(undefined);
      AppStorage.delete('ColumnTypeNodePage')

      console.info('[ColumnTypeNodeTest_0200] END');
      done();
    });
  })
}